# Spielökonomie: Startwerte und Änderungsregeln

Alle Werte sind **Balancing-Startwerte**, keine validierten Zahlen. Jede Änderung wird hier
mit Datum, Grund und Test eingetragen.

## Startzustand

| Größe | Wert |
|---|---|
| Creator | 1, frei benennbar, Nische wählbar |
| Credits | 500 |
| Produktionsslots | 1 |
| Studio-Stufe | Bedroom (Lv 1) |
| Energie | 100, Regeneration 10 pro Stunde (serverseitig berechnet) |

## Content-Aktionen

| Aktion | Dauer | Kosten | Creator-XP | Follower (Erwartung) | Ab Level |
|---|---:|---:|---:|---:|---:|
| Story | 30 Min | 40 | 30 | +90 | 1 |
| Reel | 240 Min | 180 | 150 | +850 | 1 |
| Livestream | 360 Min | 300 | 250 | +1.250 | 5 |
| Longform-Video | 720 Min | 550 | 450 | +2.500 | 8 |

**Deadlock-Schutz:** Fällt der Kontostand unter 40 Credits und läuft kein Job, steht eine
kostenlose Aktion „Spontan-Story" (20 Min, 0 Credits, 15 XP, +40 Follower) bereit.
Zusätzlich zahlen Story und Reel Credits aus (Story +60, Reel +260), damit der Loop sich
selbst trägt. Ziel: Spieler darf nie ohne Handlungsoption sein.

## Formeln

```ts
durationMinutes = max(10, round(baseMinutes * (1 - equipmentLevel * 0.06 - productionSkill * 0.015)))

rawScore = 0.25*reach + 0.25*engagement + 0.20*creativity + 0.15*production + 0.15*brandFit
finalScore = clamp(rawScore + strategyBonus + seededVariance, 0, 100)

followers = round(baseFollowers * (0.6 + finalScore / 100))   // Spanne 0,6x bis 1,6x
```

- `seededVariance` liegt in [-8, +8], aus dem serverseitigen Job-Seed.
- `strategyBonus`: safe +0 / balanced +3 / viral +6 mit Varianz-Spanne [-15, +15].
- Boni sind additiv und gedeckelt. Keine ungedeckelten Multiplikatoren.
- Der Spieler sieht vor dem Start eine Prognosebandbreite, nie einen garantierten Wert.

## Level

XP-Bedarf für Level n: `100 * n^1.5` (gerundet). Level 2 = 283 XP, Level 5 = 1.118 XP, Level 10 = 3.162 XP.

## Studio-Upgrade (MVP: genau eines)

| Upgrade | Kosten | Wirkung | Sichtbar |
|---|---:|---|---|
| Ringlicht + Kamera Lv 2 | 400 Credits | Dauer -6 %, Qualität +4 | Neues Kamera-Modell, Licht an |

## Änderungsregeln

1. Jede Änderung an Werten oder Formeln braucht einen aktualisierten Unit-Test in `lib/game-engine`.
2. Werte liegen in einer versionierten Config-Tabelle oder Datei (`economy_version`), damit Jobs mit altem Snapshot korrekt ausgezahlt werden.
3. Vor Änderung: Simulation über 7 Spieltage mit drei Spielertypen (1x, 3x, 6x täglich online) laufen lassen und Ergebnis hier anhängen.

## Änderungslog

| Datum | Änderung | Grund | Test |
|---|---|---|---|
| 2026-10-31 | Startwerte aus GDD v1.0 übernommen, Deadlock-Schutz ergänzt | Erstfassung | offen |

## Ergänzungen aus Prototyp v3 (31.10.2026, Vorschlag, nicht final)

### Energie
Max 100, Start 60, Regeneration **3 pro Spielstunde** (72 pro Tag). Kosten: Story 10, Reel 25, Livestream 35, Longform 50, Classes 40–70. Drei Reels sind damit ein volles Tagespensum; Essen, Booster und Calls sind die bewusste Abkürzung.

| Aktion | Kosten | Wirkung | Taktung |
|---|---:|---|---|
| Essen bestellen | 60 Cr | +35 Energie nach 20 Min Lieferzeit | beliebig, eine Lieferung gleichzeitig |
| Energy Booster | 90 Cr | +50 Energie sofort | alle 6 h |
| Call mit Friend | 0 Cr | +10 Energie, +4 Inspiration (Score-Bonus auf nächste Produktion) | alle 8 h |

### Hype
Temporärer Wert 0–100, Zerfall 8 pro Spielstunde. Wirkt als Follower-Multiplikator `1 + hype/100` auf die nächste Produktion. Quellen: Events, News-Reaktionen.

### Brands und Exklusivität
- Verträge haben eine Kategorie (Nutrition, Fashion, Gaming-Hardware, Getränke).
- Erfolgreicher Abschluss bindet den Spieler 24 Spielstunden exklusiv an die Brand. Konkurrenten derselben Kategorie sind gesperrt.
- Partner-Level pro Brand: Gage × (1 + 0,15 × Abschlüsse), Deckel 1,6.
- Eigene Brand ab Level 6 und 15 Reputation für 1.500 Cr: Einnahmen `max(20, Follower × 0,03)` Credits pro Spielstunde, abholbar. Sperrt alle Fremdverträge der eigenen Kategorie.
- Reale Markennamen (More Nutrition, Teveo, 6PM) sind im Prototyp nur Platzhalter. Vor öffentlicher Nutzung Rechteklärung laut GDD Abschnitt 12.

### Events
Event-Reel mit Follower- und Level-Hürde, ein Versuch pro Event. Erfolg ab Score 60: Gage, Reputation, Hype, Abzeichen. Misserfolg: −3 Reputation.

### Branchen-News
Meldungen erscheinen gestaffelt nach Spielstunden, gefiltert nach Nische, verfallen nach 6 h. Drei Optionen:
- Reagieren: Chance 45–60 %, Gewinn bis +900 Follower und +20 Hype, Risiko −4 bis −12 Reputation.
- Einordnen: sicher, +120 bis +250 Follower, +2 bis +6 Reputation, +6 Hype.
- Lassen: keine Wirkung.

### Rangliste
Wochen-Score = Follower. Im Prototyp 9 simulierte Spieler mit linearem Wachstum (90–300 Follower pro Spielstunde) plus leichter Schwankung. Belohnung nur kosmetisch plus Reputation.

### Academy / Classes
Eine Class belegt den Produktionsslot (kein Content währenddessen) und kostet Credits und Energie. Danach steigen Attribute dauerhaft.

| Class | Dauer | Kosten | Energie | Wirkung | Ab Level |
|---|---:|---:|---:|---|---:|
| Storytelling-Class | 3 h | 120 | 40 | +5 Engagement, +120 XP | 1 |
| Kamera-Workshop | 3 h | 150 | 40 | +5 Production, +120 XP | 1 |
| Brand-Academy | 6 h | 300 | 55 | +6 Brand Fit, +4 Reputation, +260 XP | 3 |
| Creator Masterclass | 12 h | 600 | 70 | +5 Reach, +5 Creativity, +500 XP | 5 |

### Collabs
Collab-Reel: 180 Cr, 30 Energie, 4 h, belegt den Slot. Ergebnis hängt vom Größenverhältnis Partner/Spieler ab und wird vor der Anfrage mit Zahlen angezeigt.

| Verhältnis | Du | Partner | Zusage |
|---|---|---|---|
| Partner < 0,5× | 50 % eines Reels | 200 % eines Reels | immer |
| 0,5× bis 2× (Augenhöhe) | 100 % | 100 % | 85 % |
| Partner > 2× | 220 % | verliert 2 % seiner Follower | 35 % + Reputation/100 |

Absage: keine Kosten, 6 h Sperre bei diesem Creator. Follower-Änderungen der Partner wirken sichtbar auf die Rangliste.
