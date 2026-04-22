-- -- ==========================================
-- -- MIGRATION: Fix Push Notification Columns
-- -- Run this migration on your D1 database
-- -- ==========================================

-- -- Step 1: Check if columns exist (informational)
-- -- SELECT sql FROM sqlite_master WHERE type='table' AND name='users';

-- -- Step 2: Add new columns with explicit TEXT type if they don't exist
-- -- Note: D1/SQLite doesn't have ALTER COLUMN, so we add if missing

-- -- Add push_subscription column (if not exists)
-- ALTER TABLE users ADD COLUMN push_subscription TEXT;

-- -- Add push_endpoint column (if not exists)
-- ALTER TABLE users ADD COLUMN push_endpoint TEXT;

-- -- Add push_enabled column (if not exists)
-- ALTER TABLE users ADD COLUMN push_enabled INTEGER DEFAULT 0;

-- -- Add browser_fingerprint column (if not exists)
-- ALTER TABLE users ADD COLUMN browser_fingerprint TEXT;

-- -- Step 3: Create indexes for faster queries
-- CREATE INDEX IF NOT EXISTS idx_users_push_enabled ON users(push_enabled);
-- CREATE INDEX IF NOT EXISTS idx_users_push_endpoint ON users(push_endpoint);
-- CREATE INDEX IF NOT EXISTS idx_users_browser_fingerprint ON users(browser_fingerprint);

-- -- Step 4: Clean up any existing null/invalid data
-- UPDATE users 
-- SET push_subscription = NULL,
--     push_endpoint = NULL,
--     push_enabled = 0
-- WHERE push_subscription IS NOT NULL 
--   AND (LENGTH(push_subscription) = 0 OR push_subscription = '');

-- -- Verify the changes
-- -- SELECT 
-- --   id,
-- --   phone,
-- --   push_enabled,
-- --   LENGTH(push_subscription) as sub_len,
-- --   LENGTH(push_endpoint) as endpoint_len
-- -- FROM users;