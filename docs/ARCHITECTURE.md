# Architekturentscheidungen (Phase A und B)

Verbindlich für den MVP. Änderungen nur per dokumentierter Entscheidung in diesem Dokument.

## 1. Stack

| Ebene | Entscheidung | Anmerkung |
|---|---|---|
| Framework | Next.js (App Router), TypeScript strict | Eine Codebasis für UI und Server-Routen |
| Styling | Tailwind CSS | Dunkles Theme, Komponentenbibliothek selbst klein halten |
| 3D | React Three Fiber + Drei | Erst ab Phase C. Phase B ist reines 2D |
| UI-State | Zustand | Nur UI-Zustand, Auswahl, Caches. Nie Spielwahrheit |
| Auth + DB | Supabase (Auth, Postgres, RPC) | Spiel-Logik in Postgres-Funktionen (`security definer`, fester `search_path`) |
| Validierung | Zod | Jede Server-Route validiert Eingaben |
| Tests | Vitest (Unit), pgTAP oder SQL-Tests (RLS, Funktionen), Playwright (E2E) | Concurrency-Tests gegen echte Postgres-Instanz |
| Hosting | Vercel + Supabase | Staging- und Prod-Projekt getrennt |
| CI | GitHub Actions | Lint, Typecheck, Tests, Supabase-Migrations-Dry-Run |

Versionen beim Projektstart fest pinnen und in `package.json` eintragen. Kein `latest`.

## 2. Server-autoritatives Spiel

```
Client ──POST /api/game/*──> Next.js Route (Auth, Zod) ──RPC──> Postgres-Funktion ──> Tabellen
                                                                      │
                                                                      └── game_ledger (append-only)
```

- Jede spielwertverändernde Aktion ist genau eine Postgres-Funktion mit einer Transaktion.
- Die Funktion sperrt die betroffene `accounts`-Zeile (`FOR UPDATE`), prüft Voraussetzungen, bucht, schreibt Ledger, gibt Ergebnis zurück.
- Idempotenz: jede Aktion trägt einen vom Client erzeugten `idempotency_key`; Unique-Constraint auf `(owner_id, idempotency_key)`. Wiederholung liefert dieselbe Antwort.
- Zeit: ausschließlich `now()` der Datenbank. Der Client bekommt `server_now` mit jedem State-Response und berechnet nur die Anzeige.
- Zufall: pro Job ein serverseitiger Seed, gespeichert am Job. Reward-Berechnung ist deterministisch aus Seed und Snapshot.

## 3. Minimales Schema für den MVP

Reihenfolge der Migrationen:

1. `profiles`, `accounts` (1:1 zu `auth.users`)
2. `creators`, `creator_skills`
3. `production_jobs`, `game_ledger`
4. `studio_upgrades`
5. `contracts`, `contract_assignments`
6. `events`, `event_missions`, `mission_entries` (erst Phase D/E)

Pflicht-Constraints:

- `game_ledger` UNIQUE `(source_type, source_id, currency)`
- `production_jobs.status` CHECK IN (`running`, `completed`, `claimed`, `cancelled`)
- `accounts.credits` CHECK `>= 0`
- Alle Zeitstempel `timestamptz`
- Indexe auf `owner_id` und `completes_at`

## 4. RLS-Prinzip

- `SELECT`: Spieler sieht nur eigene Zeilen (`owner_id = auth.uid()`).
- `INSERT/UPDATE/DELETE` durch Clients: **auf keiner Spieltabelle erlaubt.** Schreiben nur über RPC-Funktionen.
- Leaderboards über eine View mit bewusst freigegebenen Spalten.
- Admin-Tabellen (Events, Review) über separate Rolle, nie über den anon-Key.

## 5. Kernfunktionen (Phase B)

| Funktion | Zweck |
|---|---|
| `game_start_production(creator_id, kind, strategy, idempotency_key)` | Prüft Slot, Credits, Level; bucht; legt Job mit `completes_at` an |
| `game_claim_production(job_id, idempotency_key)` | Prüft `now() >= completes_at` und `claimed_at IS NULL`; zahlt genau einmal aus |
| `game_start_upgrade(upgrade_key, idempotency_key)` | Bucht Kosten, speichert neue Stufe |
| `game_get_state()` | Liefert Account, Creator, Jobs, Upgrades, `server_now` |

Jede Funktion bekommt mindestens: Happy-Path-Test, Test auf fehlende Credits, Test auf Doppelaufruf, Test auf fremde Ressource (RLS), Concurrency-Test mit zwei parallelen Transaktionen.

## 6. Bewusst verschoben

- 3D-Szene (Phase C). Der MVP-Loop muss in 2D Spaß machen, sonst rettet 3D ihn nicht.
- Event-Scout und externe KI-Aufrufe (Phase F).
- Agenturen, Chat, Echtgeld (nach MVP, teils nie).
