# Arbeitsregeln für Coding-Agenten

Gilt für Claude Code, Cursor, Codex und menschliche Entwickler gleichermaßen.

## Vor jeder Aufgabe lesen

1. `docs/ARCHITECTURE.md` (verbindliche Entscheidungen)
2. `docs/ECONOMY.md` (Spielwerte, Änderungsregeln)
3. Die Feature-Dateien, die die Aufgabe berührt

## Grundregeln

1. **Eine vertikale Funktion pro Iteration.** Migration, Backend, Frontend und Tests gehören zusammen in einen Change.
2. **Der Client ist nie autoritativ.** Credits, XP, Follower, Rewards und Timer werden ausschließlich serverseitig verändert. Der Browser zeigt an, er entscheidet nicht.
3. **Spielwert-Änderungen sind Transaktionen.** Start und Claim einer Produktion laufen in einer Postgres-Funktion mit Sperre, Idempotency-Key und Ledger-Eintrag.
4. **Economy-Regeln nicht ohne Test und Eintrag in `docs/ECONOMY.md` ändern.**
5. **Row Level Security auf jeder exponierten Tabelle.** Neue Tabelle ohne Policy ist ein Fehler, kein Nachtrag.
6. **Keine Secrets im Frontend.** Service-Role-Key, Asset-Generator-Keys und KI-Keys nur serverseitig.
7. **Platzhalter vor Assets.** Erst prozedurale Geometrie, dann GLB. Jede Szene braucht einen 2D-Fallback.
8. **Lauffähig auf schwachen Geräten.** Mobile-Viewport und Reduced Motion werden mitgetestet.
9. **Vor Abschluss:** `lint`, `typecheck`, Unit-, Integrations- und RLS-Tests ausführen und Ergebnis unverfälscht melden.
10. **Am Ende der Iteration:** Änderungen, Testergebnis, Screenshot/Preview und offene Risiken auflisten.

## Verboten

- Direkte Updates auf `accounts`, `creators`, `game_ledger` aus Client-Code
- `latest`-Versionen in `package.json` ohne Prüfung der Kompatibilität
- Reale Personen, reale Creator-Namen oder Marken-Logos in Seeds, Fixtures oder Platzhaltern
- Tests überspringen, deaktivieren oder in Quarantäne stellen, um grün zu werden

## Definition of Done

- [ ] Nutzerproblem und Spielnutzen im PR benannt
- [ ] UI-Zustände Loading, Error, Empty, Success vorhanden
- [ ] Serverseitige Autorisierung und Zod-Validierung
- [ ] Migration inkl. RLS-Policies und Grants
- [ ] Deterministische Regelberechnung mit Test
- [ ] Idempotenz-/Concurrency-Test, wenn Spielwerte geändert werden
- [ ] Mobile, Touch, Tastatur geprüft
- [ ] 3D-Fallback und Performance geprüft (falls Szene betroffen)
- [ ] Analytics-Event definiert
- [ ] Doku aktualisiert, CI grün
