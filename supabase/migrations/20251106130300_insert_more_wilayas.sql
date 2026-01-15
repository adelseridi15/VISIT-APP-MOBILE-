-- More wilayas data
DO $$
DECLARE
    soukahras_id uuid;
    mila_id uuid;
    naama_id uuid;
BEGIN
    -- Souk Ahras
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('Souk Ahras', 'سوق أهراس', 'Ville historique, lieu de naissance de Saint Augustin.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/Souk_Ahras_City.jpg/1280px-Souk_Ahras_City.jpg', 36.2864, 7.9511)
    RETURNING id INTO soukahras_id;
    
    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (soukahras_id, 'Site de Thagaste', 'موقع ثاقاست', 'Site archéologique romain, lieu de naissance de Saint Augustin.', 'Historical', 'https://www.vitaminedz.org/photos/1/1570-thagaste.jpg', 36.2870, 7.9520),
    (soukahras_id, 'Forêt de Fedj M''Zala', 'غابة فج مزالة', 'Vaste forêt de chênes-lièges.', 'Natural', 'https://www.vitaminedz.org/photos/1/1571-foret-fedj.jpg', 36.2000, 7.9000);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (soukahras_id, 'Chakhchoukha', 'شخشوخة', 'Plat traditionnel à base de galette et sauce.', 'Main Dish', 'https://www.dzairdaily.com/wp-content/uploads/2022/04/chakhchoukha-souk-ahras.jpg', ARRAY['semoule', 'tomates', 'viande', 'pois chiches', 'épices']);

    -- Mila
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('Mila', 'ميلة', 'Ville antique aux oliveraies centenaires.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/Mila_City.jpg/1280px-Mila_City.jpg', 36.4500, 6.2667)
    RETURNING id INTO mila_id;
    
    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (mila_id, 'Mausolée de Sidi Ghanen', 'ضريح سيدي غانم', 'Monument historique et lieu de pèlerinage.', 'Religious', 'https://www.vitaminedz.org/photos/1/1572-mausolee-sidi-ghanen.jpg', 36.4510, 6.2670),
    (mila_id, 'Barrage de Beni Haroun', 'سد بني هارون', 'Plus grand barrage d''Algérie.', 'Modern', 'https://www.vitaminedz.org/photos/1/1573-barrage-beni-haroun.jpg', 36.5000, 6.3000);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (mila_id, 'Zeytoun', 'زيتون', 'Olives préparées à la façon traditionnelle.', 'Appetizer', 'https://www.dzairdaily.com/wp-content/uploads/2022/05/zeytoun-mila.jpg', ARRAY['olives vertes', 'huile d''olive', 'thym', 'ail']);

    -- Naâma
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('Naâma', 'النعامة', 'Porte du Sahara aux vastes steppes.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Naama_City.jpg/1280px-Naama_City.jpg', 33.2667, -0.3167)
    RETURNING id INTO naama_id;
    
    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (naama_id, 'Djebel Aïssa', 'جبل عيسى', 'Montagne majestueuse et site naturel protégé.', 'Natural', 'https://www.vitaminedz.org/photos/1/1574-djebel-aissa.jpg', 33.2700, -0.3200),
    (naama_id, 'Ksour de Sfissifa', 'قصور سفيسيفة', 'Villages fortifiés traditionnels.', 'Historical', 'https://www.vitaminedz.org/photos/1/1575-ksour-sfissifa.jpg', 33.2800, -0.3300);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (naama_id, 'Rfiss', 'رفيس', 'Dessert traditionnel aux dattes.', 'Dessert', 'https://www.dzairdaily.com/wp-content/uploads/2022/06/rfiss-naama.jpg', ARRAY['pain sec', 'dattes', 'beurre', 'miel']);
END $$;