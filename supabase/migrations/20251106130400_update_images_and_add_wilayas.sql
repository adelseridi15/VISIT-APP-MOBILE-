-- Update existing images and add more wilayas
DO $$
BEGIN
    -- Update Alger images
    UPDATE regions 
    SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/Vue_d%27Alger.jpg/1280px-Vue_d%27Alger.jpg'
    WHERE name = 'Alger';

    UPDATE heritage_sites 
    SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Casbah_of_Algiers-LOC.jpg/1280px-Casbah_of_Algiers-LOC.jpg'
    WHERE name = 'Casbah d''Alger';

    UPDATE heritage_sites 
    SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Notre_Dame_d%27Afrique.jpg/1280px-Notre_Dame_d%27Afrique.jpg'
    WHERE name = 'Basilique Notre-Dame d''Afrique';

    UPDATE gastronomy 
    SET image_url = 'https://i0.wp.com/www.webdo.tn/wp-content/uploads/2019/11/Rechta.jpg'
    WHERE name = 'Rechta';
END $$;

-- Add new wilayas
DO $$
DECLARE
    tlemcen_id uuid;
    constantine_id uuid;
    annaba_id uuid;
BEGIN
    -- Tlemcen
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('Tlemcen', 'تلمسان', 'Ville d''art et d''histoire, ancienne capitale du Maghreb central.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/Tlemcen_Mansourah.jpg/1280px-Tlemcen_Mansourah.jpg', 34.8783, -1.3150)
    RETURNING id INTO tlemcen_id;

    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (tlemcen_id, 'Mansourah', 'المنصورة', 'Vestiges d''une cité médiévale avec son minaret emblématique.', 'Historical', 'https://upload.wikimedia.org/wikipedia/commons/5/51/Minaret_mansourah.jpg', 34.8785, -1.3152),
    (tlemcen_id, 'Mosquée Sidi Boumediene', 'مسجد سيدي بومدين', 'Complexe religieux du 12ème siècle.', 'Religious', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/Mosque_of_Sidi_Boumediene.jpg/1280px-Mosque_of_Sidi_Boumediene.jpg', 34.8790, -1.3155);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (tlemcen_id, 'Chekhchoukha Tlemcenienne', 'شخشوخة تلمسانية', 'Version tlemcenienne du plat traditionnel.', 'Main Dish', 'https://i0.wp.com/www.dzdonna.com/wp-content/uploads/2022/11/Chekhchoukha-tlemcenienne.jpg', ARRAY['semoule', 'poulet', 'pois chiches', 'ail', 'épices']);

    -- Constantine
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('Constantine', 'قسنطينة', 'La ville des ponts suspendus, joyau de l''Est algérien.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Constantine_-_Algeria.jpg/1280px-Constantine_-_Algeria.jpg', 36.3650, 6.6147)
    RETURNING id INTO constantine_id;

    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (constantine_id, 'Pont Sidi M''Cid', 'جسر سيدي مسيد', 'Pont suspendu emblématique.', 'Modern', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Constantine_pont_sidi_mcid.jpg/1280px-Constantine_pont_sidi_mcid.jpg', 36.3652, 6.6149),
    (constantine_id, 'Palais du Bey', 'قصر الباي', 'Palais ottoman du 18ème siècle.', 'Historical', 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Palais_du_Bey_Constantine.jpg/1280px-Palais_du_Bey_Constantine.jpg', 36.3655, 6.6152);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (constantine_id, 'Hmis', 'حميس', 'Salade de poivrons grillés.', 'Appetizer', 'https://i0.wp.com/www.dzdonna.com/wp-content/uploads/2022/04/Hmis-constantinois.jpg', ARRAY['poivrons', 'tomates', 'ail', 'huile d''olive']);

    -- Annaba
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('Annaba', 'عنابة', 'Perle de l''Est avec ses plages et son patrimoine romain.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Annaba_Panorama.jpg/1280px-Annaba_Panorama.jpg', 36.9000, 7.7667)
    RETURNING id INTO annaba_id;

    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (annaba_id, 'Basilique Saint Augustin', 'كنيسة القديس أوغسطين', 'Basilique dédiée à Saint Augustin.', 'Religious', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Basilique_Saint_Augustin_Annaba.jpg/1280px-Basilique_Saint_Augustin_Annaba.jpg', 36.9002, 7.7669),
    (annaba_id, 'Ruines d''Hippone', 'آثار هيبون', 'Site archéologique romain.', 'Historical', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/Ruins_of_Hippo_Regius.jpg/1280px-Ruins_of_Hippo_Regius.jpg', 36.9005, 7.7672);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (annaba_id, 'Dobara', 'دوبارة', 'Soupe traditionnelle aux fèves.', 'Soup', 'https://i0.wp.com/www.dzdonna.com/wp-content/uploads/2023/01/Dobara-annabi.jpg', ARRAY['fèves', 'pois chiches', 'cumin', 'huile d''olive']);
END $$;