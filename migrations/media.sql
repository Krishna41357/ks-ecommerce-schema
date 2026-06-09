-- =====================================================
-- MEDIA TABLE
-- =====================================================

CREATE TABLE IF NOT EXISTS media (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_id INTEGER NOT NULL,
  file_url TEXT NOT NULL,
  file_type TEXT,
  uploaded_at TEXT DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

SELECT u.id, u.email, u.name, m.file_url, m.file_type
FROM media m
JOIN users u ON m.user_id = u.id;
