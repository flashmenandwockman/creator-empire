# Creator Empire

Persistentes, soziales Creator-Aufbau- und Agentur-Strategiespiel für den Browser.
Spieler entwickeln fiktive Content Creator vom Newcomer zum virtuellen Star: zeitbasierte
Produktionen (Echtzeit-Timer), Studio-Ausbau, Skills, virtuelle Brand-Verträge und
asynchrone Challenges. Arbeitsname, Marken- und Domainrecherche steht noch aus.

**Status:** Phase 0 (Validierung). Klickprototyp fertig, Interviews offen. Noch kein Produktcode.

## Dokumente

| Datei | Inhalt |
|---|---|
| [docs/GDD.md](docs/GDD.md) | Gesamtkonzept v1.0 (Produkt, Game Design, Technik, Recht, Roadmap) |
| [docs/STRATEGIE.md](docs/STRATEGIE.md) | Umsetzungsstrategie: Phasen, Gates, Team, Werkzeuge, Go-to-Market |
| [docs/BEWERTUNG.md](docs/BEWERTUNG.md) | Kritische Bewertung der Idee: Stärken, Schwächen, Empfehlung |
| [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md) | Verbindliche Architekturentscheidungen für Phase A und B |
| [docs/ECONOMY.md](docs/ECONOMY.md) | Startwerte der Spielökonomie und Regeln für Balancing-Änderungen |
| [AGENTS.md](AGENTS.md) | Arbeitsregeln für Coding-Agenten (Claude Code, Cursor, Codex) |
| [prototype/index.html](prototype/index.html) | Klickprototyp Phase 0 (eine Datei, kein Build). Live: https://claude.ai/artifact/K6wMyGvMkDzzJK25nXi5cV |
| [docs/phase-0/](docs/phase-0/) | Interviewleitfaden, Namenscheck, Tracking, Datenkonzept der Phase 0 |
| [docs/DEPLOY.md](docs/DEPLOY.md) | Prototyp auf Netlify bringen, später Supabase und das volle Spiel |

## Setup

Reines Dokumentations- und Prototyp-Repo, kein Build nötig. Prototyp lokal ansehen:

```bash
bash prototype/build.sh && npx serve prototype/dist
```

Deployment siehe [docs/DEPLOY.md](docs/DEPLOY.md). Produktcode (Phase A) entsteht nach bestandener
Phase 0 in diesem Repo nach den Regeln in [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md) und [AGENTS.md](AGENTS.md).

## Nächster Schritt

Siehe [docs/STRATEGIE.md, Abschnitt 3](docs/STRATEGIE.md#3-phase-0-validierung-vor-dem-ersten-commit):
Phase 0 (Validierung) vor dem ersten Zeile Produktcode.
