
-- Drop table if exists (for development)
DROP TABLE IF EXISTS addresses;

-- Create addresses table
CREATE TABLE IF NOT EXISTS addresses (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_id INTEGER NOT NULL,
  label TEXT,
  full_name TEXT NOT NULL,
  phone TEXT NOT NULL,
  email TEXT,
  address_line1 INTEGER NOT NULL,
  address_line2 TEXT,
  city TEXT NOT NULL,
  state TEXT NOT NULL,
  postal_code TEXT NOT NULL,
  country TEXT NOT NULL DEFAULT 'India',
  is_default INTEGER DEFAULT 0,
  created_at TEXT DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT DEFAULT CURRENT_TIMESTAMP,
  
  FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Create indexes
CREATE INDEX IF NOT EXISTS idx_addresses_user_id ON addresses(user_id);
CREATE INDEX IF NOT EXISTS idx_addresses_is_default ON addresses(is_default);

-- Insert sample data (optional - remove in production)
-- INSERT INTO addresses (user_id, label, full_name, phone, email, address_line1, city, state, postal_code, is_default)
-- VALUES 
-- (1, 'Home', 'John Doe', '9876543210', 'john@example.com', '123 Main Street', 'Mumbai', 'Maharashtra', '400001', 1),
-- (1, 'Office', 'John Doe', '9876543210', 'john@example.com', '456 Business Park', 'Mumbai', 'Maharashtra', '400002', 0);
