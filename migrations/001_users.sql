-- =====================================================
-- USERS TABLE
-- =====================================================

CREATE TABLE IF NOT EXISTS users (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  email TEXT UNIQUE,
  phone TEXT UNIQUE NOT NULL,
  password_hash TEXT,
  is_phone_verified INTEGER DEFAULT 0,
  is_email_verified INTEGER DEFAULT 0,
  otp TEXT,
  otp_expires_at TEXT,
  otp_attempts INTEGER DEFAULT 0,
  last_otp_sent TEXT,
  session_id TEXT,
  browser_fingerprint TEXT,
  push_enabled INTEGER DEFAULT 0,
  push_subscription TEXT,
  push_endpoint TEXT,
  is_new_user INTEGER DEFAULT 1,
  first_login_at TEXT,
  last_login_at TEXT,
  created_at TEXT DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_users_phone ON users(phone);
CREATE INDEX IF NOT EXISTS idx_users_email ON users(email);
CREATE INDEX IF NOT EXISTS idx_users_session ON users(session_id);
CREATE INDEX IF NOT EXISTS idx_users_push_enabled ON users(push_enabled);
