-- =====================================================
-- CART TABLE
-- =====================================================

CREATE TABLE IF NOT EXISTS cart (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_id INTEGER NOT NULL,
  product_id INTEGER,
  quantity INTEGER DEFAULT 1,
  price DECIMAL(10,2),
  created_at TEXT DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

SELECT u.id, u.email, u.name, c.product_id, c.quantity
FROM cart c
JOIN users u ON c.user_id = u.id
WHERE u.session_id IS NOT NULL;
