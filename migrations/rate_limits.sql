-- =====================================================
-- RATE LIMITS TABLE
-- =====================================================

CREATE TABLE IF NOT EXISTS rate_limits (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_id INTEGER,
  endpoint TEXT NOT NULL,
  attempt_count INTEGER DEFAULT 0,
  window_start TEXT DEFAULT CURRENT_TIMESTAMP,
  blocked_until TEXT,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

SELECT u.id, u.phone, r.endpoint, r.attempt_count, r.blocked_until
FROM rate_limits r
JOIN users u ON r.user_id = u.id
WHERE r.blocked_until IS NOT NULL;
