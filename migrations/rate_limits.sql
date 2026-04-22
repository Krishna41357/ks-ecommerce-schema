-- =====================================================
-- RATE_LIMITS TABLE
-- Rate limiting for OTP requests, login attempts, and API security
-- =====================================================

CREATE TABLE IF NOT EXISTS rate_limits (
  -- Identifier (e.g., "phone:+919876543210", "ip:192.168.1.1")
  identifier TEXT PRIMARY KEY,
  
  -- Rate Limit Tracking
  attempts INTEGER DEFAULT 0,
  window_start INTEGER NOT NULL,  -- Unix timestamp
  locked_until INTEGER,            -- Unix timestamp when lock expires
  updated_at INTEGER NOT NULL      -- Unix timestamp of last update
);

-- Indexes for Performance
CREATE INDEX IF NOT EXISTS idx_rate_limits_window ON rate_limits(window_start);
CREATE INDEX IF NOT EXISTS idx_rate_limits_locked ON rate_limits(locked_until);