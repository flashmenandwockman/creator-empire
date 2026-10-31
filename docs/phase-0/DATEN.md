# Was wir in Phase 0 sammeln und warum

**Stand:** 31. Oktober 2026 · **Kein Rechtsgutachten, Prüfung vor Beta empfohlen**

## Forschungsfrage

Die zentrale Information ist nicht, wie gut jemand spielt, sondern **wem die Spieler im echten
Leben folgen, welche Trends sie sehen und welche Produkte, Brands, Events und Creator sie im Spiel
vermissen.** Daraus entstehen Inhalte für das Spiel (Verträge, Events, Trends) und ein Bild der
Zielgruppe, das kein Marktreport liefert.

## Datenpunkte im Prototyp

| Feld | Quelle im Prototyp | Zweck | Personenbezug |
|---|---|---|---|
| Vorbilder (Handle, Plattform, optional Grund) | Onboarding + Tab Welt | Welche realen Creator inspirieren die Zielgruppe; Kandidaten für offizielle Kooperationen | Handle des Spielers nicht, aber Handles Dritter |
| Eigene Trends (Text, Fundort) | Tab Welt | Welche Formate/Sounds gerade laufen, aus Sicht der Zielgruppe | gering |
| Aufgegriffene Community-Trends | Log `trend.pick` | Welche vorgegebenen Trends ziehen | gering |
| Eingereichte Links (URL, Typ, Begründung) | Tab Welt „Link einreichen" | Wunschliste für Produkte, Brands, Events, Creator, Formate; Review-Queue für Inhalte | gering, URL kann Personen betreffen |
| Angenommene Verträge, Events, News-Reaktionen | Log | Welche Brands/Kategorien und welches Risikoverhalten | gering |
| Fragebogen 5 und 6 | Tab Test | Bereitschaft, echten Creatorn im Spiel zu folgen; Muss-Brands | gering |
| Spielverlauf (Zeiten, Klicks, Claims) | Log | Loop-Verständnis, Rückkehrabsicht (siehe TRACKING.md) | gering |

Nicht erhoben: Klarname, E-Mail, eigene Social-Handles des Spielers, Standort, Gerätedaten.

## Einwilligung

Der Prototyp startet nur nach aktiver Einwilligung (Checkbox im Onboarding, im Export als
`consent: true`). Text: Nutzung für die Auswertung des Tests, keine Weitergabe, Löschung auf
Wunsch. Das Protokoll liegt nur im Browser des Testers und wird per „Kopieren" bewusst
übergeben. Für die Beta braucht es Datenschutzerklärung, Rechtsgrundlage und Löschprozess
(GDD Abschnitt 12).

## Umgang mit Handles realer Creator

- Im Spiel ist ein Vorbild ein **Lesezeichen an der Studiowand**: Text, kein Bild, kein Profil,
  keine Verbindung zum echten Account, keine Aussage über die Person.
- Keine Anzeige fremder Handles für andere Spieler, bevor das rechtlich geprüft ist.
- Aggregiert (z. B. „von 10 Testern nennen 6 denselben Creator") ist die Information wertvoll
  für Kooperationsanfragen und unkritisch.
- Offizielles „Folgen" realer Creator im Spiel nur mit deren Zustimmung (GDD 1.3, 12).

## Review-Prozess für eingereichte Links

```
eingereicht -> gesichtet -> (abgelehnt | geprüft) -> im Spiel (Vertrag / Event / Trend / Creator-Karte)
```

- Sichtung: Ist der Link echt, öffentlich, nicht jugendgefährdend, keine private Person?
- Prüfung: Rechte (Name, Logo), Passung zur Nische, Quelle dokumentieren.
- Rückmeldung an den Einreicher im Spiel: Status sichtbar, bei Aufnahme kosmetische Belohnung
  (Scout-Abzeichen), keine Credits, damit kein Anreiz zu Spam entsteht.
- Das ist der manuelle Vorläufer des Event-Scouts aus GDD Abschnitt 6: zuerst Mensch, später
  KI-Vorschlag plus menschliche Freigabe.

## Auswertung nach den Interviews

1. Liste aller genannten Vorbilder mit Häufigkeit und Plattform.
2. Liste aller Trends mit Fundort; Abgleich: Welche erscheinen mehrfach?
3. Alle eingereichten Links nach Typ; Top-3-Kandidaten für die ersten echten Inhalte.
4. Anteil „Ja, sofort" bei Frage 5 als Signal für die Priorität offizieller Creator-Kooperationen.
