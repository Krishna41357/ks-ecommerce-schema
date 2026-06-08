CREATE TABLE IF NOT EXISTS orders (
    user_id INTEGER NOT NULL,
    address_id INTEGER,
    total_amount DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    status TEXT NOT NULL DEFAULT 'pending', 
    payment_status TEXT DEFAULT 'unpaid',
    created_at TEXT DEFAULT CURRENT_TIMESTAMP,
    updated_at TEXT DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (address_id) REFERENCES address(id)
);

SELECT u.id, u.email, u.phone, o.total_amount, o.status
FROM orders o
JOIN users u ON o.user_id = u.id
WHERE u.is_phone_verified = 1
  AND u.push_enabled = 1;
