-- Drop table if exists (for clean migration)
DROP TABLE IF EXISTS media;

-- Create media table for banners and reels
CREATE TABLE media (
  id TEXT PRIMARY KEY,
  type TEXT NOT NULL,
  title TEXT,
  subtitle TEXT,
  description TEXT,
  image_url TEXT,
  mobile_image_url TEXT,
  video_url TEXT,
  cta_text TEXT,
  cta_link TEXT,
  cta_type TEXT DEFAULT 'none',
  cta_slug TEXT,
  duration INTEGER,
  order_index INTEGER DEFAULT 0,
  is_active INTEGER DEFAULT 1,
  created_at TEXT DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT DEFAULT CURRENT_TIMESTAMP
);

-- Create indexes for faster queries
CREATE INDEX idx_media_type ON media(type);
CREATE INDEX idx_media_active ON media(is_active);
CREATE INDEX idx_media_order ON media(order_index);
CREATE INDEX idx_media_type_active_order ON media(type, is_active, order_index);