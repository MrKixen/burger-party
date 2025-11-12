# 🍔 Burger Party App - Setup Anleitung

## 🚀 Quick Start (3 Minuten)

### 1. Supabase Account erstellen
1. Gehe zu [supabase.com](https://supabase.com)
2. Klicke auf "Start your project" (kostenlos)
3. Erstelle einen Account (Email oder GitHub)

### 2. Neues Projekt anlegen
1. Klicke auf "New Project"
2. Wähle einen Namen: z.B. `burger-party`
3. Wähle ein sicheres Database Password (wird selten gebraucht)
4. Region: `Frankfurt (eu-central-1)` (am schnellsten für Deutschland)
5. Klicke "Create new project" (dauert ~1-2 Minuten)

### 3. Datenbank-Tabelle erstellen
1. Gehe im Menü links zu **"SQL Editor"**
2. Klicke auf "New query"
3. Kopiere folgenden SQL-Code:

```sql
-- Erstelle die orders Tabelle
CREATE TABLE orders (
  id BIGSERIAL PRIMARY KEY,
  order_number INTEGER NOT NULL,
  name TEXT NOT NULL,
  burger_type TEXT NOT NULL,
  vegetables TEXT[] DEFAULT '{}',
  sauces TEXT[] DEFAULT '{}',
  status TEXT NOT NULL DEFAULT 'Neu',
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Index für schnellere Abfragen
CREATE INDEX idx_orders_status ON orders(status);
CREATE INDEX idx_orders_created_at ON orders(created_at DESC);

-- Row Level Security (RLS) aktivieren
ALTER TABLE orders ENABLE ROW LEVEL SECURITY;

-- Policy: Jeder kann lesen und schreiben (für Party-App)
CREATE POLICY "Enable read access for all users" ON orders
  FOR SELECT USING (true);

CREATE POLICY "Enable insert access for all users" ON orders
  FOR INSERT WITH CHECK (true);

CREATE POLICY "Enable update access for all users" ON orders
  FOR UPDATE USING (true);

CREATE POLICY "Enable delete access for all users" ON orders
  FOR DELETE USING (true);
```

4. Klicke "Run" (unten rechts)
5. Du solltest "Success. No rows returned" sehen ✅

### 4. API Credentials kopieren
1. Gehe im Menü links zu **"Project Settings"** (Zahnrad-Icon)
2. Klicke auf **"API"**
3. Kopiere:
   - **Project URL** (z.B. `https://xyzabc.supabase.co`)
   - **anon public key** (langer String)

### 5. Credentials in die HTML-Dateien einfügen

#### In `order.html` (Zeile 189-190):
```javascript
const SUPABASE_URL = 'https://DEINE-PROJECT-URL.supabase.co';
const SUPABASE_KEY = 'DEIN-ANON-KEY-HIER';
```

#### In `grill.html` (Zeile 127-128):
```javascript
const SUPABASE_URL = 'https://DEINE-PROJECT-URL.supabase.co';
const SUPABASE_KEY = 'DEIN-ANON-KEY-HIER';
```

### 6. Testen (lokal)
1. Öffne `order.html` direkt im Browser (Doppelklick)
2. Öffne `grill.html` in einem zweiten Tab
3. Teste eine Bestellung - sollte sofort auf der Grill-Seite erscheinen! 🎉

---

## 🌐 Online Deployment

### Option A: Vercel (empfohlen, 2 Minuten)
1. Gehe zu [vercel.com](https://vercel.com)
2. "Add New" → "Project"
3. Importiere dein GitHub Repo (oder ziehe die Dateien rein)
4. Klicke "Deploy"
5. **Fertig!** URL kopieren und teilen

### Option B: Netlify
1. Gehe zu [netlify.com](https://netlify.com)
2. Ziehe den Ordner mit beiden HTML-Dateien ins Browser-Fenster
3. **Fertig!** URL kopieren und teilen

### Option C: GitHub Pages
1. Erstelle ein GitHub Repository
2. Pushe die beiden HTML-Dateien
3. Settings → Pages → Source: main branch
4. **Fertig!** URL ist `username.github.io/repo-name`

---

## 📱 PWA (Progressive Web App) - Optional

Um die App als "App" auf dem Handy installierbar zu machen:

1. Erstelle `manifest.json`:
```json
{
  "name": "Burger Party",
  "short_name": "Burger",
  "start_url": "/order.html",
  "display": "standalone",
  "background_color": "#fff",
  "theme_color": "#f97316",
  "icons": [
    {
      "src": "icon-192.png",
      "sizes": "192x192",
      "type": "image/png"
    },
    {
      "src": "icon-512.png",
      "sizes": "512x512",
      "type": "image/png"
    }
  ]
}
```

2. Füge in beide HTML `<head>` ein:
```html
<link rel="manifest" href="/manifest.json">
<meta name="theme-color" content="#f97316">
```

3. Erstelle Icons (z.B. mit [favicon.io](https://favicon.io))

---

## 🎯 Am Party-Tag

### Vorbereitung:
1. ✅ Supabase läuft
2. ✅ App ist online deployed
3. ✅ QR-Code auf Grill-Seite anzeigen
4. ✅ QR-Code ausdrucken oder auf Tablet zeigen
5. ✅ Grill-Tablet/Laptop an sicherem Ort aufstellen

### Workflow:
1. **Kinder:** Scannen QR-Code → Bestellen über Handy
2. **Grill-Team:** Sieht Bestellungen sofort → Status aktualisieren
3. **Benachrichtigung:** Sound + Animation bei neuer Bestellung
4. **Ende:** Reset-Button drücken für nächstes Event

---

## 🛠️ Troubleshooting

### Bestellungen erscheinen nicht?
- ✅ Credentials richtig eingefügt?
- ✅ SQL-Tabelle erstellt?
- ✅ Browser-Console checken (F12)

### CORS-Fehler?
- ✅ Dateien müssen auf Server liegen (nicht file://)
- ✅ Oder Python Server starten: `python -m http.server 8000`

### Realtime funktioniert nicht?
- ✅ Supabase Realtime ist standardmäßig aktiviert
- ✅ In Project Settings → API → Realtime aktiviert?

### Handy kann nicht bestellen?
- ✅ URL muss HTTPS sein (Vercel/Netlify machen das automatisch)
- ✅ Firewall/Netzwerk checken

---

## 📊 Daten nach Party exportieren

Falls du die Bestellungen als Excel/CSV brauchst:

1. Gehe zu Supabase → **Table Editor** → `orders`
2. Klicke "..." → "Download as CSV"
3. Öffne in Excel

Oder direkt in SQL Editor:
```sql
SELECT * FROM orders ORDER BY created_at;
```

---

## 🔒 Sicherheit

**Für die Party ist die aktuelle Config OK!**

Wenn du die App danach weiterverwenden willst:
- Aktiviere Email-Auth in Supabase
- Ändere RLS Policies (nur authentifizierte User)
- Füge Admin-Login für Grill-Seite hinzu

---

## 💡 Erweiterungen

Coole Features für später:
- 📸 Foto vom Burger hochladen
- ⭐ Bewertungssystem
- 📊 Statistik (beliebtester Burger)
- 🏆 Bestenliste (schnellste Zubereitung)
- 💬 Chat zwischen Grill und Besteller

---

**Viel Spaß bei der Party! 🎉🍔**
