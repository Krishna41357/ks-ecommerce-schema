  CREATE TABLE IF NOT EXISTS cart (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    created_at TEXT DEFAULT CURRENT_TIMESTAMP,
    updated_at TEXT DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    UNIQUE(user_id)
  );

  CREATE TABLE IF NOT EXISTS cart_items (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    cart_id INTEGER NOT NULL,
    product_id TEXT NOT NULL,
    product_name TEXT NOT NULL,
    product_slug TEXT NOT NULL,
    product_image TEXT,
    sku TEXT NOT NULL,
    quantity INTEGER NOT NULL DEFAULT 1,
    price REAL NOT NULL,
    subtotal REAL NOT NULL,
    metal TEXT,
    metal_purity TEXT,
    stone TEXT,
    stone_type TEXT,
    added_at TEXT DEFAULT CURRENT_TIMESTAMP,
    updated_at TEXT DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (cart_id) REFERENCES cart(id) ON DELETE CASCADE,
    UNIQUE(cart_id, product_id)
  );

  CREATE INDEX IF NOT EXISTS idx_cart_user_id ON cart(user_id);
  CREATE INDEX IF NOT EXISTS idx_cart_items_cart_id ON cart_items(cart_id);
  CREATE INDEX IF NOT EXISTS idx_cart_items_product_id ON cart_items(product_id);
