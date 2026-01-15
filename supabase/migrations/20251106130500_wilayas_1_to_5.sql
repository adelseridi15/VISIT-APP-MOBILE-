-- Mise à jour complète des wilayas dans l'ordre officiel
DO $$
DECLARE
    adrar_id uuid;
    chlef_id uuid;
    laghouat_id uuid;
    oum_bouaghi_id uuid;
    batna_id uuid;
BEGIN
    -- 01 - Adrar
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('Adrar', 'أدرار', 'Porte du Sahara, connue pour ses ksour et foggaras historiques.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7f/Adrar_City.jpg/1280px-Adrar_City.jpg', 27.8742, -0.2939)
    RETURNING id INTO adrar_id;

    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (adrar_id, 'Ksour de Timimoun', 'قصور تيميمون', 'Anciens villages fortifiés du Sahara.', 'Historical', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/Timimoun_Kasbah.jpg/1280px-Timimoun_Kasbah.jpg', 29.2639, 0.2306),
    (adrar_id, 'Foggaras de Timimoun', 'فقارات تيميمون', 'Système d''irrigation traditionnel.', 'Cultural', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Foggara_System.jpg/1280px-Foggara_System.jpg', 29.2642, 0.2308);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (adrar_id, 'Couscous au Chameau', 'كسكس بلحم الإبل', 'Couscous traditionnel à la viande de chameau.', 'Main Dish', 'https://i0.wp.com/www.dzdonna.com/wp-content/uploads/2023/03/Couscous-chameau.jpg', ARRAY['semoule', 'viande de chameau', 'pois chiches', 'légumes', 'épices sahariennes']);

    -- 02 - Chlef
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('Chlef', 'الشلف', 'Ville historique reconstruite après le séisme de 1980.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/Chlef_City.jpg/1280px-Chlef_City.jpg', 36.1644, 1.3317)
    RETURNING id INTO chlef_id;

    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (chlef_id, 'Site archéologique de Ténès', 'موقع تنس الأثري', 'Vestiges phéniciens et romains.', 'Historical', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Tenes_Archaeological_Site.jpg/1280px-Tenes_Archaeological_Site.jpg', 36.5089, 1.3103),
    (chlef_id, 'Mosquée El Abrar', 'مسجد الأبرار', 'Mosquée historique du centre-ville.', 'Religious', 'https://i0.wp.com/www.vitaminedz.org/photos/1/1580-mosquee-chlef.jpg', 36.1647, 1.3320);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (chlef_id, 'Berkoukes', 'بركوكس', 'Plat traditionnel de pâtes roulées.', 'Main Dish', 'https://i0.wp.com/www.dzdonna.com/wp-content/uploads/2022/04/Berkoukes-chlef.jpg', ARRAY['pâtes berkoukes', 'légumes', 'viande', 'pois chiches']);

    -- 03 - Laghouat
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('Laghouat', 'الأغواط', 'Ville-oasis aux portes du Sahara.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Laghouat_City.jpg/1280px-Laghouat_City.jpg', 33.8000, 2.8650)
    RETURNING id INTO laghouat_id;

    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (laghouat_id, 'Mosquée El Atik', 'المسجد العتيق', 'Plus ancienne mosquée de la ville.', 'Religious', 'https://i0.wp.com/www.vitaminedz.org/photos/1/1581-mosquee-laghouat.jpg', 33.8003, 2.8653),
    (laghouat_id, 'Palmeraie de Laghouat', 'واحة الأغواط', 'Oasis historique.', 'Natural', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/42/Laghouat_Palm_Grove.jpg/1280px-Laghouat_Palm_Grove.jpg', 33.8005, 2.8655);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (laghouat_id, 'Taam', 'طعام', 'Couscous aux légumes du désert.', 'Main Dish', 'https://i0.wp.com/www.dzdonna.com/wp-content/uploads/2022/05/Taam-laghouat.jpg', ARRAY['semoule', 'légumes du désert', 'viande séchée', 'épices']);

    -- 04 - Oum El Bouaghi
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('Oum El Bouaghi', 'أم البواقي', 'Région des Hauts Plateaux riche en sites archéologiques.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Oum_El_Bouaghi.jpg/1280px-Oum_El_Bouaghi.jpg', 35.8750, 7.1139)
    RETURNING id INTO oum_bouaghi_id;

    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (oum_bouaghi_id, 'Site de Madaure', 'موقع مداوروش', 'Ruines romaines antiques.', 'Historical', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5a/Madauros_Ruins.jpg/1280px-Madauros_Ruins.jpg', 35.8753, 7.1142),
    (oum_bouaghi_id, 'Lac de Ain M''lila', 'بحيرة عين مليلة', 'Zone humide protégée.', 'Natural', 'https://i0.wp.com/www.vitaminedz.org/photos/1/1582-lac-ain-mlila.jpg', 35.8755, 7.1144);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (oum_bouaghi_id, 'Chakhchoukha', 'شخشوخة', 'Version locale de ce plat traditionnel.', 'Main Dish', 'https://i0.wp.com/www.dzdonna.com/wp-content/uploads/2022/06/Chakhchoukha-oeb.jpg', ARRAY['galette', 'sauce rouge', 'viande', 'pois chiches']);

    -- 05 - Batna
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('Batna', 'باتنة', 'Capitale des Aurès, riche en histoire et culture.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9c/Batna_City.jpg/1280px-Batna_City.jpg', 35.5500, 6.1700)
    RETURNING id INTO batna_id;

    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (batna_id, 'Timgad', 'تيمقاد', 'Cité romaine classée UNESCO.', 'Historical', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3d/Timgad_ruins.jpg/1280px-Timgad_ruins.jpg', 35.4847, 6.4679),
    (batna_id, 'Balcon de Ghoufi', 'شرفات غوفي', 'Canyon spectaculaire avec habitations troglodytes.', 'Natural', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e2/Ghoufi_Balconies.jpg/1280px-Ghoufi_Balconies.jpg', 35.0656, 6.2833);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (batna_id, 'Cherchem', 'شرشم', 'Soupe traditionnelle des Aurès.', 'Soup', 'https://i0.wp.com/www.dzdonna.com/wp-content/uploads/2022/07/Cherchem-batna.jpg', ARRAY['blé concassé', 'pois chiches', 'viande séchée', 'herbes des Aurès']);

END $$;