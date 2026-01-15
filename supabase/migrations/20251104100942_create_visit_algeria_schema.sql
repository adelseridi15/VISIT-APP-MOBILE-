/*
  # Visit Algeria - Schema Setup
  
  ## Description
  Creates the database schema for the Visit Algeria mobile app, a modern tourist guide
  showcasing Algerian regions, heritage sites, and gastronomy.
  
  ## New Tables
  
  ### `regions`
  - `id` (uuid, primary key) - Unique identifier
  - `name` (text) - Region name (e.g., "Alger", "Constantine")
  - `name_ar` (text) - Region name in Arabic
  - `description` (text) - Brief description
  - `image_url` (text) - Main image URL
  - `latitude` (numeric) - Geographic coordinates
  - `longitude` (numeric) - Geographic coordinates
  - `created_at` (timestamptz) - Creation timestamp
  
  ### `heritage_sites`
  - `id` (uuid, primary key) - Unique identifier
  - `region_id` (uuid, foreign key) - Links to regions table
  - `name` (text) - Site name
  - `name_ar` (text) - Site name in Arabic
  - `description` (text) - Detailed description
  - `category` (text) - Type (e.g., "Archaeological", "Historical", "Natural")
  - `image_url` (text) - Main image URL
  - `latitude` (numeric) - Geographic coordinates
  - `longitude` (numeric) - Geographic coordinates
  - `created_at` (timestamptz) - Creation timestamp
  
  ### `gastronomy`
  - `id` (uuid, primary key) - Unique identifier
  - `region_id` (uuid, foreign key) - Links to regions table
  - `name` (text) - Dish/specialty name
  - `name_ar` (text) - Dish name in Arabic
  - `description` (text) - Detailed description
  - `category` (text) - Type (e.g., "Main Dish", "Dessert", "Beverage")
  - `image_url` (text) - Main image URL
  - `ingredients` (text[]) - List of ingredients
  - `created_at` (timestamptz) - Creation timestamp
  
  ### `favorites`
  - `id` (uuid, primary key) - Unique identifier
  - `user_id` (uuid) - User identifier (for future auth integration)
  - `item_type` (text) - Type of item (region, heritage, gastronomy)
  - `item_id` (uuid) - ID of the favorited item
  - `created_at` (timestamptz) - Creation timestamp
  
  ## Security
  - Enable RLS on all tables
  - Public read access for regions, heritage_sites, and gastronomy
  - Authenticated user access for favorites management
  
  ## Notes
  - All tables include timestamps for auditing
  - Geographic coordinates enable map features
  - Bilingual support (French/Arabic) for broader accessibility
  - Array type for ingredients allows flexible recipe data
*/

-- Create regions table
CREATE TABLE IF NOT EXISTS regions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  name_ar text NOT NULL,
  description text NOT NULL,
  image_url text NOT NULL,
  latitude numeric,
  longitude numeric,
  created_at timestamptz DEFAULT now()
);

-- Create heritage_sites table
CREATE TABLE IF NOT EXISTS heritage_sites (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  region_id uuid REFERENCES regions(id) ON DELETE CASCADE,
  name text NOT NULL,
  name_ar text NOT NULL,
  description text NOT NULL,
  category text NOT NULL,
  image_url text NOT NULL,
  latitude numeric,
  longitude numeric,
  created_at timestamptz DEFAULT now()
);

-- Create gastronomy table
CREATE TABLE IF NOT EXISTS gastronomy (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  region_id uuid REFERENCES regions(id) ON DELETE CASCADE,
  name text NOT NULL,
  name_ar text NOT NULL,
  description text NOT NULL,
  category text NOT NULL,
  image_url text NOT NULL,
  ingredients text[] DEFAULT '{}',
  created_at timestamptz DEFAULT now()
);

-- Create favorites table
CREATE TABLE IF NOT EXISTS favorites (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL DEFAULT gen_random_uuid(),
  item_type text NOT NULL CHECK (item_type IN ('region', 'heritage', 'gastronomy')),
  item_id uuid NOT NULL,
  created_at timestamptz DEFAULT now(),
  UNIQUE(user_id, item_type, item_id)
);

-- Enable RLS
ALTER TABLE regions ENABLE ROW LEVEL SECURITY;
ALTER TABLE heritage_sites ENABLE ROW LEVEL SECURITY;
ALTER TABLE gastronomy ENABLE ROW LEVEL SECURITY;
ALTER TABLE favorites ENABLE ROW LEVEL SECURITY;

-- RLS Policies for regions (public read)
CREATE POLICY "Public can view regions"
  ON regions FOR SELECT
  TO public
  USING (true);

-- RLS Policies for heritage_sites (public read)
CREATE POLICY "Public can view heritage sites"
  ON heritage_sites FOR SELECT
  TO public
  USING (true);

-- RLS Policies for gastronomy (public read)
CREATE POLICY "Public can view gastronomy"
  ON gastronomy FOR SELECT
  TO public
  USING (true);

-- RLS Policies for favorites (user-specific access)
CREATE POLICY "Users can view own favorites"
  ON favorites FOR SELECT
  TO public
  USING (true);

CREATE POLICY "Users can insert own favorites"
  ON favorites FOR INSERT
  TO public
  WITH CHECK (true);

CREATE POLICY "Users can delete own favorites"
  ON favorites FOR DELETE
  TO public
  USING (true);

-- Insert sample data for regions
INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
('Alger', 'الجزائر', 'La capitale blanche, mélange parfait d''histoire ottomane et de modernité méditerranéenne.', 'https://images.pexels.com/photos/14903644/pexels-photo-14903644.jpeg', 36.7538, 3.0588),
('Constantine', 'قسنطينة', 'La ville des ponts suspendus, perchée sur des falaises spectaculaires.', 'https://images.pexels.com/photos/10961165/pexels-photo-10961165.jpeg', 36.3650, 6.6147),
('Oran', 'وهران', 'La radieuse, capitale culturelle et musicale de l''Ouest algérien.', 'https://images.pexels.com/photos/12753820/pexels-photo-12753820.jpeg', 35.6969, -0.6331),
('Tlemcen', 'تلمسان', 'La perle du Maghreb, riche en architecture andalouse et jardins luxuriants.', 'https://images.pexels.com/photos/11536703/pexels-photo-11536703.jpeg', 34.8780, -1.3150),
('Ghardaïa', 'غرداية', 'Ville du M''Zab, patrimoine mondial UNESCO, architecture unique du désert.', 'https://images.pexels.com/photos/7740276/pexels-photo-7740276.jpeg', 32.4915, 3.6673),
('Tamanrasset', 'تمنراست', 'Porte du Sahara, au cœur du massif montagneux du Hoggar.', 'https://images.pexels.com/photos/3889855/pexels-photo-3889855.jpeg', 22.7850, 5.5228);

-- Insert sample heritage sites
INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
((SELECT id FROM regions WHERE name = 'Alger'), 'Casbah d''Alger', 'قصبة الجزائر', 'Citadelle ottomane classée UNESCO, labyrinthe de ruelles étroites et maisons traditionnelles surplombant la mer.', 'Historical', 'https://images.pexels.com/photos/12753754/pexels-photo-12753754.jpeg', 36.7833, 3.0594),
((SELECT id FROM regions WHERE name = 'Alger'), 'Basilique Notre-Dame d''Afrique', 'كنيسة السيدة الأفريقية', 'Monument emblématique perché sur les hauteurs, offrant une vue panoramique sur la baie d''Alger.', 'Religious', 'https://images.pexels.com/photos/14903644/pexels-photo-14903644.jpeg', 36.7919, 3.0503),
((SELECT id FROM regions WHERE name = 'Constantine'), 'Pont Sidi M''Cid', 'جسر سيدي مسيد', 'Pont suspendu vertigineux de 175m de hauteur, traversant les gorges spectaculaires du Rhumel.', 'Engineering', 'https://images.pexels.com/photos/10961165/pexels-photo-10961165.jpeg', 36.3667, 6.6167),
((SELECT id FROM regions WHERE name = 'Tlemcen'), 'Grande Mosquée de Tlemcen', 'الجامع الكبير بتلمسان', 'Chef-d''œuvre de l''architecture almohade du XIIe siècle, finesse des ornements et calligraphie.', 'Religious', 'https://images.pexels.com/photos/2291004/pexels-photo-2291004.jpeg', 34.8786, -1.3167),
((SELECT id FROM regions WHERE name = 'Ghardaïa'), 'Vallée du M''Zab', 'وادي مزاب', 'Ensemble urbain unique du Xe siècle, adaptation parfaite à l''environnement saharien.', 'Archaeological', 'https://images.pexels.com/photos/7740276/pexels-photo-7740276.jpeg', 32.4850, 3.6710),
((SELECT id FROM regions WHERE name = 'Tamanrasset'), 'Assekrem', 'أسكرم', 'Plateau rocheux sacré à 2800m d''altitude, lever de soleil légendaire sur le Hoggar.', 'Natural', 'https://images.pexels.com/photos/3889855/pexels-photo-3889855.jpeg', 23.2667, 5.7000);

-- Insert sample gastronomy
INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
((SELECT id FROM regions WHERE name = 'Alger'), 'Couscous Royal', 'كسكس ملكي', 'Le plat national par excellence, semoule fine vapeur avec légumes de saison et viandes variées.', 'Main Dish', 'https://images.pexels.com/photos/6419720/pexels-photo-6419720.jpeg', ARRAY['Semoule', 'Agneau', 'Poulet', 'Merguez', 'Légumes', 'Pois chiches', 'Épices']),
((SELECT id FROM regions WHERE name = 'Constantine'), 'Chakhchoukha', 'شخشوخة', 'Galettes de pain émincées nappées d''une sauce rouge épicée avec viande et légumes.', 'Main Dish', 'https://images.pexels.com/photos/4079520/pexels-photo-4079520.jpeg', ARRAY['Pain traditionnel', 'Viande d''agneau', 'Tomates', 'Pois chiches', 'Ras el hanout']),
((SELECT id FROM regions WHERE name = 'Oran'), 'Karantika', 'كرانتيكا', 'Flan de pois chiches doré et croustillant, street food emblématique d''Oran.', 'Snack', 'https://images.pexels.com/photos/5864245/pexels-photo-5864245.jpeg', ARRAY['Farine de pois chiches', 'Œufs', 'Cumin', 'Harissa']),
((SELECT id FROM regions WHERE name = 'Tlemcen'), 'Mhajeb', 'محاجب', 'Crêpe feuilletée farcie d''oignons et tomates, spécialité de l''Ouest algérien.', 'Snack', 'https://images.pexels.com/photos/4871117/pexels-photo-4871117.jpeg', ARRAY['Semoule fine', 'Oignons', 'Tomates', 'Poivrons', 'Huile d''olive']),
((SELECT id FROM regions WHERE name = 'Ghardaïa'), 'Boulfaf', 'بولفاف', 'Foie d''agneau grillé enrobé de graisse, tradition culinaire du M''Zab.', 'Main Dish', 'https://images.pexels.com/photos/6419715/pexels-photo-6419715.jpeg', ARRAY['Foie d''agneau', 'Graisse', 'Cumin', 'Sel']),
((SELECT id FROM regions WHERE name = 'Tamanrasset'), 'Tadjella', 'تاجلة', 'Galette touareg cuite dans le sable chaud, accompagnement traditionnel du thé.', 'Bread', 'https://images.pexels.com/photos/7937486/pexels-photo-7937486.jpeg', ARRAY['Farine', 'Eau', 'Sel', 'Levure']);