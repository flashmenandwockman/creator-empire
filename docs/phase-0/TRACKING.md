# Phase 0 Tracking

**Exit Gate:** Mind. 6 von 10 Testern wollen den Prototyp wieder öffnen (Frage 1 mit 4 oder 5)
und können den Loop erklären. Sonst Loop überarbeiten, kein Produktcode.

## Status der Arbeitspakete

| Paket | Status | Ergebnis / Ort |
|---|---|---|
| Klickprototyp | **fertig (v3: Renders, Alltag, Brands, Events, News, Rangliste)** | `prototype/index.html`, veröffentlicht: https://claude.ai/artifact/K6wMyGvMkDzzJK25nXi5cV |
| Interviewleitfaden | fertig | `docs/phase-0/INTERVIEW-LEITFADEN.md` |
| Namenscheck Vorprüfung | fertig | `docs/phase-0/NAMENSCHECK.md`, Registerrecherche offen |
| 10 Interviews | offen | Rekrutierung starten |
| Rechtliche Erstberatung (Jugendschutz, DSGVO, Eventnennung, Markennähe) | offen | Termin buchen |
| Entscheidungsdokument (Zielgruppe, Anhang-B-Fragen) | Vorschlag liegt vor | `docs/STRATEGIE.md` Abschnitt 7, Beschluss offen |

## Was der Prototyp testet

| Hypothese (GDD 1.5) | Im Prototyp | Messung |
|---|---|---|
| H1 Rückkehr für fertige Produktionen | Timer läuft weiter, wenn die Seite geschlossen wird (localStorage, Zeitstempel). Toast beim Wiederkommen. Frage „Benachrichtigen?" | notify.answer, Frage 1 |
| H2 Sichtbare Studio-Metamorphose motiviert | Zwei Upgrades tauschen den kompletten Raum (Zimmer, Aufnahmestudio, Editing-Suite) und die Stationen darin | Beobachtung, Gesprächsfrage |
| H3 Echte Brand-Events erhöhen Relevanz | Event Hub mit Beispiel-Eventkarten (FIBO, gamescom, Fashion Week), reale Markennamen als Platzhalter in Verträgen, Branchen-News mit Reaktion | Klicks auf Events/News im Log, Frage 4 |
| H4 Asynchrones Spielen mit Freunden | Rangliste mit simulierten Mitspielern, Call mit Friend | Beobachtung, Gesprächsfrage |
| H5 B2B-Mehrwert für Brands | **nicht in Phase 0** | später |

Bewusst nicht im Prototyp: 3D, Server, Login, echte Mitspieler, Agentur, Quellenprüfung der Eventkarten.

## Interviewprotokolle

| Nr. | Datum | Gruppe | Zeit bis 1. Produktion | Benachrichtigung? | Frage 1 (1–5) | Loop erklärt? | Upgrade bemerkt? | Frage 4 (1–5) | Zahlen für | Stärkstes Zitat |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | | | | | | | | | | |
| 2 | | | | | | | | | | |
| 3 | | | | | | | | | | |
| 4 | | | | | | | | | | |
| 5 | | | | | | | | | | |
| 6 | | | | | | | | | | |
| 7 | | | | | | | | | | |
| 8 | | | | | | | | | | |
| 9 | | | | | | | | | | |
| 10 | | | | | | | | | | |

## Auswertung (nach 10 Interviews ausfüllen)

- Rückkehrabsicht 4–5: __ / 10 (Schwelle 6)
- Benachrichtigung gewünscht: __ / 10 (Schwelle 6)
- Loop richtig erklärt: __ / 10 (Schwelle 8)
- Median Zeit bis erste Produktion: __ s (Schwelle 90)
- Upgrade bemerkt und positiv: __ / 10 (Schwelle 5)

**Entscheidung:** ☐ Weiter zu Phase A ☐ Loop überarbeiten, erneut testen ☐ Stopp

## Bekannte Grenzen des Prototyps v1

- Zeitskala 4 h = 45 s. Das Warten selbst wird nicht erlebt, nur im Gespräch abgefragt.
- Kein echter Zufall-Seed vom Server, aber deterministisch pro Job (gleiches Prinzip).
- Zustand nur im Browser des Testers. Protokoll muss per „Kopieren" gesichert werden.
- Studio als drei isometrische Konzept-Renders (Bedroom, Rising Studio, Professional) mit tippbaren Hotspots, kein 3D. Das ist Absicht (siehe Strategie 4.2). UI-Referenz: `docs/phase-0/ref-ui-cards.webp`.
