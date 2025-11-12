-- ============================================
-- DEMO/TEST DATEN FÜR BURGER PARTY APP
-- ============================================
-- Diese Datei kannst du im Supabase SQL Editor ausführen,
-- um Test-Bestellungen zu erstellen

-- Lösche alte Test-Daten (optional)
-- DELETE FROM orders WHERE order_number >= 1;

-- Test-Bestellung 1: Max
INSERT INTO orders (order_number, name, burger_type, vegetables, sauces, status, created_at)
VALUES (
  1,
  'Max',
  'Cheeseburger',
  ARRAY['Tomate', 'Salat', 'Zwiebeln'],
  ARRAY['Ketchup', 'Mayo'],
  'In Arbeit',
  NOW() - INTERVAL '5 minutes'
);

-- Test-Bestellung 2: Lisa
INSERT INTO orders (order_number, name, burger_type, vegetables, sauces, status, created_at)
VALUES (
  2,
  'Lisa',
  'Veggie',
  ARRAY['Tomate', 'Gurke', 'Salat'],
  ARRAY['BBQ-Sauce', 'Mayo'],
  'Neu',
  NOW() - INTERVAL '3 minutes'
);

-- Test-Bestellung 3: Tom
INSERT INTO orders (order_number, name, burger_type, vegetables, sauces, status, created_at)
VALUES (
  3,
  'Tom',
  'Smash',
  ARRAY['Zwiebeln', 'Gurke'],
  ARRAY['Senf', 'Ketchup'],
  'Fertig',
  NOW() - INTERVAL '8 minutes'
);

-- Test-Bestellung 4: Sarah
INSERT INTO orders (order_number, name, burger_type, vegetables, sauces, status, created_at)
VALUES (
  4,
  'Sarah',
  'Normal',
  ARRAY['Salat', 'Tomate'],
  ARRAY['Mayo'],
  'Neu',
  NOW() - INTERVAL '1 minute'
);

-- Test-Bestellung 5: Leo
INSERT INTO orders (order_number, name, burger_type, vegetables, sauces, status, created_at)
VALUES (
  5,
  'Leo',
  'Cheeseburger',
  ARRAY['Tomate', 'Zwiebeln', 'Gurke', 'Salat'],
  ARRAY['BBQ-Sauce', 'Ketchup', 'Mayo', 'Senf'],
  'Abgeholt',
  NOW() - INTERVAL '15 minutes'
);

-- Überprüfe die eingefügten Daten
SELECT 
  order_number,
  name,
  burger_type,
  vegetables,
  sauces,
  status,
  created_at
FROM orders
ORDER BY created_at DESC;

-- ============================================
-- NÜTZLICHE SQL-ABFRAGEN FÜR TESTS
-- ============================================

-- Alle Bestellungen anzeigen
-- SELECT * FROM orders ORDER BY created_at DESC;

-- Bestellungen nach Status filtern
-- SELECT * FROM orders WHERE status = 'Neu';

-- Anzahl Bestellungen pro Status
-- SELECT status, COUNT(*) as anzahl 
-- FROM orders 
-- GROUP BY status;

-- Beliebtester Burger-Typ
-- SELECT burger_type, COUNT(*) as anzahl 
-- FROM orders 
-- GROUP BY burger_type 
-- ORDER BY anzahl DESC;

-- Bestellungen der letzten 10 Minuten
-- SELECT * FROM orders 
-- WHERE created_at > NOW() - INTERVAL '10 minutes'
-- ORDER BY created_at DESC;

-- Alle Bestellungen löschen (VORSICHT!)
-- DELETE FROM orders;

-- Specific Bestellung löschen
-- DELETE FROM orders WHERE id = 1;

-- Status einer Bestellung ändern
-- UPDATE orders SET status = 'Fertig' WHERE id = 1;

-- Bestellung mit höchster Nummer finden (für next number)
-- SELECT MAX(order_number) FROM orders;
