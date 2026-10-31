# Interviewleitfaden Phase 0

**Ziel:** Herausfinden, ob der Core-Loop (Produktion mit Timer, Claim, Ausbau) Rückkehrabsicht
erzeugt und ob Spieler ihn ohne Erklärung verstehen. 10 Gespräche, je 25–30 Minuten.

## Teilnehmer

| Gruppe | Anzahl | Rekrutierung |
|---|---|---|
| 321.live-Umfeld (Academy, Creator House, Newsletter) | 5 | Direktansprache |
| Außerhalb, 18–30, spielt gelegentlich Mobile-/Browsergames | 5 | Freundeskreis zweiten Grades, Discord-Communities |

Keine Personen unter 18. Keine Bekannten ersten Grades (zu höflich).

## Ablauf

### 1. Aufwärmen (3 Min)
- Welche Spiele hast du in den letzten 30 Tagen geöffnet? Wie oft am Tag?
- Hast du schon mal ein Spiel gespielt, in dem man wartet, bis etwas fertig ist (Clash of Clans, Hay Day, OGame, Idle-Games)? Was hat dich dran gehalten oder genervt?
- Folgst du Content Creatorn? Hast du selbst mal etwas gepostet, um Reichweite zu bekommen?

### 2. Prototyp ohne Erklärung (10 Min)
Link öffnen, Handy des Teilnehmers bevorzugt. **Nichts erklären.** Nur beobachten und notieren:

- Versteht er den Onboarding-Screen? Wählt er bewusst eine Nische?
- Findet er den Weg zur ersten Produktion ohne Hilfe? Wie lange dauert es?
- Was tut er während der Timer läuft? Wechselt er den Tab, schaut er die Verträge an, wartet er?
- Reaktion beim Claim-Moment (Mimik, Kommentar).
- Antwort auf „Benachrichtigen, wenn fertig?" (wird im Protokoll gespeichert).
- Kauft er das Upgrade? Bemerkt er die Veränderung im Studio?

Bei Blockade länger als 60 Sekunden: einen Hinweis geben, notieren.

### 3. Gespräch (10 Min)
- Was hast du gerade gemacht? Erkläre es mir, als wäre ich ein Freund. *(Verständnis des Loops)*
- Der Timer für ein Reel wären im echten Spiel 4 Stunden. Wie fühlt sich das an? Was würdest du in der Zeit tun?
- Würdest du morgen früh die App öffnen, um das Ergebnis abzuholen? Warum, warum nicht?
- Was hat dich am meisten gefreut? Was war egal?
- Das Studio hat sich nach dem Upgrade verändert. Ist dir das aufgefallen? War es dir wichtig?
- Stell dir vor, es gäbe eine Challenge zu einem echten Marken-Event, z. B. einer Messe oder einem Produktlaunch. Interessiert dich das, oder ist dir egal, ob die Marke echt ist?
- Wofür würdest du in so einem Spiel Geld ausgeben? Für nichts, für Outfits, für schnellere Timer?
- Würdest du das mit Freunden spielen? Wie: gegeneinander, zusammen, gar nicht?

### 4. Fragebogen im Prototyp (3 Min)
Teilnehmer füllt den Tab „Test" selbst aus, dann „Protokoll kopieren" und an den Interviewer senden.

## Auswertung

Pro Interview ein Eintrag in `TRACKING.md`. Zählmetriken:

| Metrik | Quelle | Schwelle für „Weiter" |
|---|---|---|
| Rückkehrabsicht (Frage 1 im Prototyp) | survey.submit → reopen | Mind. 6 von 10 mit 4 oder 5 |
| Benachrichtigung gewünscht | notify.answer | Mind. 6 von 10 |
| Loop in einem Satz richtig erklärt | Frage 2 + Gespräch | Mind. 8 von 10 |
| Zeit bis erste Produktion ohne Hilfe | Log: onboard.done → production.start | Median unter 90 Sekunden |
| Upgrade bemerkt und positiv | Beobachtung | Mind. 5 von 10 |
| Interesse an echten Brand-Events | Frage 4 | Information, keine Schwelle |

Wird die Rückkehr-Schwelle verfehlt, wird der Loop überarbeitet, nicht die Schwelle.

## Interviewer-Regeln

- Keine Suggestivfragen („Fandest du das Studio schön?"). Offen fragen („Was ist dir am Studio aufgefallen?").
- Schweigen aushalten. Erst nach 60 Sekunden Blockade helfen.
- Kritik nicht verteidigen. „Danke, das hilft" und notieren.
- Sofort nach dem Gespräch die drei stärksten Zitate aufschreiben.
