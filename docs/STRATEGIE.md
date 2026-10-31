# Umsetzungsstrategie Creator Empire

**Stand:** 31. Oktober 2026 · **Bezug:** GDD v1.0 · **Status:** Vorschlag

## 1. Leitgedanke

Das GDD ist technisch reif und diszipliniert. Das größte Risiko liegt nicht in der Technik,
sondern in der unbewiesenen Kernhypothese: *Kehren Spieler freiwillig für Timer-Produktionen
und Studio-Ausbau zurück?* Die Strategie ordnet deshalb alles einer Frage unter:

> **Wie schnell und billig finden wir heraus, ob der Core-Loop trägt, bevor wir in 3D,
> Event-Scout und Social investieren?**

Daraus folgen drei Prinzipien:

1. **Validieren vor Bauen.** Eine Phase 0 ohne Produktcode geht dem GDD-Plan voran.
2. **2D zuerst, 3D als Belohnung.** Die isometrische Szene kommt erst, wenn der 2D-Loop im
   Playtest Rückkehr erzeugt.
3. **321.live als unfairer Vorteil nutzen.** Es gibt bereits eine Creator-Community, ein
   Academy-Angebot und Brand-Kontakte im Live-Commerce. Das Spiel startet nicht bei null.

## 2. Phasenübersicht mit Gates

Keine Zeitversprechen. Die Aufwandsangaben sind grobe Größenordnungen für ein Team aus
einem Produktverantwortlichen und einem Entwickler mit KI-Unterstützung.

| Phase | Ergebnis | Exit Gate (hart) | Größenordnung |
|---|---|---|---|
| **0 Validierung** | Klick-Prototyp, 10 Interviews, Marken-/Domaincheck, Entscheidungsdoku | Mind. 6 von 10 Testern wollen den Prototyp wieder öffnen | 2–3 Wochen |
| **A Foundation** | Repo, Supabase, Auth, Schema, CI, RLS-Tests | Login persistiert, RLS-Tests grün | 1–2 Wochen |
| **B Core Loop (2D)** | Story/Reel-Timer, Claim, XP, Level, 1 Upgrade, 2D-Studio-Ansicht | Concurrency-Tests grün, 10 Playtester, D1-Rückkehr beobachtet | 3–4 Wochen |
| **Gate 1: Weiter oder Stopp** | Auswertung Playtest B | D1 > 40 %, D7 > 15 % in der Testkohorte, sonst Loop ändern oder abbrechen | 1 Woche |
| **C Visual Tycoon** | R3F-Raum, 3 Stationen, Platzhalter-Avatar, 2 Upgradestufen sichtbar | 60 fps Desktop, nutzbar auf Mittelklasse-Handy, 2D-Fallback | 4–6 Wochen |
| **D Contracts** | 3 fiktive Verträge, Reputation, Vertragsmarkt | 7-Tage-Ökonomie-Simulation ohne Softlock/Inflation | 2–3 Wochen |
| **E Social light** | Wochen-Score, Freundesvergleich, 1 kuratierte Challenge | Abuse-Tests, kein Chat | 3–4 Wochen |
| **Gate 2: Closed Beta** | 100–300 Spieler aus 321.live-Umfeld | D7 > 20 %, erste organische Shares | laufend |
| **F Event Scout** | Quellen-Whitelist, Review-Queue, Admin-Panel, Eventkarten | Redaktions- und Rechtsprozess dokumentiert und einmal durchlaufen | 4–6 Wochen |
| **G Brand Partnerships** | 1–2 gesponserte Missionen mit echten Partnern | Vertrag, Kennzeichnung, Reporting | nach Bedarf |

Gesamt bis Gate 2: realistisch **5–7 Monate** Teilzeit-Entwicklung, bei Vollzeit und
sauberem Vibe-Coding-Workflow eher 3–4 Monate. Phase F und G sind bewusst offen.

## 3. Phase 0: Validierung vor dem ersten Commit

Das GDD springt direkt zu „Repo + Schema". Das ist ein Fehler, den sich ein kleines Team
nicht leisten sollte. Phase 0 kostet wenig und kann das Projekt retten oder beenden.

### 3.1 Klick-Prototyp (Figma oder einfache HTML-Seite)

- Startscreen, Content-Auswahl, laufender Timer, Claim-Moment, Upgrade-Kauf, Studio „vorher/nachher".
- Timer im Prototyp auf Sekunden verkürzt, Belohnungsmoment aber voll inszeniert.
- Ziel: Verstehen Tester in unter 3 Minuten Credits, Produktion, XP und Upgrade?

### 3.2 Zehn Interviews mit der Zielgruppe

- 5 aus dem 321.live-Umfeld (angehende Live-Creator, Academy-Teilnehmer), 5 außerhalb.
- Fragen: Was würdet ihr morgen wieder öffnen? Wie fühlt sich 4 Stunden Warten an? Wofür
  würdet ihr Geld ausgeben (kosmetisch)? Interessieren euch echte Brand-Events im Spiel?
- Kernmetrik: „Willst du eine Nachricht, wenn das Reel fertig ist?" als Proxy für Rückkehrabsicht.

### 3.3 Marken-, Domain- und Rechtscheck

- Namensrecherche „Creator Empire" (DPMA, EUIPO, App Stores, Domains). Der Name ist generisch
  und wahrscheinlich belegt oder schwach schützbar; zwei Alternativnamen vorbereiten.
- Kurze Erstberatung (1–2 Stunden) zu: Jugendschutz ab 16, DSGVO-Grundlage, Nennung realer
  Events ohne Partnerschaft.

### 3.4 Entscheidungsdokument

- Zielgruppe final festlegen (Empfehlung: 18+, damit Jugendschutzaufwand im MVP entfällt;
  16–17 erst nach Schutzkonzept).
- Offene Produktentscheidungen aus GDD Anhang B beantworten (Empfehlungen in Abschnitt 7).

**Exit:** Mind. 6 von 10 Testern wollen zurückkommen und können den Loop erklären. Sonst Loop
überarbeiten, nicht Code schreiben.

## 4. Phase A und B: Der kleinste faire Core-Loop

### 4.1 Reihenfolge der vertikalen Slices

1. **Slice 1: Login und Zustand.** Registrierung, Profil, `accounts`-Zeile, `game_get_state`.
2. **Slice 2: Story-Produktion.** Start, serverseitiger Timer, Claim, Ledger. Hier entstehen
   alle Transaktions- und Concurrency-Tests. Dieser Slice ist das technische Herz.
3. **Slice 3: XP, Level, Follower.** Reward-Berechnung aus Seed und Snapshot.
4. **Slice 4: Reel mit Strategiewahl.** Zweiter Content-Typ, Prognosebandbreite.
5. **Slice 5: Ein Upgrade.** Kosten, Wirkung auf Dauer, sichtbare Änderung im 2D-Studio-Bild.
6. **Slice 6: Rückkehr-Mechanik.** E-Mail oder Web-Push „Reel fertig" (Opt-in). Ohne das
   wird D1 nicht messbar sein.
7. **Slice 7: Analytics.** Activation, Time to First Fun, Claims, brachliegende Slots.

### 4.2 Warum 2D in Phase B

- Der Loop muss aus Zahlen, Entscheidungen und Belohnungsmoment Spaß erzeugen. 3D kaschiert
  das nur.
- Ein stilisiertes 2D-Studio-Bild in 3 Stufen (Illustration oder generiertes Bild) kostet Tage,
  die R3F-Szene mit Avatar-Pipeline Wochen.
- Der 2D-Stand bleibt später als Fallback für schwache Geräte erhalten, ist also keine
  Wegwerfarbeit.

### 4.3 Testpflicht in Phase B

| Test | Werkzeug |
|---|---|
| Reward-Formeln, Level-Kurve | Vitest, pure Funktionen in `lib/game-engine` |
| RLS: fremde Zeilen unsichtbar, Client-Writes verboten | SQL-Tests gegen lokale Supabase |
| Doppel-Claim, paralleler Start in zwei Tabs | Zwei gleichzeitige Transaktionen gegen echte Postgres |
| Offline-Fertigstellung | Job mit `completes_at` in der Vergangenheit anlegen, Claim prüfen |
| Idempotenz | Gleicher `idempotency_key` zweimal, gleiche Antwort, ein Ledger-Eintrag |
| E2E Happy Path | Playwright: Login, Story starten, Zeit vorstellen (Test-Hook), Claim |

## 5. Phase C: 3D mit Disziplin

- **Prozedurale Geometrie zuerst.** Boxen, Zylinder, Farben aus dem Styleguide. Erst wenn
  Interaktion und Performance stimmen, erste GLB-Assets.
- **Ein Basis-Avatar, modulare Teile.** Keine generative Figur pro Spieler. Meshy/Tripo nur
  als Werkzeug für Build-Artefakte, nie zur Laufzeit.
- **Asset-Manifest ab dem ersten Asset.** Lizenz, Quelle, Polycount, Version. Das ist später
  die rechtliche Absicherung.
- **Budget:** Szene unter 2 MB initial, Texturen komprimiert, LOD bei Bedarf. Mobile-Test auf
  einem drei Jahre alten Android-Gerät als Gate.
- **2D-Fallback bleibt Pflicht.** WebGL-Fehler oder `prefers-reduced-motion` schalten um.

## 6. Phase F: Event Scout als Redaktionsprodukt, nicht als Bot

Der Event-Scout ist der eigentliche Differenzierer und zugleich das größte rechtliche und
editoriale Risiko. Strategische Einordnung:

- **Zuerst manuell.** 5–10 reale, öffentlich angekündigte Events pro Monat händisch als
  Eventkarte pflegen (Name, Datum, Quelle, kein Logo, kein Bild). Dazu eine fiktive Mission.
  Das testet Hypothese 3 („echte Events erhöhen Relevanz") ohne KI-Aufwand.
- **Dann halbautomatisch.** KI schlägt aus Whitelist-Quellen vor, Mensch prüft und gibt frei.
  Die Review-Queue aus dem GDD ist richtig; der Status-Workflow wird 1:1 übernommen.
- **Niemals vollautomatisch publizieren.** Auch langfristig nicht. Eine falsche Angabe zu einem
  Markenevent kostet mehr Vertrauen, als Automatisierung spart.
- **321.live-Synergie:** Die Redaktion kennt den Live-Commerce-Eventkalender bereits.
  Eventkarten können parallel auf der Website und im Spiel erscheinen.

## 7. Empfehlungen zu den offenen Produktentscheidungen (GDD Anhang B)

| Frage | Empfehlung |
|---|---|
| Freier Creator oder Archetypen? | **3 Archetypen** (z. B. Gaming, Fitness, Fashion) mit freiem Namen und Avatar. Reduziert Balancing, gibt sofort Identität. |
| Parallele Produktionen? | MVP: 1 Slot. Zweiter Slot ab Level 5 als erstes großes Ziel. Mehr als 3 Slots erst mit Mitarbeitern. |
| Auto-Fertigstellung oder Claim? | Fertig bei Endzeit, **Claim als Belohnungsmoment**, kein Verlust bei verspätetem Claim. |
| Studioausbau optisch oder mechanisch? | Beides, aber Boni klein (je Stufe max. 6 % Dauer). Optik ist der Hauptanreiz. |
| Zufallsanteil? | Varianz ±8 Punkte, Strategie „viral" ±15. Immer als Bandbreite angezeigt. |
| Battles ab wann? | Erst nach Level 5 und erst in Phase E. Vorher Freundesvergleich auf dem Wochen-Score. |
| Event-Quellen? | Nur offizielle Veranstalterseiten, Pressemitteilungen, offene Kalender-APIs. Whitelist im Repo. |
| Altersgruppe? | **18+ im MVP.** 16–17 nur mit Schutzkonzept, keine offenen sozialen Features. |

## 8. Team, Rollen und Werkzeuge

| Rolle | Besetzung | Aufgabe |
|---|---|---|
| Produkt / Game Design | Gründer | Loop, Balancing, Playtests, Entscheidungen |
| Entwicklung | 1 Entwickler + Coding-Agent (Claude Code oder Cursor) | Vertikale Slices nach `AGENTS.md` |
| Art Direction | Freelancer punktuell | Styleguide, Character-Sheet, Asset-QA (ab Phase C) |
| Redaktion / Events | 321.live-Team | Eventkarten, Missionstexte (ab Phase F) |
| Recht | externe Erstberatung | Phase 0 und vor Gate 2 |

Vibe Coding ist für Projektgerüst, API, Migrationen, Tests und UI realistisch. Nicht
delegierbar bleiben: Spielgefühl, Balancing mit echten Spielern, Asset-Qualität, Recht.
Die „90 %"-Zahl im GDD ist ein Ziel, kein Plan; realistisch sind 60–70 % der Entwicklerzeit.

## 9. Go-to-Market über 321.live

Das ist der Punkt, an dem dieses Projekt sich von einem beliebigen Indie-Browsergame
unterscheidet:

1. **Closed Beta aus der Community.** Academy-Teilnehmer, Newsletter, Creator-House-Kontakte.
   100–300 Spieler reichen für Retention-Daten.
2. **Spiel als Lernwerkzeug positionieren.** Der Loop (Content planen, Nische, Brand Fit,
   Reputation) spiegelt reale Creator-Entscheidungen. Das passt zur Academy und erlaubt eine
   Erzählung jenseits von „noch ein Idle-Game".
3. **Brands aus dem Live-Commerce-Netzwerk** als erste Sponsoring-Partner für Phase G. Hier
   bestehen bereits Beziehungen, der kalte B2B-Vertrieb entfällt.
4. **Content-Marketing:** Entwicklung öffentlich dokumentieren (Insights-Artikel, Build-Log).
   Das erzeugt Reichweite für beide Marken.

## 10. Kosten in Größenordnungen

| Posten | Monatlich (Beta) | Anmerkung |
|---|---:|---|
| Supabase Pro | ~25 € | Reicht für Beta |
| Vercel Pro | ~20 € | Reicht für Beta |
| Meshy/Tripo Credits | 20–50 € | Nur in Phase C |
| Error Tracking, Mail/Push | 0–30 € | Free Tiers reichen zunächst |
| Freelancer Art | 1.500–4.000 € einmalig | Styleguide, Basis-Avatar, Möbelset |
| Rechtsberatung | 500–1.500 € einmalig | Phase 0 und vor Beta |

Infrastruktur ist nicht der Kostentreiber. Entwicklerzeit und Art sind es.

## 11. Risiken, die das GDD unterschätzt

| Risiko | Warum unterschätzt | Gegenmaßnahme |
|---|---|---|
| Markt für Idle-/Timer-Browsergames ist gesättigt | GDD nennt es als „Timer langweilig", nicht als Marktproblem | Positionierung über Creator-Thema und 321.live-Community, nicht über Mechanik |
| Zielgruppe 16–24 spielt mobil, nicht im Desktop-Browser | GDD startet Desktop-first | Mobile-first UI ab Phase B, PWA früh, Push-Benachrichtigung als Rückkehrkanal |
| Name „Creator Empire" ist generisch | GDD erwähnt Recherche, plant sie aber nicht ein | Phase 0 Namenscheck mit zwei Alternativen |
| Solo-Entwicklung mit Agent braucht Review-Kapazität | GDD setzt auf Agenten, aber jemand muss Transaktionslogik und RLS verstehen | Entwickler mit Postgres-Erfahrung, Concurrency-Tests als nicht verhandelbares Gate |
| B2B-Umsatz braucht Reichweite, die ein Browsergame selten erreicht | GDD listet B2B als Modell, ohne Schwelle | Erst kosmetische B2C-Monetarisierung, B2B nur über bestehende Partner ohne Reichweitenversprechen |

## 12. Sofort umsetzbar (diese Woche)

1. Repo `creator-empire` anlegen (siehe README) und diese Dokumente übernehmen.
2. Figma- oder HTML-Klickprototyp für den Loop bauen.
3. 10 Interviewpartner aus Community und außerhalb anfragen.
4. Namens- und Domaincheck durchführen, zwei Alternativen notieren.
5. Entscheidung Zielgruppe 18+ dokumentieren.
6. Erst danach: `npx create-next-app`, Supabase-Projekt, erste Migration.
