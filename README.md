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

## Warum liegt das hier?

Dieses Verzeichnis ist als eigenständiges Projekt gedacht. Die GitHub-Integration der
Session durfte kein neues Repository anlegen, deshalb liegt der Projektstart vorerst
im Repo `321.live` auf einem Feature-Branch. Verschieben in ein eigenes Repo:

```bash
git subtree split --prefix=creator-empire -b creator-empire-only
```

```bash
git push git@github.com:flashmenandwockman/creator-empire.git creator-empire-only:main
```

Anschließend den Ordner hier löschen. Das Repo `321.live` soll laut dessen README nur
die Website enthalten; `netlify deploy --dir .` würde den Ordner sonst mit hochladen.

## Nächster Schritt

Siehe [docs/STRATEGIE.md, Abschnitt 3](docs/STRATEGIE.md#3-phase-0-validierung-vor-dem-ersten-commit):
Phase 0 (Validierung) vor dem ersten Zeile Produktcode.
