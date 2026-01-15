-- Wilayas 6-10
DO $$
DECLARE
    bejaia_id uuid;
    biskra_id uuid;
    bechar_id uuid;
    blida_id uuid;
    bouira_id uuid;
BEGIN
    -- 06 - Béjaïa
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('Béjaïa', 'بجاية', 'Perle de la Kabylie avec ses plages et montagnes.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Bejaia_panorama.jpg/1280px-Bejaia_panorama.jpg', 36.7500, 5.0833)
    RETURNING id INTO bejaia_id;

    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (bejaia_id, 'Casbah de Béjaïa', 'قصبة بجاية', 'Citadelle historique surplombant la mer.', 'Historical', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/Fort_Bejaia.jpg/1280px-Fort_Bejaia.jpg', 36.7505, 5.0838),
    (bejaia_id, 'Cap Carbon', 'رأس كاربون', 'Plus haut phare d''Afrique du Nord.', 'Natural', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2d/Cap_Carbon.jpg/1280px-Cap_Carbon.jpg', 36.7508, 5.1064);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (bejaia_id, 'Aghrum Akuran', 'أغروم أكوران', 'Pain traditionnel kabyle aux olives.', 'Bread', 'https://i0.wp.com/www.dzdonna.com/wp-content/uploads/2022/08/Aghrum-bejaia.jpg', ARRAY['farine', 'olives', 'huile d''olive', 'thym']);

    -- 07 - Biskra
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('Biskra', 'بسكرة', 'Porte du Sahara, oasis aux mille palmiers.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Biskra_Panorama.jpg/1280px-Biskra_Panorama.jpg', 34.8500, 5.7333)
    RETURNING id INTO biskra_id;

    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (biskra_id, 'Balcon de Ghoufi', 'شرفات غوفي', 'Canyon spectaculaire aux habitations troglodytes.', 'Natural', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Ghoufi.jpg/1280px-Ghoufi.jpg', 34.8505, 5.7338),
    (biskra_id, 'Hammam Salihine', 'حمام الصالحين', 'Sources thermales thérapeutiques.', 'Cultural', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/96/Hammam_Salihine.jpg/1280px-Hammam_Salihine.jpg', 34.8508, 5.7341);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (biskra_id, 'Ziban', 'زيبان', 'Variété de dattes réputée.', 'Dessert', 'https://i0.wp.com/www.dzdonna.com/wp-content/uploads/2022/09/Dattes-ziban.jpg', ARRAY['dattes deglet nour']);

    -- 08 - Béchar
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('Béchar', 'بشار', 'Ville saharienne aux portes du Grand Erg Occidental.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Bechar_City.jpg/1280px-Bechar_City.jpg', 31.6167, -2.2167)
    RETURNING id INTO bechar_id;

    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (bechar_id, 'Taghit', 'تاغيت', 'Oasis historique avec ses dunes majestueuses.', 'Natural', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/Taghit_Oasis.jpg/1280px-Taghit_Oasis.jpg', 31.6170, -2.2170),
    (bechar_id, 'Ksour de la Saoura', 'قصور الساورة', 'Villages fortifiés traditionnels.', 'Historical', 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a2/Ksour_Saoura.jpg/1280px-Ksour_Saoura.jpg', 31.6173, -2.2173);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (bechar_id, 'Madfouna', 'مدفونة', 'Pizza du Sahara aux épices.', 'Main Dish', 'https://i0.wp.com/www.dzdonna.com/wp-content/uploads/2022/10/Madfouna-bechar.jpg', ARRAY['pâte', 'viande hachée', 'oignons', 'épices sahariennes']);

    -- 09 - Blida
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('Blida', 'البليدة', 'Ville des Roses au pied de l''Atlas.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1d/Blida_City.jpg/1280px-Blida_City.jpg', 36.4700, 2.8300)
    RETURNING id INTO blida_id;

    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (blida_id, 'Parc National de Chréa', 'الحديقة الوطنية شريعة', 'Parc montagneux avec station de ski.', 'Natural', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c5/Chrea_National_Park.jpg/1280px-Chrea_National_Park.jpg', 36.4703, 2.8303),
    (blida_id, 'Place 1er Novembre', 'ساحة أول نوفمبر', 'Place historique coloniale.', 'Historical', 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Place_1er_Novembre_Blida.jpg/1280px-Place_1er_Novembre_Blida.jpg', 36.4705, 2.8305);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (blida_id, 'Oranges de la Mitidja', 'برتقال المتيجة', 'Agrumes réputés de la région.', 'Fruit', 'https://i0.wp.com/www.dzdonna.com/wp-content/uploads/2022/11/Oranges-mitidja.jpg', ARRAY['oranges']);

    -- 10 - Bouira
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('Bouira', 'البويرة', 'Porte de la Kabylie aux paysages montagneux.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Bouira_City.jpg/1280px-Bouira_City.jpg', 36.3750, 3.9000)
    RETURNING id INTO bouira_id;

    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (bouira_id, 'Tikjda', 'تيكجدة', 'Station de montagne panoramique.', 'Natural', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d6/Tikjda.jpg/1280px-Tikjda.jpg', 36.3753, 3.9003),
    (bouira_id, 'Fort Turc', 'القلعة التركية', 'Fortification ottomane historique.', 'Historical', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/Fort_Turc_Bouira.jpg/1280px-Fort_Turc_Bouira.jpg', 36.3755, 3.9005);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (bouira_id, 'Seksu', 'سكسو', 'Couscous kabyle aux légumes.', 'Main Dish', 'https://i0.wp.com/www.dzdonna.com/wp-content/uploads/2022/12/Seksu-bouira.jpg', ARRAY['semoule', 'légumes de saison', 'huile d''olive', 'fèves']);
END $$;