CREATE TABLE IF NOT EXISTS rate_limits (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER,
    endpoint TEXT NOT NULL,
    attempt_count INTEGER DEFAULT 0,
    window_start TEXT DEFAULT CURRENT_TIMESTAMP,
    blocked_until TEXT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);
 
