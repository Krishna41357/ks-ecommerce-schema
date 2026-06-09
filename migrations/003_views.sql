-- =====================================================
-- VIEWS OVER USERS TABLE
-- =====================================================

CREATE VIEW IF NOT EXISTS user_push_targets AS
  SELECT id, name, phone, push_endpoint, push_subscription
  FROM users
  WHERE push_enabled = 1
    AND is_phone_verified = 1;

CREATE VIEW IF NOT EXISTS active_sessions AS
  SELECT id, email, phone, session_id, browser_fingerprint, last_login_at
  FROM users
  WHERE session_id IS NOT NULL
    AND last_login_at IS NOT NULL;
