# Deployment

## Stufe 1: Prototyp als statische Seite (jetzt, nur Netlify)

Der Prototyp ist eine HTML-Datei plus drei Bilder. Kein Server, keine Datenbank. `prototype/build.sh`
ergänzt den HTML-Rahmen und schreibt alles nach `prototype/dist/`.

### Variante A0: ohne CLI, per Skript (auch aus einer Claude-Session)

Personal Access Token in Netlify erzeugen (User settings → Applications → Personal access tokens)
und als `NETLIFY_AUTH_TOKEN` hinterlegen. Dann:

```bash
bash scripts/deploy-netlify.sh
```

Legt die Site `creator-empire-proto` an, falls sie fehlt, baut und lädt `prototype/dist` als Zip
über die Netlify-API hoch. Braucht nur curl, zip und python3.

### Variante A: sofort per CLI (wie bei 321.live)

```bash
cd creator-empire && bash prototype/build.sh
```

```bash
netlify sites:create --name creator-empire-proto
```

```bash
netlify deploy --prod --dir prototype/dist --site creator-empire-proto
```

Ergebnis: `https://creator-empire-proto.netlify.app`. Jeder neue Stand: Build-Skript, dann
`netlify deploy` erneut. Passwortschutz für interne Tests: Netlify Site → Site protection
(Pro-Plan) oder eine Basic-Auth-Regel in `netlify.toml`.

### Variante B: automatisch aus GitHub

1. Netlify → Add new site → Import from Git → Repo wählen.
2. Repo `creator-empire`, Branch `main`, Base directory leer. Build command und Publish directory kommen aus `netlify.toml`.
3. Jeder Push baut und deployt. Deploy Previews für Pull Requests gibt es automatisch.

### Optional: unter 321.live erreichbar machen

Wie bei `/barber-world-live/`: in `netlify.toml` von 321.live eine Proxy-Regel auf die
Prototyp-Site, z. B. `/creator-empire/*` → `https://creator-empire-proto.netlify.app/:splat`.
Dann teilt man `321.live/creator-empire/`. Für Interviews reicht die netlify.app-Adresse.

## Stufe 2: Testprotokolle automatisch sammeln (Supabase, 1–2 Stunden)

Heute kopiert der Tester das Protokoll per Button. Mit Supabase landet es direkt in einer Tabelle.

1. Supabase-Projekt anlegen (Free Tier reicht), Region EU (Frankfurt).
2. Tabelle:
   ```sql
   create table prototype_sessions (
     id uuid primary key default gen_random_uuid(),
     created_at timestamptz default now(),
     consent boolean not null,
     payload jsonb not null
   );
   alter table prototype_sessions enable row level security;
   create policy "anon insert only" on prototype_sessions
     for insert to anon with check (consent = true);
   ```
   Kein Select für anon: Tester können nur schreiben, nie lesen.
3. Im Prototyp einen Button „Protokoll senden" ergänzen, der den Export per `fetch` an
   `https://<projekt>.supabase.co/rest/v1/prototype_sessions` schickt (Header `apikey` und
   `Authorization: Bearer <anon key>`). Der anon key darf im Frontend stehen, der service role key nie.
4. Auswertung im Supabase Table Editor oder per SQL (`payload->'research'->'idols'`).

Dafür brauche ich von euch nur Projekt-URL und anon key, dann baue ich den Button ein.

## Stufe 3: das eigentliche Spiel

Nach bestandener Phase 0 gilt `docs/ARCHITECTURE.md`: Next.js mit Supabase Auth, Postgres und
RPC-Funktionen. Hosting wahlweise Vercel oder Netlify (beide bauen Next.js), Datenbank immer
Supabase. GitHub Actions für Lint, Typecheck, Tests und Migrations-Check vor jedem Deploy.

| Stufe | GitHub | Netlify | Supabase |
|---|---|---|---|
| 1 Prototyp | Code und Doku | statische Seite | nicht nötig |
| 2 Protokolle sammeln | wie 1 | wie 1 | eine Tabelle, insert-only |
| 3 Spiel | Repo + CI | oder Vercel: Next.js-Hosting | Auth, Postgres, RPC, RLS |
