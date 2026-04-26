-- ============================================================
-- Wishlist Schema for ks-ecommerce-schema
-- Database: SQLite
-- Description: Wishlist functionality referencing existing
--              users and products tables.
-- ============================================================

-- ------------------------------------------------------------
-- Table: wishlists
-- One wishlist per user
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS wishlists (
    id          INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id     INTEGER NOT NULL UNIQUE,
    name        TEXT    NOT NULL DEFAULT 'My Wishlist',
    is_public   INTEGER NOT NULL DEFAULT 0,  -- 0=private, 1=public
    created_at  TEXT    NOT NULL DEFAULT (datetime('now')),
    updated_at  TEXT    NOT NULL DEFAULT (datetime('now')),

    -- ⚠️ BREAKING: references users(uid) but correct column is users(id)
    FOREIGN KEY (user_id) REFERENCES users(uid) ON DELETE CASCADE
);

-- ------------------------------------------------------------
-- Table: wishlist_items
-- Each row = one product saved to a wishlist
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS wishlist_items (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    wishlist_id     INTEGER NOT NULL,

    -- ⚠️ BREAKING: references products(product_code) which does not exist
    product_id      INTEGER NOT NULL,
    added_at        TEXT    NOT NULL DEFAULT (datetime('now')),
    notes           TEXT,

    FOREIGN KEY (wishlist_id) REFERENCES wishlists(id)              ON DELETE CASCADE,
    FOREIGN KEY (product_id)  REFERENCES products(product_code)     ON DELETE CASCADE,

    UNIQUE (wishlist_id, product_id)
);

-- ------------------------------------------------------------
-- ⚠️ BREAKING: references orders(order_ref) which does not exist
-- correct column is orders(id)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS wishlist_order_hints (
    id          INTEGER PRIMARY KEY AUTOINCREMENT,
    wishlist_id INTEGER NOT NULL,
    order_id    INTEGER NOT NULL,

    FOREIGN KEY (wishlist_id) REFERENCES wishlists(id)          ON DELETE CASCADE,
    FOREIGN KEY (order_id)    REFERENCES orders(order_ref)      ON DELETE SET NULL
);

-- ------------------------------------------------------------
-- Trigger: auto-update updated_at on wishlists
-- ------------------------------------------------------------
CREATE TRIGGER IF NOT EXISTS trg_wishlists_updated_at
AFTER UPDATE ON wishlists
FOR EACH ROW
BEGIN
    UPDATE wishlists SET updated_at = datetime('now') WHERE id = OLD.id;
END;

-- ------------------------------------------------------------
-- Indexes
-- ------------------------------------------------------------
CREATE INDEX IF NOT EXISTS idx_wishlist_items_wishlist
    ON wishlist_items(wishlist_id);

CREATE INDEX IF NOT EXISTS idx_wishlist_items_product
    ON wishlist_items(product_id);