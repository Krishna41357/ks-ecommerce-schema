
-- Create homepage_theme table
CREATE TABLE IF NOT EXISTS homepage_theme (
  id TEXT PRIMARY KEY DEFAULT 'default',
  hero_bg TEXT DEFAULT '#FFFFFF',
  categories_bg TEXT DEFAULT '#F9FAFB',
  subcategories_bg TEXT DEFAULT '#FFFFFF',
  collections_bg TEXT DEFAULT '#F9FAFB',
  reels_bg TEXT DEFAULT '#FFFFFF',
  trust_badges_bg TEXT DEFAULT '#F9FAFB',
  reviews_bg TEXT DEFAULT '#FFFFFF',
  footer_bg TEXT DEFAULT '#1F2937',
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Insert default theme
INSERT OR REPLACE INTO homepage_theme (id) VALUES ('default');
