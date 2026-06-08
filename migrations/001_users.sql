-- =====================================================
-- USERS TABLE - COMPLETE SCHEMA
-- Comprehensive user authentication with OTP, push notifications, and security
-- =====================================================

CREATE TABLE IF NOT EXISTS users (
  -- Primary Key
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  
  -- Basic Information
  name TEXT,
  email TEXT UNIQUE,
  phone TEXT UNIQUE NOT NULL,
  password_hash TEXT,
  
  -- Verification Status
  is_phone_verified INTEGER DEFAULT 0,
  is_email_verified INTEGER DEFAULT 0,
  
  -- OTP Authentication
  otp TEXT,                      -- hashed OTP for security
  otp_expires_at TEXT,           -- OTP expiry timestamp (ISO 8601)
  otp_attempts INTEGER DEFAULT 0,
  last_otp_sent TEXT,            -- last OTP sent timestamp
  
  -- Session Security
  session_id TEXT,               -- secure session identifier
  browser_fingerprint TEXT,      -- browser fingerprint for security
  
  -- Push Notifications
  push_enabled INTEGER DEFAULT 0,
  push_subscription TEXT,        -- Web Push subscription JSON
  push_endpoint TEXT,            -- Push notification endpoint
  
  -- User Tracking
  is_new_user INTEGER DEFAULT 0,
  first_login_at TEXT,           -- first successful login timestamp
  last_login_at TEXT,            -- most recent login timestamp
  
  -- Timestamps
  created_at TEXT DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT DEFAULT CURRENT_TIMESTAMP
);

-- Indexes for Performance
CREATE INDEX IF NOT EXISTS idx_users_phone ON users(phone);
CREATE INDEX IF NOT EXISTS idx_users_email ON users(email);
CREATE INDEX IF NOT EXISTS idx_users_session ON users(session_id);
CREATE INDEX IF NOT EXISTS idx_users_push_enabled ON users(push_enabled);
