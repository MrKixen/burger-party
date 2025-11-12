# 🎉 PARTY-TAG CHEAT SHEET

## ⚡ Quick Actions

### Vor der Party (15 Min Setup)

1. **Supabase checken**
   ```
   ✅ Projekt läuft
   ✅ Tabelle `orders` existiert
   ✅ 0 alte Bestellungen (oder Reset drücken)
   ```

2. **URLs testen**
   ```
   Order-Seite: https://deine-app.vercel.app/order.html
   Grill-Seite: https://deine-app.vercel.app/grill.html
   ```

3. **Hardware vorbereiten**
   ```
   □ Grill-Laptop/Tablet aufgeladen
   □ Grill-Seite öffnen & Vollbild
   □ QR-Code anzeigen oder ausdrucken
   □ Sound-Test (neue Bestellung)
   ```

---

## 🍔 Workflow

```
Kind scannt QR → Bestellung → ⚡ PING auf Grill-Seite
                                    ↓
                    Grill-Team sieht Bestellung → Status ändern
                                    ↓
                            Burger fertig → Nummer rufen
```

---

## 🎯 Status-Workflow

```
🆕 NEU         → Kind hat bestellt, noch nicht gesehen
👨‍🍳 IN ARBEIT  → Burger wird gerade gemacht
✅ FERTIG       → Burger ist fertig, Kind kann abholen
📦 ABGEHOLT     → Kind hat Burger bekommen
```

**Tipp:** Abgeholte Bestellungen einfach auf "Abgeholt" setzen, dann verschwinden sie von oben.

---

## 🚨 Troubleshooting

| Problem | Schnelle Lösung |
|---------|-----------------|
| **Bestellung kommt nicht an** | Browser neu laden (beide Seiten) |
| **QR-Code funktioniert nicht** | URL manuell eintippen lassen |
| **Doppelbestellung** | Name prüfen - System erlaubt nur 1x pro Name |
| **Sound geht nicht** | Lautstärke checken, Browser erlaubt Sound? |
| **Tablet schläft ein** | Energiespareinstellungen deaktivieren |

---

## 📱 QR-Code anzeigen

1. Grill-Seite öffnen
2. Button "📱 QR-Code" klicken
3. Tablet zu den Kindern stellen ODER
4. QR-Code Screenshot machen & ausdrucken

**Alternative:** Short-URL erstellen auf bit.ly für einfacheres Eintippen

---

## 🔄 Reset nach Party

```
Grill-Seite → Button "🗑️ Reset" → Bestätigen
```

**Wichtig:** Macht Datenbank LEER! Vorher ggf. exportieren.

---

## 💾 Daten exportieren

### Methode 1: Supabase Dashboard
```
Supabase → Table Editor → orders → "..." → Download CSV
```

### Methode 2: SQL
```sql
SELECT * FROM orders ORDER BY created_at;
```
Dann kopieren & in Excel einfügen.

---

## 📊 Live-Statistiken (während Party)

**Im Supabase SQL Editor:**

```sql
-- Anzahl Bestellungen pro Status
SELECT status, COUNT(*) 
FROM orders 
GROUP BY status;

-- Beliebtester Burger
SELECT burger_type, COUNT(*) 
FROM orders 
GROUP BY burger_type 
ORDER BY COUNT(*) DESC;

-- Letzte 10 Bestellungen
SELECT order_number, name, burger_type, status 
FROM orders 
ORDER BY created_at DESC 
LIMIT 10;
```

---

## 🎨 Filter nutzen

**Auf Grill-Seite:**

- **Alle** → Zeigt alles
- **🆕 Neu** → Nur neue Bestellungen
- **👨‍🍳 In Arbeit** → Was gerade gemacht wird
- **✅ Fertig** → Was abholbereit ist
- **📦 Abgeholt** → Archiv (ausblenden)

**Tipp:** Wenn viel los ist → Filter auf "Neu" oder "In Arbeit" setzen

---

## ⚡ Performance-Tipps

### Bei vielen gleichzeitigen Bestellungen

1. **Mehrere Grill-Tablets**
   - Jedes Gerät kann grill.html öffnen
   - Alle sehen die gleichen Daten live

2. **Status schnell ändern**
   - Click auf Button = sofort gespeichert
   - Kein Bestätigen nötig

3. **Abgeholte ausblenden**
   - Filter auf "Neu" / "In Arbeit" setzen
   - Oder Status → "Abgeholt" (dann unten)

---

## 🎯 Pro-Tipps

- **Nummernsystem:** Rufe nur die Nummer, nicht den Namen
- **Vorkochen:** Setze beliebte Burger auf "In Arbeit" schon früher
- **Warteschlange:** Kids sehen auf eigener Seite ihre Bestellnummer
- **Stress vermeiden:** Max 1 Bestellung pro Kind (im Code gesetzt)

---

## 📞 Support während Party

### Browser-Console öffnen
```
Windows: F12
Mac: Cmd + Option + I
```

**Fehlermeldungen?** Screenshot machen für später.

### Schnell-Reset ohne Daten löschen
```
Browser-Tab schließen & neu öffnen
```

---

## ✅ Post-Party Checklist

```
□ Daten exportiert (CSV)
□ Feedback von Kids gesammelt
□ Supabase-Projekt pausiert (spart Credits)
□ App-URL gespeichert für nächstes Mal
□ Verbesserungen notiert
```

---

## 🎊 Fun Facts tracken

- **Schnellste Zubereitung:** Wer war am schnellsten?
- **Beliebtester Burger:** Was ging am meisten?
- **Wildeste Kombi:** Alle 4 Gemüse + alle 4 Saucen?
- **Erste/Letzte Bestellung:** Zeitstempel checken

---

**Viel Erfolg bei der Party! 🎉🍔**

*Bei Fragen: SETUP.md und README.md lesen*
