-- Remaining wilayas data
DO $$
DECLARE
    relizane_id uuid;
    eloued_id uuid;
    khenchela_id uuid;
BEGIN
    -- Relizane
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('Relizane', 'غليزان', 'Ville agricole avec un riche patrimoine historique.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3b/Relizane_City.jpg/1280px-Relizane_City.jpg', 35.7397, 0.5556)
    RETURNING id INTO relizane_id;
    
    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (relizane_id, 'Kalâa de Beni Rached', 'قلعة بني راشد', 'Forteresse médiévale sur les hauteurs.', 'Historical', 'https://www.vitaminedz.org/photos/1/1560-kalaa-beni-rached.jpg', 35.7800, 0.5700),
    (relizane_id, 'Barrage de Gargar', 'سد قرقار', 'Plus grand barrage de la région.', 'Modern', 'https://www.vitaminedz.org/photos/1/1561-barrage-gargar.jpg', 35.9000, 0.9000);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (relizane_id, 'Ziraoui', 'زيراوي', 'Couscous local aux légumes.', 'Main Dish', 'https://www.dzairdaily.com/wp-content/uploads/2022/01/ziraoui-relizane.jpg', ARRAY['semoule', 'légumes', 'viande', 'pois chiches']);

    -- El Oued
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('El Oued', 'الوادي', 'La ville aux mille coupoles.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f5/El_Oued_City.jpg/1280px-El_Oued_City.jpg', 33.3680, 6.8516)
    RETURNING id INTO eloued_id;
    
    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (eloued_id, 'Souk Libya', 'سوق ليبيا', 'Grand marché traditionnel.', 'Cultural', 'https://www.vitaminedz.org/photos/1/1562-souk-libya.jpg', 33.3700, 6.8520),
    (eloued_id, 'Ghout El Oued', 'غوط الوادي', 'Palmeraies traditionnelles.', 'Agricultural', 'https://www.vitaminedz.org/photos/1/1563-ghout-oued.jpg', 33.3690, 6.8530);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (eloued_id, 'Malfouf', 'ملفوف', 'Pâtisserie aux dattes.', 'Dessert', 'https://www.dzairdaily.com/wp-content/uploads/2022/02/malfouf-el-oued.jpg', ARRAY['semoule fine', 'dattes', 'beurre', 'huile']);

    -- Khenchela
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('Khenchela', 'خنشلة', 'Ville des Aurès aux sources thermales.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7c/Khenchela_Panorama.jpg/1280px-Khenchela_Panorama.jpg', 35.4333, 7.1333)
    RETURNING id INTO khenchela_id;
    
    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (khenchela_id, 'Hammam Essalihine', 'حمام الصالحين', 'Sources thermales romaines.', 'Historical', 'https://www.vitaminedz.org/photos/1/1564-hammam-essalihine.jpg', 35.4350, 7.1350),
    (khenchela_id, 'Mont Chélia', 'جبل شيليا', 'Plus haut sommet des Aurès.', 'Natural', 'https://www.vitaminedz.org/photos/1/1565-mont-chelia.jpg', 35.3200, 6.9000);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (khenchela_id, 'Cherchem', 'شرشم', 'Soupe traditionnelle.', 'Soup', 'https://www.dzairdaily.com/wp-content/uploads/2022/03/cherchem-khenchela.jpg', ARRAY['blé concassé', 'légumes', 'herbes', 'épices']);
END $$;