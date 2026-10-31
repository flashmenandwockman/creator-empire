# Bewertung der Idee „Creator Empire"

**Stand:** 31. Oktober 2026 · **Bezug:** GDD v1.0 · **Perspektive:** Produkt, Technik, Markt, Recht

## Kurzurteil

**Als Konzeptdokument: sehr gut. Als Produktidee: aussichtsreich, aber unbewiesen.**

Das GDD ist eines der disziplinierteren Game-Konzepte seiner Art: klare MVP-Grenzen,
server-autoritative Architektur von Anfang an, ehrliche Kennzeichnung ungeprüfter Hypothesen,
rechtlich saubere „fiktiv zuerst"-Haltung. Die Schwäche liegt nicht im Dokument, sondern in dem,
was es noch nicht beantwortet: ob Menschen das spielen wollen, und ob die Mechanik, die es
antreibt (Echtzeit-Timer), heute noch trägt.

Gesamtbewertung: **7 von 10** als Projekt im Kontext von 321.live. Ohne diesen Kontext
(als freistehendes Indie-Browsergame) eher **5 von 10**.

## Stärken

### 1. Thematische Lücke ist real
Tycoon- und Agentur-Spiele gibt es für Restaurants, Fußballvereine, Krankenhäuser und Städte.
Ein ernsthaft gebautes Creator-Agentur-Spiel ist selten. Die Zielgruppe kennt das Thema aus dem
eigenen Alltag und versteht die Fachbegriffe (Reel, Nische, Brand Fit, Reputation) ohne Tutorial.

### 2. Technische Disziplin ist ungewöhnlich hoch
Serverseitige Zeit, Ledger, Idempotenz, Seeds, RLS, Concurrency-Tests: das sind die Dinge, an
denen Hobby-Browsergames typischerweise scheitern (Doppelauszahlungen, Exploits, kippende
Ökonomie). Das GDD hat sie von Tag eins eingeplant. Das spart später Monate.

### 3. Rechtliche Haltung ist klug
Fiktive Creator, fiktive Brands im MVP, reale Events nur als sachlich belegte Eventkarten ohne
Logos, „Official Partner" nur mit Nachweis, menschliche Freigabe vor Veröffentlichung. Das ist
die richtige Reihenfolge und vermeidet die naheliegendste Falle (reale Creator als Spielfiguren).

### 4. Der Event-Scout ist ein echter Differenzierer
Reale Marken-Events als Anker für virtuelle Missionen verbinden Spiel und Welt auf eine Art, die
andere Tycoon-Spiele nicht haben. Es erzeugt wiederkehrenden, aktuellen Content ohne eigenes
Redaktionsteam von null. Und es öffnet einen B2B-Pfad, der für Marken nachvollziehbar ist.

### 5. Passung zu 321.live
Das ist der stärkste Punkt und steht so nicht im GDD. 321.live hat eine Creator-Community,
eine Academy, Brand-Kontakte im Live-Commerce und redaktionelles Wissen über den
Eventkalender. Das Spiel kann als Lernwerkzeug, Community-Bindung und Marketing-Kanal dienen.
Ein Browsergame ohne Community startet bei null; dieses nicht.

### 6. Ehrlichkeit des Dokuments
Das GDD markiert konsequent, was Hypothese und was Fakt ist, verzichtet auf erfundene
Marktzahlen und auf Zeitversprechen. Das ist selten und macht es als Arbeitsgrundlage glaubwürdig.

## Schwächen und offene Fragen

### 1. Die Kernmechanik ist alt und der Markt gesättigt
Echtzeit-Timer mit Offline-Fortschritt sind das Herz von OGame (2002), Travian und tausenden
Idle-Games. Das Genre funktioniert, aber die Aufmerksamkeit der 16–24-Jährigen liegt heute bei
mobilen Spielen mit sofortigem Feedback. Ein 4-Stunden-Timer für ein Reel kann sich nach
„Warten" statt nach „Strategie" anfühlen. Das GDD erkennt das Risiko, unterschätzt aber, wie oft
genau dieses Risiko Projekte beendet hat.

### 2. 3D ist teuer und bringt dem Loop wenig
Die isometrische R3F-Szene mit Avatar-Pipeline (Meshy, Rigging, Animationen, Asset-QA,
Mobile-Performance) ist der aufwändigste Block im Konzept. Hypothese 2 („sichtbare
Studiometamorphose motiviert") ließe sich mit 2D-Illustrationen in drei Stufen genauso testen.
Empfehlung: 3D erst nach einem erfolgreichen 2D-Playtest. Ein Loop, der in 2D nicht trägt, wird
in 3D nicht besser.

### 3. Zielgruppe und Plattform passen nicht zusammen
16–24 Jahre, aber Desktop-Browser zuerst. Diese Gruppe spielt auf dem Handy. „Mobile-responsive"
ist nicht dasselbe wie mobile-first. Ohne Push-Benachrichtigung „Reel fertig" gibt es außerdem
keinen Rückkehrkanal, und die Kernhypothese 1 (Rückkehr) ist nicht messbar. Das GDD erwähnt
Notifications nur am Rand.

### 4. Der Event-Scout ist auch die größte Last
Was den Scout stark macht, macht ihn teuer: Quellenprüfung, Rechtecheck, Review, Monitoring bei
Absagen, Beschwerdeprozess. Das ist ein redaktionelles Produkt mit laufenden Kosten, kein Feature,
das man einmal baut. Zudem ist unklar, ob Marken es begrüßen, in einem Spiel genannt zu werden,
mit dem sie nichts zu tun haben. Rechtlich wahrscheinlich zulässig, kommunikativ nicht risikofrei.

### 5. B2B-Monetarisierung braucht Reichweite
Gesponserte Missionen und Kampagnenberichte sind für Marken erst interessant, wenn tausende
aktive Spieler teilnehmen. Ein Browsergame ohne Marketingbudget erreicht das selten. Der
B2B-Pfad ist also eine Option für Jahr zwei, nicht ein Geschäftsmodell für den Start. Kosmetische
B2C-Monetarisierung trägt ein kleines Team erfahrungsgemäß ebenfalls nicht allein.

### 6. „90 % Vibe Coding" ist optimistisch
Projektgerüst, CRUD, Tests und UI lassen sich gut delegieren. Transaktionslogik, RLS-Policies und
Concurrency-Verhalten muss jemand im Team wirklich verstehen und reviewen. Spielbalance, Spaß,
Asset-Qualität und Recht sind gar nicht delegierbar. Realistisch sind 60–70 % der Entwicklerzeit.
Das GDD sagt das selbst in Abschnitt 9.2, die Überschrift „90 %" verführt trotzdem.

### 7. Der Name
„Creator Empire" ist generisch, wahrscheinlich bereits in Verwendung (Apps, Kurse, Communities)
und schwach schützbar. Das GDD plant die Recherche, aber nicht als Gate. Vor jeder öffentlichen
Nennung zwei Alternativen bereithalten.

### 8. Umfang
Fünf Pillars, neun Hauptscreens, sieben Phasen. Das GDD hat harte MVP-Grenzen, doch das Konzept
beschreibt ein Produkt, das ein Studio mit fünf bis zehn Leuten über zwei Jahre baut. Für ein
Ein- bis Zwei-Personen-Team ist das MVP (Phase A–B) realistisch, Phase C–G nur mit Finanzierung
oder sehr langem Atem.

## Alternativen, die geprüft werden sollten

| Alternative | Vorteil | Nachteil |
|---|---|---|
| **Nur 2D, Mobile-first PWA** | Halbiert Aufwand, trifft Zielgruppe besser | Weniger „Wow", schwächerer Share-Faktor |
| **Spiel als Academy-Begleiter** statt eigenständigem Produkt | Sofortige Nutzerbasis, klarer Nutzen, Monetarisierung über Academy | Kleinerer Markt, Spielgefühl darf nicht zum Lehrmittel verkommen |
| **Discord-/Telegram-Bot-Variante** als allererster Prototyp | Timer, Rewards und Rückkehr in Tagen testbar, Push inklusive | Kein visueller Fortschritt, nur Hypothese 1 und 4 testbar |
| **Event-Challenges zuerst**, Tycoon später | Testet den Differenzierer direkt | Ohne Progression kein Grund zur Rückkehr |

Empfehlung: Hauptpfad bleibt das GDD, aber mit **2D-Mobile-first in Phase B** und einem
**Discord-Bot oder Klickprototyp in Phase 0** als billigstem Test der Rückkehrhypothese.

## Bewertung nach Kriterien

| Kriterium | Bewertung | Begründung |
|---|---|---|
| Originalität des Themas | hoch | Creator-Agentur-Tycoon ist kaum besetzt |
| Originalität der Mechanik | niedrig | Timer-Loop ist bekanntes Genre |
| Technische Machbarkeit | hoch | Stack ist bewährt, Architektur ist durchdacht |
| Aufwand MVP | mittel | 2–3 Monate Teilzeit für Phase A–B realistisch |
| Aufwand Vollvision | sehr hoch | Jahre für ein kleines Team |
| Marktrisiko | hoch | Retention-Hypothese unbewiesen, Genre gesättigt |
| Rechtsrisiko | niedrig bis mittel | Durch fiktiven MVP gut begrenzt, steigt mit Event-Scout |
| Monetarisierung | unklar | B2C kosmetisch schwach, B2B braucht Reichweite |
| Strategischer Fit zu 321.live | sehr hoch | Community, Academy, Brand-Netz, Redaktion vorhanden |

## Empfehlung

1. **Weiterverfolgen, aber mit Phase 0 vor dem ersten Code.** Zehn Interviews und ein
   Klickprototyp entscheiden, ob der Loop überhaupt Rückkehrabsicht erzeugt.
2. **2D und Mobile-first für den MVP.** 3D wird zur Belohnung für einen bestandenen Playtest.
3. **Push-/E-Mail-Benachrichtigung als Kernfeature behandeln,** nicht als Nebensache. Ohne
   Rückkehrkanal ist das Spiel nicht messbar.
4. **Das Spiel bewusst an 321.live andocken:** Closed Beta aus der Community, Positionierung
   als Creator-Lernwelt, erste Brand-Missionen aus dem bestehenden Netzwerk.
5. **Event-Scout als Redaktionsprodukt planen,** mit laufenden Kosten, nie vollautomatisch.
6. **Zwei harte Gates setzen** (nach Phase B und vor Closed Beta) mit vorab festgelegten
   Retention-Schwellen. Werden sie verfehlt, wird der Loop geändert oder das Projekt gestoppt,
   nicht die Schwelle.
7. **18+ als Zielgruppe im MVP,** um Jugendschutzaufwand aus der Validierungsphase herauszuhalten.

Die Idee verdient den Test. Sie verdient noch nicht die 3D-Pipeline.
