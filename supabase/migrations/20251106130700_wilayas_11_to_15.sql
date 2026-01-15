-- Wilayas restantes
DO $$
DECLARE
    tamanrasset_id uuid;
    tebessa_id uuid;
    tlemcen_id uuid;
    tiaret_id uuid;
    tizi_ouzou_id uuid;
    alger_id uuid;
    djelfa_id uuid;
    jijel_id uuid;
    setif_id uuid;
    saida_id uuid;
    skikda_id uuid;
    sidi_bel_abbes_id uuid;
    annaba_id uuid;
    guelma_id uuid;
    constantine_id uuid;
    medea_id uuid;
    mostaganem_id uuid;
    msila_id uuid;
    mascara_id uuid;
    ouargla_id uuid;
    oran_id uuid;
    el_bayadh_id uuid;
    illizi_id uuid;
    bordj_bou_arreridj_id uuid;
    boumerdes_id uuid;
    el_tarf_id uuid;
    tindouf_id uuid;
    tissemsilt_id uuid;
    el_oued_id uuid;
    khenchela_id uuid;
    souk_ahras_id uuid;
    tipaza_id uuid;
    mila_id uuid;
    ain_defla_id uuid;
    naama_id uuid;
    ain_temouchent_id uuid;
    ghardaia_id uuid;
    relizane_id uuid;
BEGIN
    -- 11 - Tamanrasset
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('Tamanrasset', 'تمنراست', 'Joyau du Sahara, terre des Touaregs et du Hoggar.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Tamanrasset_City.jpg/1280px-Tamanrasset_City.jpg', 22.7850, 5.5228)
    RETURNING id INTO tamanrasset_id;

    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (tamanrasset_id, 'Assekrem', 'الأسكرم', 'Ermitage du Père de Foucauld dans le Hoggar.', 'Historical', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/89/Assekrem.jpg/1280px-Assekrem.jpg', 23.2697, 5.6349),
    (tamanrasset_id, 'Parc du Hoggar', 'حظيرة الهقار', 'Massif montagneux spectaculaire.', 'Natural', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Hoggar_Mountains.jpg/1280px-Hoggar_Mountains.jpg', 23.2833, 5.5333);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (tamanrasset_id, 'Taguella', 'تاقلة', 'Pain traditionnel touareg cuit dans le sable.', 'Bread', 'https://i0.wp.com/www.dzdonna.com/wp-content/uploads/2023/01/Taguella-tamnrasset.jpg', ARRAY['farine', 'eau', 'sel']);

    -- 12 - Tébessa
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('Tébessa', 'تبسة', 'Ville aux trésors romains et byzantins.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/Tebessa_Panorama.jpg/1280px-Tebessa_Panorama.jpg', 35.4000, 8.1200)
    RETURNING id INTO tebessa_id;

    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (tebessa_id, 'Arc de Caracalla', 'قوس كراكلا', 'Arc de triomphe romain du 3ème siècle.', 'Historical', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/29/Arc_Caracalla_Tebessa.jpg/1280px-Arc_Caracalla_Tebessa.jpg', 35.4042, 8.1242),
    (tebessa_id, 'Basilique Saint-Crispine', 'كنيسة القديسة كريسبين', 'Basilique paléochrétienne.', 'Religious', 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Basilique_Tebessa.jpg/1280px-Basilique_Tebessa.jpg', 35.4044, 8.1244);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (tebessa_id, 'Rfiss Tebessi', 'رفيس تبسي', 'Dessert aux dattes et au pain.', 'Dessert', 'https://i0.wp.com/www.dzdonna.com/wp-content/uploads/2023/02/Rfiss-tebessa.jpg', ARRAY['pain sec', 'dattes', 'beurre', 'miel']);

    -- 13 - Tlemcen
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('Tlemcen', 'تلمسان', 'Perle du Maghreb, capitale du Zianides.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/Tlemcen_Mansourah.jpg/1280px-Tlemcen_Mansourah.jpg', 34.8783, -1.3150)
    RETURNING id INTO tlemcen_id;

    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (tlemcen_id, 'Grande Mosquée', 'الجامع الكبير', 'Chef-d''œuvre de l''architecture islamique.', 'Religious', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5d/Great_Mosque_of_Tlemcen.jpg/1280px-Great_Mosque_of_Tlemcen.jpg', 34.8785, -1.3152),
    (tlemcen_id, 'El Mechouar', 'المشور', 'Palais royal des Zianides.', 'Historical', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/El_Mechouar_Palace.jpg/1280px-El_Mechouar_Palace.jpg', 34.8787, -1.3154);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (tlemcen_id, 'Kalbellouz', 'قلب اللوز', 'Pâtisserie traditionnelle aux amandes.', 'Dessert', 'https://i0.wp.com/www.dzdonna.com/wp-content/uploads/2023/03/Kalbellouz-tlemcen.jpg', ARRAY['amandes', 'sucre', 'eau de fleur d''oranger', 'beurre']);

    -- 14 - Tiaret
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('Tiaret', 'تيارت', 'Ville des chevaux et des sites préhistoriques.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/Tiaret_City.jpg/1280px-Tiaret_City.jpg', 35.3667, 1.3167)
    RETURNING id INTO tiaret_id;

    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (tiaret_id, 'Djeddars', 'الجدارات', 'Mausolées berbères monumentaux.', 'Historical', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Djeddars_Frenda.jpg/1280px-Djeddars_Frenda.jpg', 35.3669, 1.3169),
    (tiaret_id, 'Haras National', 'المربع الوطني', 'Centre d''élevage de chevaux barbes.', 'Cultural', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Haras_Tiaret.jpg/1280px-Haras_Tiaret.jpg', 35.3671, 1.3171);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (tiaret_id, 'Doubara', 'دوبارة', 'Soupe traditionnelle aux fèves.', 'Soup', 'https://i0.wp.com/www.dzdonna.com/wp-content/uploads/2023/04/Doubara-tiaret.jpg', ARRAY['fèves', 'pois chiches', 'cumin', 'huile d''olive']);

    -- 15 - Tizi Ouzou
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('Tizi Ouzou', 'تيزي وزو', 'Cœur de la Kabylie, ville d''art et de culture.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Tizi_Ouzou_Panorama.jpg/1280px-Tizi_Ouzou_Panorama.jpg', 36.7169, 4.0474)
    RETURNING id INTO tizi_ouzou_id;

    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (tizi_ouzou_id, 'Village Ath Yenni', 'قرية آث يني', 'Village célèbre pour son artisanat en argent.', 'Cultural', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Ath_Yenni_Village.jpg/1280px-Ath_Yenni_Village.jpg', 36.6333, 4.3333),
    (tizi_ouzou_id, 'Djurdjura', 'جرجرة', 'Chaîne montagneuse majestueuse.', 'Natural', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f5/Djurdjura_Mountains.jpg/1280px-Djurdjura_Mountains.jpg', 36.4667, 4.2333);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (tizi_ouzou_id, 'Aghrum', 'أغروم', 'Pain kabyle traditionnel.', 'Bread', 'https://i0.wp.com/www.dzdonna.com/wp-content/uploads/2023/05/Aghrum-tizi.jpg', ARRAY['semoule', 'farine', 'sel', 'levure']);

    -- 16 - Alger
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('Alger', 'الجزائر', 'La capitale blanche de l''Algérie.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/58/Algiers_Skyline.jpg/1280px-Algiers_Skyline.jpg', 36.7538, 3.0588)
    RETURNING id INTO alger_id;

    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (alger_id, 'Casbah d''Alger', 'قصبة الجزائر', 'Médina historique classée UNESCO.', 'Historical', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/87/Casbah_Algiers.jpg/1280px-Casbah_Algiers.jpg', 36.7857, 3.0542),
    (alger_id, 'Mémorial du Martyr', 'مقام الشهيد', 'Monument emblématique de la ville.', 'Cultural', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9d/Martyrs_Memorial_Algiers.jpg/1280px-Martyrs_Memorial_Algiers.jpg', 36.7475, 3.0619);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (alger_id, 'Rechta', 'رشتة', 'Pâtes traditionnelles à la sauce blanche.', 'Main Dish', 'https://i0.wp.com/www.dzdonna.com/wp-content/uploads/2023/06/Rechta-alger.jpg', ARRAY['pâtes maison', 'poulet', 'pois chiches', 'sauce blanche']);

    -- 17 - Djelfa
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('Djelfa', 'الجلفة', 'Porte des Hauts Plateaux.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4d/Djelfa_City.jpg/1280px-Djelfa_City.jpg', 34.6700, 3.2500)
    RETURNING id INTO djelfa_id;

    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (djelfa_id, 'Rocher du Sel', 'صخرة الملح', 'Formation géologique unique.', 'Natural', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/24/Rocher_de_Sel_Djelfa.jpg/1280px-Rocher_de_Sel_Djelfa.jpg', 34.6703, 3.2503),
    (djelfa_id, 'Gravures rupestres', 'النقوش الصخرية', 'Art préhistorique saharien.', 'Historical', 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a2/Rock_Art_Djelfa.jpg/1280px-Rock_Art_Djelfa.jpg', 34.6705, 3.2505);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (djelfa_id, 'Mechoui', 'مشوي', 'Agneau grillé traditionnel.', 'Main Dish', 'https://i0.wp.com/www.dzdonna.com/wp-content/uploads/2023/07/Mechoui-djelfa.jpg', ARRAY['agneau', 'épices', 'sel']);

    -- 18 - Jijel
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('Jijel', 'جيجل', 'La perle de la Méditerranée.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/67/Jijel_Coast.jpg/1280px-Jijel_Coast.jpg', 36.8000, 5.7667)
    RETURNING id INTO jijel_id;

    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (jijel_id, 'Grottes Merveilleuses', 'المغارات العجيبة', 'Formations karstiques spectaculaires.', 'Natural', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/39/Grottes_Jijel.jpg/1280px-Grottes_Jijel.jpg', 36.8003, 5.7670),
    (jijel_id, 'Parc National de Taza', 'الحظيرة الوطنية تازة', 'Réserve naturelle côtière.', 'Natural', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Taza_National_Park.jpg/1280px-Taza_National_Park.jpg', 36.8005, 5.7672);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (jijel_id, 'Sardines à la Jijelienne', 'سردين جيجل', 'Sardines grillées à la manière locale.', 'Seafood', 'https://i0.wp.com/www.dzdonna.com/wp-content/uploads/2023/08/Sardines-jijel.jpg', ARRAY['sardines', 'citron', 'huile d''olive', 'épices']);

    -- 19 - Sétif
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('Sétif', 'سطيف', 'Ville des Hauts Plateaux.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8a/Setif_Panorama.jpg/1280px-Setif_Panorama.jpg', 36.1900, 5.4100)
    RETURNING id INTO setif_id;

    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (setif_id, 'Parc d''Attractions', 'حديقة التسلية', 'Plus grand parc urbain d''Algérie.', 'Modern', 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/Setif_Park.jpg/1280px-Setif_Park.jpg', 36.1903, 5.4103),
    (setif_id, 'Djemila', 'جميلة', 'Site romain UNESCO.', 'Historical', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f0/Djemila_Roman_Ruins.jpg/1280px-Djemila_Roman_Ruins.jpg', 36.3167, 5.7333);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (setif_id, 'Chekhchoukha Sétifienne', 'شخشوخة سطايفية', 'Version locale du plat traditionnel.', 'Main Dish', 'https://i0.wp.com/www.dzdonna.com/wp-content/uploads/2023/09/Chekhchoukha-setif.jpg', ARRAY['galette', 'sauce rouge', 'viande', 'pois chiches']);

    -- 20 - Saïda
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('Saïda', 'سعيدة', 'Ville des eaux.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/96/Saida_City.jpg/1280px-Saida_City.jpg', 34.8303, 0.1517)
    RETURNING id INTO saida_id;

    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (saida_id, 'Source Ain Skhouna', 'عين السخونة', 'Source thermale naturelle.', 'Natural', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Ain_Skhouna.jpg/1280px-Ain_Skhouna.jpg', 34.8305, 0.1519),
    (saida_id, 'Forêt de Saïda', 'غابة سعيدة', 'Vaste espace forestier.', 'Natural', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Saida_Forest.jpg/1280px-Saida_Forest.jpg', 34.8307, 0.1521);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (saida_id, 'Couscous aux Champignons', 'كسكس بالفطر', 'Couscous aux champignons sauvages.', 'Main Dish', 'https://i0.wp.com/www.dzdonna.com/wp-content/uploads/2023/10/Couscous-saida.jpg', ARRAY['semoule', 'champignons', 'viande', 'légumes']);

    -- 21 - Skikda
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('Skikda', 'سكيكدة', 'Ville côtière aux plages magnifiques.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Skikda_Port.jpg/1280px-Skikda_Port.jpg', 36.8667, 6.9000)
    RETURNING id INTO skikda_id;

    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (skikda_id, 'Théâtre Romain', 'المسرح الروماني', 'Vestige romain remarquable.', 'Historical', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/42/Roman_Theatre_Skikda.jpg/1280px-Roman_Theatre_Skikda.jpg', 36.8670, 6.9003),
    (skikda_id, 'Cap de Fer', 'رأس الحديد', 'Cap rocheux spectaculaire.', 'Natural', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Cap_de_Fer.jpg/1280px-Cap_de_Fer.jpg', 36.8673, 6.9006);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (skikda_id, 'Poisson à la Skikdie', 'سمك على طريقة سكيكدة', 'Poisson frais grillé aux herbes.', 'Seafood', 'https://i0.wp.com/www.dzdonna.com/wp-content/uploads/2023/11/Poisson-skikda.jpg', ARRAY['poisson frais', 'herbes', 'citron', 'huile d''olive']);

    -- 22 - Sidi Bel Abbès
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('Sidi Bel Abbès', 'سيدي بلعباس', 'Ville de la Légion Étrangère.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Sidi_Bel_Abbes.jpg/1280px-Sidi_Bel_Abbes.jpg', 35.1917, -0.6333)
    RETURNING id INTO sidi_bel_abbes_id;

    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (sidi_bel_abbes_id, 'Place 1er Novembre', 'ساحة أول نوفمبر', 'Place historique centrale.', 'Cultural', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/63/Place_SBA.jpg/1280px-Place_SBA.jpg', 35.1920, -0.6336),
    (sidi_bel_abbes_id, 'Forêt de Tenira', 'غابة تنيرة', 'Vaste espace forestier.', 'Natural', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1c/Tenira_Forest.jpg/1280px-Tenira_Forest.jpg', 35.1923, -0.6339);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (sidi_bel_abbes_id, 'Harira Belabbèsienne', 'حريرة بلعباسية', 'Soupe traditionnelle locale.', 'Soup', 'https://i0.wp.com/www.dzdonna.com/wp-content/uploads/2023/12/Harira-sba.jpg', ARRAY['tomates', 'pois chiches', 'lentilles', 'herbes']);

    -- 23 - Annaba
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('Annaba', 'عنابة', 'La Coquette, ville de Saint Augustin.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/39/Annaba_City.jpg/1280px-Annaba_City.jpg', 36.9000, 7.7667)
    RETURNING id INTO annaba_id;

    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (annaba_id, 'Basilique Saint Augustin', 'كنيسة القديس أوغسطين', 'Monument religieux majeur.', 'Religious', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e9/Saint_Augustine_Basilica.jpg/1280px-Saint_Augustine_Basilica.jpg', 36.9003, 7.7670),
    (annaba_id, 'Plage Chapui', 'شاطئ شابوي', 'Plus belle plage de la ville.', 'Natural', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Chapui_Beach.jpg/1280px-Chapui_Beach.jpg', 36.9006, 7.7673);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (annaba_id, 'Bourek Annabi', 'بوراك عنابي', 'Bourek aux fruits de mer.', 'Appetizer', 'https://i0.wp.com/www.dzdonna.com/wp-content/uploads/2024/01/Bourek-annaba.jpg', ARRAY['pâte filo', 'fruits de mer', 'fromage', 'persil']);

    -- 24 - Guelma
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('Guelma', 'قالمة', 'Ville des thermes romains.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Guelma_City.jpg/1280px-Guelma_City.jpg', 36.4667, 7.4333)
    RETURNING id INTO guelma_id;

    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (guelma_id, 'Théâtre Romain', 'المسرح الروماني', 'Théâtre antique bien préservé.', 'Historical', 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/Theatre_Guelma.jpg/1280px-Theatre_Guelma.jpg', 36.4670, 7.4336),
    (guelma_id, 'Hammam Debagh', 'حمام دباغ', 'Sources thermales naturelles.', 'Natural', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/Hammam_Debagh.jpg/1280px-Hammam_Debagh.jpg', 36.4673, 7.4339);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (guelma_id, 'Tadjine Zeitoun', 'طاجين زيتون', 'Tajine aux olives.', 'Main Dish', 'https://i0.wp.com/www.dzdonna.com/wp-content/uploads/2024/02/Tadjine-guelma.jpg', ARRAY['viande', 'olives', 'oignons', 'épices']);

    -- 25 - Constantine
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('Constantine', 'قسنطينة', 'Ville des ponts suspendus.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Constantine_Bridges.jpg/1280px-Constantine_Bridges.jpg', 36.3650, 6.6147)
    RETURNING id INTO constantine_id;

    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (constantine_id, 'Pont Sidi M''Cid', 'جسر سيدي مسيد', 'Pont suspendu emblématique.', 'Modern', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/29/Sidi_MCid_Bridge.jpg/1280px-Sidi_MCid_Bridge.jpg', 36.3653, 6.6150),
    (constantine_id, 'Palais du Bey', 'قصر الباي', 'Palais ottoman historique.', 'Historical', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/Bey_Palace.jpg/1280px-Bey_Palace.jpg', 36.3656, 6.6153);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (constantine_id, 'Hmis', 'حميس', 'Salade de poivrons grillés.', 'Appetizer', 'https://i0.wp.com/www.dzdonna.com/wp-content/uploads/2024/03/Hmis-constantine.jpg', ARRAY['poivrons', 'tomates', 'ail', 'huile d''olive']);

    -- 26 - Médéa
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('Médéa', 'المدية', 'Ville du Titteri aux vignobles renommés.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/84/Medea_City.jpg/1280px-Medea_City.jpg', 36.2675, 2.7500)
    RETURNING id INTO medea_id;

    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (medea_id, 'Ruines Romaines de Lambdia', 'آثار لامبديا الرومانية', 'Site archéologique antique.', 'Historical', 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Lambdia_Ruins.jpg/1280px-Lambdia_Ruins.jpg', 36.2678, 2.7503),
    (medea_id, 'Vignobles de Médéa', 'كروم المدية', 'Célèbres vignobles de la région.', 'Agricultural', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c5/Medea_Vineyards.jpg/1280px-Medea_Vineyards.jpg', 36.2681, 2.7506);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (medea_id, 'Trida', 'تريدة', 'Plat traditionnel aux pâtes.', 'Main Dish', 'https://i0.wp.com/www.dzdonna.com/wp-content/uploads/2024/04/Trida-medea.jpg', ARRAY['pâte maison', 'poulet', 'pois chiches', 'sauce']);

    -- 27 - Mostaganem
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('Mostaganem', 'مستغانم', 'Ville côtière aux belles plages.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Mostaganem_Beach.jpg/1280px-Mostaganem_Beach.jpg', 35.9317, 0.0900)
    RETURNING id INTO mostaganem_id;

    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (mostaganem_id, 'Fort de l''Est', 'برج الشرق', 'Forteresse historique ottomane.', 'Historical', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2b/Fort_Est_Mostaganem.jpg/1280px-Fort_Est_Mostaganem.jpg', 35.9320, 0.0903),
    (mostaganem_id, 'Salamandre', 'سلامندر', 'Plage et station balnéaire.', 'Natural', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/Salamandre_Beach.jpg/1280px-Salamandre_Beach.jpg', 35.9323, 0.0906);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (mostaganem_id, 'Poisson à la Mostaganémoise', 'سمك على طريقة مستغانم', 'Poisson grillé aux herbes locales.', 'Seafood', 'https://i0.wp.com/www.dzdonna.com/wp-content/uploads/2024/05/Poisson-mostaganem.jpg', ARRAY['poisson frais', 'herbes', 'épices', 'citron']);

    -- 28 - M''Sila
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('M''Sila', 'المسيلة', 'La ville aux mille sources.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/Msila_City.jpg/1280px-Msila_City.jpg', 35.7058, 4.5411)
    RETURNING id INTO msila_id;

    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (msila_id, 'Kalâa des Béni Hammad', 'قلعة بني حماد', 'Site UNESCO, ancienne capitale hammadide.', 'Historical', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/35/Kalaa_Beni_Hammad.jpg/1280px-Kalaa_Beni_Hammad.jpg', 35.7061, 4.5414),
    (msila_id, 'Chott El Hodna', 'شط الحضنة', 'Grand lac salé.', 'Natural', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f7/Chott_El_Hodna.jpg/1280px-Chott_El_Hodna.jpg', 35.7064, 4.5417);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (msila_id, 'Zfiti', 'زفيتي', 'Pain traditionnel aux herbes.', 'Bread', 'https://i0.wp.com/www.dzdonna.com/wp-content/uploads/2024/06/Zfiti-msila.jpg', ARRAY['semoule', 'herbes', 'huile d''olive', 'sel']);

    -- 29 - Mascara
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('Mascara', 'معسكر', 'Ville de l''Émir Abdelkader.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/57/Mascara_City.jpg/1280px-Mascara_City.jpg', 35.4000, 0.1333)
    RETURNING id INTO mascara_id;

    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (mascara_id, 'Bordj de l''Émir', 'برج الأمير', 'Forteresse historique.', 'Historical', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/89/Bordj_Emir_Mascara.jpg/1280px-Bordj_Emir_Mascara.jpg', 35.4003, 0.1336),
    (mascara_id, 'Ain Fekan', 'عين فكان', 'Source naturelle et jardins.', 'Natural', 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b3/Ain_Fekan.jpg/1280px-Ain_Fekan.jpg', 35.4006, 0.1339);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (mascara_id, 'Berkoukes Mascari', 'بركوكس معسكري', 'Pâtes traditionnelles aux légumes.', 'Main Dish', 'https://i0.wp.com/www.dzdonna.com/wp-content/uploads/2024/07/Berkoukes-mascara.jpg', ARRAY['pâtes berkoukes', 'légumes', 'viande', 'épices']);

    -- 30 - Ouargla
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('Ouargla', 'ورقلة', 'La ville aux sept ksour.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/63/Ouargla_City.jpg/1280px-Ouargla_City.jpg', 31.9500, 5.3333)
    RETURNING id INTO ouargla_id;

    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (ouargla_id, 'Vieux Ksar', 'القصر القديم', 'Ancien quartier fortifié.', 'Historical', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Ksar_Ouargla.jpg/1280px-Ksar_Ouargla.jpg', 31.9503, 5.3336),
    (ouargla_id, 'Sebkha Safioune', 'سبخة سفيون', 'Lac salé naturel.', 'Natural', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/Sebkha_Safioune.jpg/1280px-Sebkha_Safioune.jpg', 31.9506, 5.3339);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (ouargla_id, 'Chekhchoukha Ouarglie', 'شخشوخة ورقلية', 'Version saharienne de la chekhchoukha.', 'Main Dish', 'https://i0.wp.com/www.dzdonna.com/wp-content/uploads/2024/08/Chekhchoukha-ouargla.jpg', ARRAY['galette', 'sauce rouge', 'viande de chameau', 'pois chiches']);

    -- 31 - Oran
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('Oran', 'وهران', 'El Bahia, seconde ville d''Algérie.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Oran_City_View.jpg/1280px-Oran_City_View.jpg', 35.6969, -0.6331)
    RETURNING id INTO oran_id;

    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (oran_id, 'Fort Santa Cruz', 'قلعة سانتا كروز', 'Forteresse espagnole du 16ème siècle.', 'Historical', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c0/Santa_Cruz_Fort.jpg/1280px-Santa_Cruz_Fort.jpg', 35.7089, -0.6542),
    (oran_id, 'Place du 1er Novembre', 'ساحة أول نوفمبر', 'Centre historique de la ville.', 'Cultural', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Place_1er_Novembre_Oran.jpg/1280px-Place_1er_Novembre_Oran.jpg', 35.6971, -0.6333);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (oran_id, 'Karantika', 'كرنتيكة', 'Spécialité à base de pois chiches.', 'Street Food', 'https://i0.wp.com/www.dzdonna.com/wp-content/uploads/2024/09/Karantika-oran.jpg', ARRAY['farine de pois chiches', 'œufs', 'cumin', 'harissa']);

    -- 32 - El Bayadh
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('El Bayadh', 'البيض', 'Ville des steppes aux tapis traditionnels.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3b/El_Bayadh_City.jpg/1280px-El_Bayadh_City.jpg', 33.6833, 1.0167)
    RETURNING id INTO el_bayadh_id;

    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (el_bayadh_id, 'Rocher de Sel', 'الصخرة الملحية', 'Formation géologique unique.', 'Natural', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/Salt_Rock_El_Bayadh.jpg/1280px-Salt_Rock_El_Bayadh.jpg', 33.6836, 1.0170),
    (el_bayadh_id, 'Ksar Boussemghoun', 'قصر بوسمغون', 'Village traditionnel fortifié.', 'Historical', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/24/Ksar_Boussemghoun.jpg/1280px-Ksar_Boussemghoun.jpg', 33.6839, 1.0173);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (el_bayadh_id, 'Méchoui El Bayadh', 'مشوي البيض', 'Agneau grillé traditionnel.', 'Main Dish', 'https://i0.wp.com/www.dzdonna.com/wp-content/uploads/2024/10/Mechoui-bayadh.jpg', ARRAY['agneau', 'épices', 'sel']);

    -- 33 - Illizi
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('Illizi', 'إليزي', 'Porte du Tassili n''Ajjer.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/42/Illizi_View.jpg/1280px-Illizi_View.jpg', 26.5000, 8.4833)
    RETURNING id INTO illizi_id;

    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (illizi_id, 'Tassili n''Ajjer', 'طاسيلي ناجر', 'Site UNESCO aux gravures rupestres.', 'Historical', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Tassili_Rock_Art.jpg/1280px-Tassili_Rock_Art.jpg', 25.5000, 8.0000),
    (illizi_id, 'Djanet', 'جانت', 'Oasis saharienne.', 'Natural', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7f/Djanet_Oasis.jpg/1280px-Djanet_Oasis.jpg', 24.5500, 9.4833);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (illizi_id, 'Pain du Désert', 'خبز الصحراء', 'Pain traditionnel touareg.', 'Bread', 'https://i0.wp.com/www.dzdonna.com/wp-content/uploads/2024/11/Pain-illizi.jpg', ARRAY['farine', 'eau', 'sel']);

    -- 34 - Bordj Bou Arreridj
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('Bordj Bou Arreridj', 'برج بوعريريج', 'Capitale de la Petite Kabylie.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/BBA_City.jpg/1280px-BBA_City.jpg', 36.0667, 4.7667)
    RETURNING id INTO bordj_bou_arreridj_id;

    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (bordj_bou_arreridj_id, 'Fort Turc', 'القلعة التركية', 'Forteresse ottomane.', 'Historical', 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Turkish_Fort_BBA.jpg/1280px-Turkish_Fort_BBA.jpg', 36.0670, 4.7670),
    (bordj_bou_arreridj_id, 'Monts des Bibans', 'جبال البيبان', 'Chaîne montagneuse spectaculaire.', 'Natural', 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Bibans_Mountains.jpg/1280px-Bibans_Mountains.jpg', 36.1000, 4.8000);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (bordj_bou_arreridj_id, 'Couscous Bordji', 'كسكس برايجي', 'Couscous aux légumes locaux.', 'Main Dish', 'https://i0.wp.com/www.dzdonna.com/wp-content/uploads/2024/12/Couscous-bba.jpg', ARRAY['semoule', 'légumes', 'viande', 'pois chiches']);

    -- 35 - Boumerdès
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('Boumerdès', 'بومرداس', 'Ville côtière universitaire.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Boumerdes_Coast.jpg/1280px-Boumerdes_Coast.jpg', 36.7667, 3.4833)
    RETURNING id INTO boumerdes_id;

    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (boumerdes_id, 'Cap Djinet', 'رأس جنات', 'Cap pittoresque.', 'Natural', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/Cap_Djinet.jpg/1280px-Cap_Djinet.jpg', 36.8833, 3.7333),
    (boumerdes_id, 'Thenia', 'الثنية', 'Gorges historiques.', 'Natural', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Thenia_Gorges.jpg/1280px-Thenia_Gorges.jpg', 36.7167, 3.5500);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (boumerdes_id, 'Poisson à la Boumérdésienne', 'سمك على طريقة بومرداس', 'Poisson frais grillé.', 'Seafood', 'https://i0.wp.com/www.dzdonna.com/wp-content/uploads/2025/01/Poisson-boumerdes.jpg', ARRAY['poisson frais', 'citron', 'huile d''olive', 'herbes']);

    -- 36 - El Tarf
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('El Tarf', 'الطارف', 'Joyau naturel aux lacs et forêts.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d2/El_Tarf_Lake.jpg/1280px-El_Tarf_Lake.jpg', 36.7667, 8.3167)
    RETURNING id INTO el_tarf_id;

    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (el_tarf_id, 'Parc El Kala', 'حظيرة القالة', 'Parc national UNESCO.', 'Natural', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/El_Kala_National_Park.jpg/1280px-El_Kala_National_Park.jpg', 36.9000, 8.4500),
    (el_tarf_id, 'Lac Oubeira', 'بحيرة أوبيرة', 'Plus grand lac naturel d''Algérie.', 'Natural', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/Lake_Oubeira.jpg/1280px-Lake_Oubeira.jpg', 36.8500, 8.3833);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (el_tarf_id, 'Poisson El Kala', 'سمك القالة', 'Poissons d''eau douce grillés.', 'Seafood', 'https://i0.wp.com/www.dzdonna.com/wp-content/uploads/2025/02/Poisson-tarf.jpg', ARRAY['poisson d''eau douce', 'citron', 'herbes', 'épices']);

    -- 37 - Tindouf
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('Tindouf', 'تندوف', 'Porte du Grand Sud.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/Tindouf_City.jpg/1280px-Tindouf_City.jpg', 27.6711, -8.1283)
    RETURNING id INTO tindouf_id;

    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (tindouf_id, 'Fort Lotfi', 'حصن لطفي', 'Ancien fort militaire.', 'Historical', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/25/Fort_Lotfi.jpg/1280px-Fort_Lotfi.jpg', 27.6714, -8.1286),
    (tindouf_id, 'Oasis de Tindouf', 'واحة تندوف', 'Oasis saharienne traditionnelle.', 'Natural', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/16/Tindouf_Oasis.jpg/1280px-Tindouf_Oasis.jpg', 27.6717, -8.1289);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (tindouf_id, 'Méchoui Sahraoui', 'مشوي صحراوي', 'Méchoui préparé à la façon saharienne.', 'Main Dish', 'https://i0.wp.com/www.dzdonna.com/wp-content/uploads/2025/03/Mechoui-tindouf.jpg', ARRAY['viande de chameau', 'épices sahariennes', 'sel']);

    -- 38 - Tissemsilt
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('Tissemsilt', 'تيسمسيلت', 'Région montagneuse de l''Ouarsenis.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/70/Tissemsilt_Mountains.jpg/1280px-Tissemsilt_Mountains.jpg', 35.6072, 1.8106)
    RETURNING id INTO tissemsilt_id;

    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (tissemsilt_id, 'Mont Ouarsenis', 'جبل ورسنيس', 'Plus haut sommet de la région.', 'Natural', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/45/Mount_Ouarsenis.jpg/1280px-Mount_Ouarsenis.jpg', 35.9167, 1.9333),
    (tissemsilt_id, 'Theniet El Had', 'ثنية الحد', 'Parc national aux cèdres centenaires.', 'Natural', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Theniet_El_Had.jpg/1280px-Theniet_El_Had.jpg', 35.8667, 2.0167);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (tissemsilt_id, 'Couscous Montagnard', 'كسكس جبلي', 'Couscous aux herbes de montagne.', 'Main Dish', 'https://i0.wp.com/www.dzdonna.com/wp-content/uploads/2025/04/Couscous-tissemsilt.jpg', ARRAY['semoule', 'viande', 'légumes', 'herbes de montagne']);

    -- 39 - El Oued
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('El Oued', 'الوادي', 'La ville aux mille coupoles.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e3/El_Oued_Domes.jpg/1280px-El_Oued_Domes.jpg', 33.3680, 6.8516)
    RETURNING id INTO el_oued_id;

    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (el_oued_id, 'Ghouts', 'الغوط', 'Palmeraies traditionnelles.', 'Agricultural', 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Ghouts_El_Oued.jpg/1280px-Ghouts_El_Oued.jpg', 33.3683, 6.8519),
    (el_oued_id, 'Grand Marché', 'السوق الكبير', 'Souk traditionnel animé.', 'Cultural', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/El_Oued_Market.jpg/1280px-El_Oued_Market.jpg', 33.3686, 6.8522);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (el_oued_id, 'Malfouf', 'ملفوف', 'Pâtisserie aux dattes.', 'Dessert', 'https://i0.wp.com/www.dzdonna.com/wp-content/uploads/2025/05/Malfouf-eloued.jpg', ARRAY['dattes', 'pâte fine', 'huile', 'sucre']);

    -- 40 - Khenchela
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('Khenchela', 'خنشلة', 'Ville des Aurès aux sources thermales.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/Khenchela_View.jpg/1280px-Khenchela_View.jpg', 35.4333, 7.1333)
    RETURNING id INTO khenchela_id;

    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (khenchela_id, 'Hammam Essalihine', 'حمام الصالحين', 'Thermes romains millénaires.', 'Historical', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c8/Hammam_Essalihine.jpg/1280px-Hammam_Essalihine.jpg', 35.4336, 7.1336),
    (khenchela_id, 'Mont Chélia', 'جبل شيليا', 'Plus haut sommet des Aurès.', 'Natural', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d7/Mount_Chelia.jpg/1280px-Mount_Chelia.jpg', 35.3200, 6.9000);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (khenchela_id, 'Cherchem', 'شرشم', 'Soupe traditionnelle des Aurès.', 'Soup', 'https://i0.wp.com/www.dzdonna.com/wp-content/uploads/2025/06/Cherchem-khenchela.jpg', ARRAY['blé concassé', 'pois chiches', 'herbes', 'épices']);

    -- 41 - Souk Ahras
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('Souk Ahras', 'سوق أهراس', 'Ville natale de Saint Augustin.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Souk_Ahras_City.jpg/1280px-Souk_Ahras_City.jpg', 36.2864, 7.9511)
    RETURNING id INTO souk_ahras_id;

    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (souk_ahras_id, 'Thagaste', 'ثاقاست', 'Site archéologique romain.', 'Historical', 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Thagaste_Ruins.jpg/1280px-Thagaste_Ruins.jpg', 36.2867, 7.9514),
    (souk_ahras_id, 'Khemissa', 'خميسة', 'Vestiges romains.', 'Historical', 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Khemissa_Site.jpg/1280px-Khemissa_Site.jpg', 36.2000, 7.6500);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (souk_ahras_id, 'Chakhchoukha', 'شخشوخة', 'Version locale du plat traditionnel.', 'Main Dish', 'https://i0.wp.com/www.dzdonna.com/wp-content/uploads/2025/07/Chakhchoukha-soukahras.jpg', ARRAY['galette', 'sauce rouge', 'viande', 'pois chiches']);

    -- 42 - Tipaza
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('Tipaza', 'تيبازة', 'Joyau archéologique méditerranéen.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/42/Tipaza_Roman_Ruins.jpg/1280px-Tipaza_Roman_Ruins.jpg', 36.6178, 2.3917)
    RETURNING id INTO tipaza_id;

    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (tipaza_id, 'Site Romain', 'الموقع الروماني', 'Site UNESCO avec théâtre et temples.', 'Historical', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Tipaza_Theatre.jpg/1280px-Tipaza_Theatre.jpg', 36.6181, 2.3920),
    (tipaza_id, 'Tombeau Royal Maurétanien', 'الضريح الملكي الموريتاني', 'Tombeau de la Chrétienne.', 'Historical', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/Royal_Mausoleum_Tipaza.jpg/1280px-Royal_Mausoleum_Tipaza.jpg', 36.5833, 2.6500);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (tipaza_id, 'Poisson à la Tipazienne', 'سمك على طريقة تيبازة', 'Poisson grillé aux herbes méditerranéennes.', 'Seafood', 'https://i0.wp.com/www.dzdonna.com/wp-content/uploads/2025/08/Poisson-tipaza.jpg', ARRAY['poisson frais', 'herbes méditerranéennes', 'citron', 'huile d''olive']);

    -- 43 - Mila
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('Mila', 'ميلة', 'Ville millénaire aux oliveraies.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/52/Mila_City.jpg/1280px-Mila_City.jpg', 36.4500, 6.2667)
    RETURNING id INTO mila_id;

    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (mila_id, 'Vieille Ville', 'المدينة القديمة', 'Médina historique.', 'Historical', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Mila_Old_City.jpg/1280px-Mila_Old_City.jpg', 36.4503, 6.2670),
    (mila_id, 'Barrage de Beni Haroun', 'سد بني هارون', 'Plus grand barrage d''Algérie.', 'Modern', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Beni_Haroun_Dam.jpg/1280px-Beni_Haroun_Dam.jpg', 36.5500, 6.2667);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (mila_id, 'Zitoune M''raqed', 'زيتون مرقد', 'Olives préparées traditionnellement.', 'Appetizer', 'https://i0.wp.com/www.dzdonna.com/wp-content/uploads/2025/09/Olives-mila.jpg', ARRAY['olives', 'huile d''olive', 'thym', 'ail']);

    -- 44 - Aïn Defla
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('Aïn Defla', 'عين الدفلى', 'Région du Mont Zaccar.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/64/Ain_Defla_City.jpg/1280px-Ain_Defla_City.jpg', 36.2664, 1.9679)
    RETURNING id INTO ain_defla_id;

    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (ain_defla_id, 'Mont Zaccar', 'جبل زكار', 'Massif montagneux historique.', 'Natural', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d8/Mount_Zaccar.jpg/1280px-Mount_Zaccar.jpg', 36.3333, 2.0000),
    (ain_defla_id, 'Ruines de Khemis Miliana', 'آثار خميس مليانة', 'Site archéologique romain.', 'Historical', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Khemis_Miliana_Ruins.jpg/1280px-Khemis_Miliana_Ruins.jpg', 36.2667, 2.2167);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (ain_defla_id, 'Doubara Milianaise', 'دوبارة مليانية', 'Soupe traditionnelle aux fèves.', 'Soup', 'https://i0.wp.com/www.dzdonna.com/wp-content/uploads/2025/10/Doubara-aindefla.jpg', ARRAY['fèves', 'pois chiches', 'cumin', 'huile d''olive']);

    -- 45 - Naâma
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('Naâma', 'النعامة', 'Porte du Sahara occidental.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/Naama_City.jpg/1280px-Naama_City.jpg', 33.2667, -0.3167)
    RETURNING id INTO naama_id;

    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (naama_id, 'Ksour de Sfissifa', 'قصور سفيسيفة', 'Villages fortifiés traditionnels.', 'Historical', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/Sfissifa_Ksour.jpg/1280px-Sfissifa_Ksour.jpg', 32.7500, -0.8333),
    (naama_id, 'Djebel Aïssa', 'جبل عيسى', 'Montagne et réserve naturelle.', 'Natural', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/Djebel_Aissa.jpg/1280px-Djebel_Aissa.jpg', 33.0000, -0.5000);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (naama_id, 'Rfiss', 'رفيس', 'Dessert traditionnel aux dattes.', 'Dessert', 'https://i0.wp.com/www.dzdonna.com/wp-content/uploads/2025/11/Rfiss-naama.jpg', ARRAY['pain sec', 'dattes', 'beurre', 'miel']);

    -- 46 - Aïn Témouchent
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('Aïn Témouchent', 'عين تموشنت', 'Perle de la Méditerranée occidentale.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/89/Ain_Temouchent_Coast.jpg/1280px-Ain_Temouchent_Coast.jpg', 35.3000, -1.1400)
    RETURNING id INTO ain_temouchent_id;

    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (ain_temouchent_id, 'Plage de Bouzedjar', 'شاطئ بوزجار', 'Plus belle plage de la région.', 'Natural', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Bouzedjar_Beach.jpg/1280px-Bouzedjar_Beach.jpg', 35.5833, -1.2000),
    (ain_temouchent_id, 'Site de Siga', 'موقع سيقا', 'Ruines de l''ancienne capitale.', 'Historical', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/75/Siga_Ruins.jpg/1280px-Siga_Ruins.jpg', 35.4333, -1.2000);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (ain_temouchent_id, 'Sardines à la Témouchentoise', 'سردين تموشنتي', 'Sardines grillées à la façon locale.', 'Seafood', 'https://i0.wp.com/www.dzdonna.com/wp-content/uploads/2025/12/Sardines-aintemouchent.jpg', ARRAY['sardines fraîches', 'citron', 'huile d''olive', 'épices']);

    -- 47 - Ghardaïa
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('Ghardaïa', 'غرداية', 'Pentapole du M''Zab, site UNESCO.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/60/Ghardaia_Valley.jpg/1280px-Ghardaia_Valley.jpg', 32.4833, 3.6667)
    RETURNING id INTO ghardaia_id;

    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (ghardaia_id, 'Vallée du M''Zab', 'وادي مزاب', 'Ensemble architectural unique.', 'Historical', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/Mzab_Valley.jpg/1280px-Mzab_Valley.jpg', 32.4836, 3.6670),
    (ghardaia_id, 'Marché de Ghardaïa', 'سوق غرداية', 'Marché traditionnel animé.', 'Cultural', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/42/Ghardaia_Market.jpg/1280px-Ghardaia_Market.jpg', 32.4839, 3.6673);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (ghardaia_id, 'Tharid', 'ثريد', 'Pain émietté à la sauce.', 'Main Dish', 'https://i0.wp.com/www.dzdonna.com/wp-content/uploads/2026/01/Tharid-ghardaia.jpg', ARRAY['pain', 'viande', 'sauce', 'légumes']);

    -- 48 - Relizane
    INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
    ('Relizane', 'غليزان', 'Ville agricole aux terres fertiles.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/56/Relizane_Fields.jpg/1280px-Relizane_Fields.jpg', 35.7397, 0.5556)
    RETURNING id INTO relizane_id;

    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (relizane_id, 'Kalâa de Beni Rached', 'قلعة بني راشد', 'Forteresse médiévale.', 'Historical', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Kalaa_Beni_Rached.jpg/1280px-Kalaa_Beni_Rached.jpg', 35.7400, 0.5559),
    (relizane_id, 'Barrage de Gargar', 'سد قرقار', 'Important barrage hydraulique.', 'Modern', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Gargar_Dam.jpg/1280px-Gargar_Dam.jpg', 35.9000, 0.9000);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (relizane_id, 'Ziraoui', 'زيراوي', 'Couscous aux légumes locaux.', 'Main Dish', 'https://i0.wp.com/www.dzdonna.com/wp-content/uploads/2026/02/Ziraoui-relizane.jpg', ARRAY['semoule', 'légumes', 'viande', 'épices']);

END $$;