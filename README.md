# 🍔 Burger Party App

**Eine kinderfreundliche Live-Bestell-App für Geburtstagsfeiern**

![Version](https://img.shields.io/badge/version-1.0-orange)
![Tech](https://img.shields.io/badge/tech-HTML%20%7C%20Tailwind%20%7C%20Supabase-blue)

---

## 📋 Überblick

Diese App ermöglicht es Kindern auf einer Geburtstagsparty, ihre Burger über das Smartphone zu bestellen, während das Grill-Team die Bestellungen in Echtzeit sieht und den Status aktualisiert.

### ✨ Features

#### Bestellseite (`order.html`)
- 🍔 Modernes, jugendfreundliches Design (13+ Jahre)
- 📱 Vollständig mobil-optimiert
- 🎨 Interaktiver Burger-Builder mit Icons
- ✅ Live-Vorschau der Bestellung
- 🔢 Automatische Bestellnummern
- 🚫 Limit: 1 Bestellung pro Name

#### Grill-Dashboard (`grill.html`)
- 🔥 Echtzeit-Updates (Live-Sync)
- 🔔 Sound + Animation bei neuen Bestellungen
- 📊 Übersichtliche Bestellkarten
- 🎯 Status-Filter (Neu, In Arbeit, Fertig, Abgeholt)
- 📱 QR-Code Generator für einfachen Zugang
- 🗑️ Reset-Funktion (mit Bestätigung)

---

## 🚀 Quick Start

1. **Supabase Setup** (3 Minuten)
   ```bash
   # Siehe SETUP.md für detaillierte Anleitung
   ```

2. **Credentials einfügen**
   - In `order.html` und `grill.html` die Supabase-URLs eintragen

3. **Lokal testen**
   ```bash
   # Einfach die HTML-Dateien im Browser öffnen
   open order.html
   open grill.html
   ```

4. **Online deployen**
   - Vercel, Netlify oder GitHub Pages (siehe SETUP.md)

**Vollständige Anleitung: [SETUP.md](SETUP.md)**

---

## 📁 Dateistruktur

```
burger-party/
├── order.html      # Bestellseite für Kinder
├── grill.html      # Dashboard für Grill-Team
├── SETUP.md        # Schritt-für-Schritt Anleitung
└── README.md       # Diese Datei
```

---

## 🛠️ Tech Stack

- **Frontend:** HTML5, TailwindCSS (CDN), Vanilla JavaScript
- **Backend:** Supabase (Realtime Database)
- **Deployment:** Vercel / Netlify / GitHub Pages
- **Tools:** QRCode.js für QR-Code Generation

### Warum kein Framework?

- ✅ **Sofort lauffähig** - kein Build-Prozess
- ✅ **Einfach zu deployen** - nur 2 HTML-Dateien
- ✅ **Leicht zu verstehen** - perfekt für Lern-Projekte
- ✅ **Schnell** - keine Dependencies laden

---

## 🎯 Verwendung

### Vor der Party

1. App online stellen (Vercel/Netlify)
2. QR-Code auf Grill-Seite öffnen
3. QR-Code ausdrucken ODER auf Tablet anzeigen
4. Grill-Dashboard auf Laptop/Tablet öffnen

### Während der Party

1. **Kinder:** Scannen QR-Code → Burger bestellen
2. **Grill-Team:** Sieht Bestellungen → Status ändern
   - 🆕 Neu → 👨‍🍳 In Arbeit → ✅ Fertig → 📦 Abgeholt
3. **Sound-Alert:** Piept bei neuer Bestellung

### Nach der Party

- Daten als CSV exportieren (über Supabase)
- Reset-Button drücken für nächstes Event

---

## 🎨 Design-Prinzipien

- **Nicht zu kindisch:** Modernes Design für 13-Jährige
- **Touch-friendly:** Große Buttons, einfache Navigation
- **Visual Feedback:** Animationen, Farben, Icons
- **Mobile First:** Optimiert für Smartphone-Nutzung
- **Accessibility:** Klare Kontraste, lesbare Schrift

---

## 🔧 Anpassungen

### Farben ändern
```javascript
// In Tailwind-Klassen:
from-orange-500 → from-blue-500
bg-red-600 → bg-purple-600
```

### Weitere Burger-Typen
```javascript
// In order.html bei "Burger-Art" hinzufügen:
<div class="option-card" data-value="Doppel">
    <div class="text-4xl">🍔🍔</div>
    <div class="font-semibold">Doppel</div>
</div>
```

### Mehr Status-Optionen
```javascript
// In grill.html bei Status-Buttons:
<button onclick="updateStatus(${order.id}, 'Ausgeliefert')">
    🚚 Ausgeliefert
</button>
```

---

## 📊 Datenmodell

```sql
orders {
  id: BIGSERIAL
  order_number: INTEGER
  name: TEXT
  burger_type: TEXT
  vegetables: TEXT[]
  sauces: TEXT[]
  status: TEXT
  created_at: TIMESTAMPTZ
}
```

---

## 🐛 Troubleshooting

| Problem | Lösung |
|---------|--------|
| Bestellungen erscheinen nicht | Credentials prüfen, Browser-Console checken |
| CORS-Fehler | Dateien auf Server hosten (nicht `file://`) |
| Realtime funktioniert nicht | Supabase Realtime aktiviert? |
| QR-Code wird nicht angezeigt | QRCode.js CDN erreichbar? |

**Mehr Hilfe:** Siehe [SETUP.md](SETUP.md)

---

## 🚀 Erweiterungsideen

- [ ] Foto vom fertigen Burger hochladen
- [ ] Bewertungssystem (1-5 Sterne)
- [ ] Statistik-Dashboard (beliebtester Burger)
- [ ] Wartezeit-Schätzung
- [ ] Admin-Login für Grill-Seite
- [ ] Push-Benachrichtigungen
- [ ] Dark Mode Toggle
- [ ] Mehrsprachigkeit (EN/DE)

---

## 📝 Lizenz

MIT License - Frei verwendbar für Party-Events!

---

## 🙏 Credits

- **TailwindCSS:** Styling
- **Supabase:** Realtime Database
- **QRCode.js:** QR-Code Generation

---

## 💬 Feedback

Fragen? Probleme? Verbesserungsvorschläge?

**Viel Spaß bei der Party! 🎉🍔🔥**
# burger-party
