-- Insert data for regions, heritage sites, and gastronomy

-- Alger (Algiers)
INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
('Alger', 'الجزائر', 'Capitale de l''Algérie, Alger est une ville côtière historique avec une riche architecture coloniale et islamique.', 'https://example.com/alger.jpg', 36.7538, 3.0588);

DO $$
DECLARE
    alger_id uuid;
BEGIN
    SELECT id INTO alger_id FROM regions WHERE name = 'Alger' LIMIT 1;
    
    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (alger_id, 'Casbah d''Alger', 'قصبة الجزائر', 'Site du patrimoine mondial de l''UNESCO, la Casbah est une citadelle historique datant de l''époque ottomane.', 'Historical', 'https://example.com/casbah.jpg', 36.7857, 3.0542),
    (alger_id, 'Basilique Notre-Dame d''Afrique', 'كنيسة سيدة إفريقيا', 'Une basilique néo-byzantine construite au 19ème siècle surplombant la baie d''Alger.', 'Religious', 'https://example.com/basilique.jpg', 36.7989, 3.0422);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (alger_id, 'Rechta', 'رشتة', 'Plat traditionnel algérois composé de pâtes faites maison servies avec une sauce blanche.', 'Main Dish', 'https://example.com/rechta.jpg', ARRAY['pâtes maison', 'poulet', 'pois chiches', 'oignons', 'cannelle']);
END $$;

-- Constantine
INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
('Constantine', 'قسنطينة', 'Ville des ponts suspendus, Constantine est connue pour son architecture spectaculaire et son riche patrimoine culturel.', 'https://example.com/constantine.jpg', 36.3650, 6.6147);

DO $$
DECLARE
    constantine_id uuid;
BEGIN
    SELECT id INTO constantine_id FROM regions WHERE name = 'Constantine' LIMIT 1;
    
    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (constantine_id, 'Pont Sidi M''Cid', 'جسر سيدي مسيد', 'Un pont suspendu spectaculaire surplombant les gorges du Rhumel.', 'Architectural', 'https://example.com/sidi-mcid.jpg', 36.3673, 6.6114),
    (constantine_id, 'Palais du Bey', 'قصر الباي', 'Palais ottoman du 18ème siècle avec une architecture mauresque sophistiquée.', 'Historical', 'https://example.com/palais-bey.jpg', 36.3644, 6.6086);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (constantine_id, 'Chakhchoukha', 'شخشوخة', 'Plat traditionnel constantinois à base de pain déchiré et de sauce à la viande.', 'Main Dish', 'https://example.com/chakhchoukha.jpg', ARRAY['pain traditionnel', 'viande d''agneau', 'tomates', 'piments', 'pois chiches']);
END $$;

-- Oran
INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
('Oran', 'وهران', 'Deuxième plus grande ville d''Algérie, Oran est un centre culturel important connu pour sa musique Raï.', 'https://example.com/oran.jpg', 35.6969, -0.6331);

DO $$
DECLARE
    oran_id uuid;
BEGIN
    SELECT id INTO oran_id FROM regions WHERE name = 'Oran' LIMIT 1;
    
    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (oran_id, 'Fort Santa Cruz', 'قلعة سانتا كروز', 'Forteresse espagnole du 16ème siècle surplombant la baie d''Oran.', 'Historical', 'https://example.com/santa-cruz.jpg', 35.7089, -0.6542),
    (oran_id, 'La Cathédrale du Sacré Cœur', 'كاتدرائية القلب المقدس', 'Église convertie en bibliothèque publique, exemple remarquable d''architecture néo-byzantine.', 'Cultural', 'https://example.com/cathedrale.jpg', 35.6997, -0.6419);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (oran_id, 'Karantika', 'كرنتيكة', 'Spécialité oranaise à base de farine de pois chiches.', 'Street Food', 'https://example.com/karantika.jpg', ARRAY['farine de pois chiches', 'œufs', 'huile d''olive', 'cumin', 'paprika']);
END $$;

-- Tlemcen
INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
('Tlemcen', 'تلمسان', 'Ancienne capitale du Maghreb central, Tlemcen est réputée pour son patrimoine islamique et ses monuments historiques.', 'https://example.com/tlemcen.jpg', 34.8789, -1.3150);

DO $$
DECLARE
    tlemcen_id uuid;
BEGIN
    SELECT id INTO tlemcen_id FROM regions WHERE name = 'Tlemcen' LIMIT 1;
    
    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (tlemcen_id, 'Grande Mosquée de Tlemcen', 'الجامع الكبير', 'Chef-d''œuvre de l''architecture almoravide datant du 11ème siècle.', 'Religious', 'https://example.com/mosque-tlemcen.jpg', 34.8833, -1.3167),
    (tlemcen_id, 'Mansourah', 'المنصورة', 'Ruines d''une cité médiévale avec son imposant minaret.', 'Historical', 'https://example.com/mansourah.jpg', 34.8789, -1.3211);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (tlemcen_id, 'Zlabia', 'زلابية', 'Pâtisserie traditionnelle en spirale, frite et trempée dans du miel.', 'Dessert', 'https://example.com/zlabia.jpg', ARRAY['farine', 'levure', 'eau de fleur d''oranger', 'miel', 'huile']);
END $$;

-- Annaba
INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
('Annaba', 'عنابة', 'Ville côtière historique, anciennement connue sous le nom de Bône, célèbre pour ses plages et son patrimoine romain.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Annaba_Ville.jpg/1280px-Annaba_Ville.jpg', 36.9000, 7.7667);

DO $$
DECLARE
    annaba_id uuid;
BEGIN
    SELECT id INTO annaba_id FROM regions WHERE name = 'Annaba' LIMIT 1;
    
    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (annaba_id, 'Basilique Saint Augustin', 'كنيسة القديس أوغسطين', 'Imposante basilique dédiée à Saint Augustin d''Hippone.', 'Religious', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Basilique_Saint_Augustin_d%27Hippone.jpg/1280px-Basilique_Saint_Augustin_d%27Hippone.jpg', 36.9033, 7.7489),
    (annaba_id, 'Ruines d''Hippone', 'آثار هيبون', 'Site archéologique de l''ancienne ville romaine d''Hippone.', 'Archaeological', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Hippo_Regius_Ruins.jpg/1280px-Hippo_Regius_Ruins.jpg', 36.8853, 7.7517);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (annaba_id, 'Chakhchoukha au Poisson', 'شخشوخة بالسمك', 'Version côtière de la chakhchoukha, préparée avec du poisson frais.', 'Main Dish', 'https://i.pinimg.com/originals/45/67/89/chakhchoukha_poisson.jpg', ARRAY['pain traditionnel', 'poisson', 'tomates', 'piments', 'ail']);
END $$;

-- Béjaïa
INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
('Béjaïa', 'بجاية', 'Ville côtière kabyle, ancien royaume hammadide, connue pour ses montagnes, ses plages et son patrimoine historique.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Bejaia_panorama.jpg/1280px-Bejaia_panorama.jpg', 36.7500, 5.0833);

DO $$
DECLARE
    bejaia_id uuid;
BEGIN
    SELECT id INTO bejaia_id FROM regions WHERE name = 'Béjaïa' LIMIT 1;
    
    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (bejaia_id, 'Cap Carbon', 'رأس الكربون', 'Plus haut phare naturel de la Méditerranée avec une vue panoramique.', 'Natural', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Cap_Carbon_Bejaia.jpg/1280px-Cap_Carbon_Bejaia.jpg', 36.7767, 5.1064),
    (bejaia_id, 'Fort Gouraya', 'قلعة قورايا', 'Forteresse historique surplombant la ville et la mer.', 'Historical', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e9/Fort_Gouraya.jpg/1280px-Fort_Gouraya.jpg', 36.7697, 5.0672);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (bejaia_id, 'Aghrum n''tazart', 'خبز التين', 'Pain traditionnel aux figues de Kabylie.', 'Traditional', 'https://www.algerie360.com/wp-content/uploads/2022/01/pain-figues-kabylie.jpg', ARRAY['semoule', 'figues séchées', 'huile d''olive', 'eau', 'sel']),
    (bejaia_id, 'Seksu', 'سكسو', 'Couscous kabyle aux légumes de saison et viande.', 'Main Dish', 'https://www.196flavors.com/wp-content/uploads/2018/03/couscous-kabyle-3.jpg', ARRAY['semoule', 'légumes', 'viande d''agneau', 'fèves', 'huile d''olive']);
END $$;

-- Biskra
INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
('Biskra', 'بسكرة', 'Porte du Sahara, connue pour ses oasis luxuriantes et ses dattes de qualité exceptionnelle.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2d/Biskra_panorama.jpg/1280px-Biskra_panorama.jpg', 34.8500, 5.7333);

DO $$
DECLARE
    biskra_id uuid;
BEGIN
    SELECT id INTO biskra_id FROM regions WHERE name = 'Biskra' LIMIT 1;
    
    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (biskra_id, 'Balcon de Ghoufi', 'شرفات غوفي', 'Canyon spectaculaire avec des habitations troglodytes.', 'Natural', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f5/Ghoufi_Balconies.jpg/1280px-Ghoufi_Balconies.jpg', 35.0667, 5.9167),
    (biskra_id, 'Hammam Salihine', 'حمام الصالحين', 'Sources thermales naturelles aux propriétés thérapeutiques.', 'Natural', 'https://www.algerie-eco.com/wp-content/uploads/2019/12/hammam-salihine-biskra.jpg', 34.8606, 5.7508);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (biskra_id, 'Rfiss aux Dattes', 'الرفيس بالتمر', 'Dessert traditionnel à base de pain écrasé et de dattes.', 'Dessert', 'https://www.dzairdaily.com/wp-content/uploads/2022/04/rfiss-algerien.jpg', ARRAY['pain sec', 'dattes', 'beurre', 'eau de fleur d''oranger', 'sésame']);
END $$;

-- Ghardaïa
INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
('Ghardaïa', 'غرداية', 'Perle du M''zab, classée au patrimoine mondial de l''UNESCO pour son architecture unique.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Ghardaia_Overview.jpg/1280px-Ghardaia_Overview.jpg', 32.4833, 3.6667);

DO $$
DECLARE
    ghardaia_id uuid;
BEGIN
    SELECT id INTO ghardaia_id FROM regions WHERE name = 'Ghardaïa' LIMIT 1;
    
    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (ghardaia_id, 'Vallée du M''zab', 'وادي مزاب', 'Ensemble architectural unique de cinq ksour fortifiés.', 'UNESCO World Heritage', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/Valley_of_Mzab.jpg/1280px-Valley_of_Mzab.jpg', 32.4833, 3.6833),
    (ghardaia_id, 'Marché de Ghardaïa', 'سوق غرداية', 'Marché traditionnel au cœur de la médina.', 'Cultural', 'https://www.vitaminedz.com/photos/60/60377-marche-ghardaia.jpg', 32.4869, 3.6744);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (ghardaia_id, 'Tghardaït', 'تغردايت', 'Pain traditionnel mozabite cuit dans le sable.', 'Traditional', 'https://www.algerie360.com/wp-content/uploads/2020/07/pain-traditionnel-ghardaia.jpg', ARRAY['semoule', 'eau', 'sel', 'levure']);
END $$;

-- Tamanrasset
INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
('Tamanrasset', 'تمنراست', 'Porte du Sahara profond, terre des Touaregs et du massif du Hoggar.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/Tamanrasset_City.jpg/1280px-Tamanrasset_City.jpg', 22.7850, 5.5228);

DO $$
DECLARE
    tamanrasset_id uuid;
BEGIN
    SELECT id INTO tamanrasset_id FROM regions WHERE name = 'Tamanrasset' LIMIT 1;
    
    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (tamanrasset_id, 'Hoggar', 'الهقار', 'Massif montagneux volcanique avec des paysages lunaires.', 'Natural', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Hoggar_Mountains.jpg/1280px-Hoggar_Mountains.jpg', 23.2833, 5.5333),
    (tamanrasset_id, 'Assekrem', 'الأسكرم', 'Point culminant offrant des couchers de soleil spectaculaires.', 'Natural', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3d/Assekrem_Sunset.jpg/1280px-Assekrem_Sunset.jpg', 23.2667, 5.6333);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (tamanrasset_id, 'Taguella', 'تاقلا', 'Pain traditionnel touareg cuit dans le sable.', 'Traditional', 'https://www.dzairdaily.com/wp-content/uploads/2021/08/taguella-pain-touareg.jpg', ARRAY['farine', 'eau', 'sel']);
END $$;

-- Sétif
INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
('Sétif', 'سطيف', 'Ville des Hauts-Plateaux connue pour son histoire antique et sa modernité.', 'https://example.com/setif.jpg', 36.1900, 5.4100);

WITH setif_id AS (SELECT id FROM regions WHERE name = 'Sétif' LIMIT 1)
INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
((SELECT id FROM setif_id), 'Parc d''Attractions', 'حديقة التسلية', 'Plus grand parc urbain d''Algérie avec la fontaine Ain El Fouara.', 'Cultural', 'https://example.com/parc-setif.jpg', 36.1897, 5.4078),
((SELECT id FROM setif_id), 'Site archéologique de Djemila', 'جميلة', 'Ancienne ville romaine classée au patrimoine mondial de l''UNESCO.', 'Archaeological', 'https://example.com/djemila.jpg', 36.3167, 5.7333);

INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
((SELECT id FROM setif_id), 'Chakhchoukha Sétifienne', 'شخشوخة سطايفية', 'Version locale de la chakhchoukha avec une sauce rouge.', 'Main Dish', 'https://example.com/chakhchoukha-setif.jpg', ARRAY['pain traditionnel', 'viande', 'tomates', 'piments', 'ail']);

-- Tizi Ouzou
INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
('Tizi Ouzou', 'تيزي وزو', 'Cœur de la Kabylie, région montagneuse connue pour son artisanat et ses traditions.', 'https://example.com/tizi-ouzou.jpg', 36.7169, 4.0474);

WITH tiziouzou_id AS (SELECT id FROM regions WHERE name = 'Tizi Ouzou' LIMIT 1)
INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
((SELECT id FROM tiziouzou_id), 'Village Ath Yenni', 'آث يني', 'Village traditionnel célèbre pour ses bijoux en argent.', 'Cultural', 'https://example.com/ath-yenni.jpg', 36.6333, 4.2333),
((SELECT id FROM tiziouzou_id), 'Djurdjura', 'جرجرة', 'Chaîne montagneuse majestueuse avec le parc national.', 'Natural', 'https://example.com/djurdjura.jpg', 36.4667, 4.2333);

INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
((SELECT id FROM tiziouzou_id), 'Couscous aux fèves', 'الكسكس بالفول', 'Couscous traditionnel kabyle aux fèves fraîches.', 'Main Dish', 'https://example.com/couscous-feves.jpg', ARRAY['semoule', 'fèves', 'huile d''olive', 'oignons', 'viande']);

-- Médéa
INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
('Médéa', 'المدية', 'Région viticole réputée, nichée dans l''Atlas tellien.', 'https://example.com/medea.jpg', 36.2675, 2.7500);

WITH medea_id AS (SELECT id FROM regions WHERE name = 'Médéa' LIMIT 1)
INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
((SELECT id FROM medea_id), 'Ruines de Lambdia', 'آثار لامبديا', 'Site archéologique romain avec thermes antiques.', 'Archaeological', 'https://example.com/lambdia.jpg', 36.2700, 2.7600),
((SELECT id FROM medea_id), 'Vignobles de Médéa', 'كروم المدية', 'Domaines viticoles historiques en altitude.', 'Agricultural', 'https://example.com/vignobles.jpg', 36.2800, 2.7400);

INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
((SELECT id FROM medea_id), 'Tajine Zitoune', 'طاجين زيتون', 'Tajine aux olives et au poulet.', 'Main Dish', 'https://example.com/tajine-zitoune.jpg', ARRAY['poulet', 'olives', 'oignons', 'citron confit', 'épices']);

-- Jijel
INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
('Jijel', 'جيجل', 'Perle de l''est algérien, connue pour ses plages et ses grottes miraculeuses.', 'https://example.com/jijel.jpg', 36.8167, 5.7667);

WITH jijel_id AS (SELECT id FROM regions WHERE name = 'Jijel' LIMIT 1)
INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
((SELECT id FROM jijel_id), 'Grottes Merveilleuses', 'المغارات العجيبة', 'Formations karstiques spectaculaires.', 'Natural', 'https://example.com/grottes.jpg', 36.8200, 5.7400),
((SELECT id FROM jijel_id), 'Parc National de Taza', 'الحظيرة الوطنية تازة', 'Parc national avec une biodiversité unique.', 'Natural', 'https://example.com/taza.jpg', 36.7333, 5.5167);

INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
((SELECT id FROM jijel_id), 'Sardines à la Jijelienne', 'سردين جيجل', 'Sardines grillées à la façon traditionnelle.', 'Seafood', 'https://example.com/sardines.jpg', ARRAY['sardines fraîches', 'huile d''olive', 'citron', 'ail', 'persil']);

-- Batna
INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
('Batna', 'باتنة', 'Capitale des Aurès, riche en sites archéologiques et en patrimoine naturel.', 'https://example.com/batna.jpg', 35.5500, 6.1700);

WITH batna_id AS (SELECT id FROM regions WHERE name = 'Batna' LIMIT 1)
INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
((SELECT id FROM batna_id), 'Timgad', 'تيمقاد', 'Cité romaine exceptionnellement préservée, classée UNESCO.', 'Archaeological', 'https://example.com/timgad.jpg', 35.4833, 6.4667),
((SELECT id FROM batna_id), 'Balcons de Ghoufi', 'شرفات غوفي', 'Canyon spectaculaire avec habitations troglodytes.', 'Natural', 'https://example.com/ghoufi-batna.jpg', 35.0667, 5.9167);

INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
((SELECT id FROM batna_id), 'Chakhchoukha des Aurès', 'شخشوخة الأوراس', 'Version aurasienne du plat traditionnel.', 'Main Dish', 'https://example.com/chakhchoukha-aures.jpg', ARRAY['pain traditionnel', 'viande d''agneau', 'tomates', 'piments', 'ail']);

-- Adrar
INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
('Adrar', 'أدرار', 'Porte du Sahara occidental, connue pour ses foggaras et son architecture saharienne.', 'https://example.com/adrar.jpg', 27.8742, -0.2939);

WITH adrar_id AS (SELECT id FROM regions WHERE name = 'Adrar' LIMIT 1)
INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
((SELECT id FROM adrar_id), 'Foggaras', 'الفقارة', 'Système d''irrigation traditionnel du Sahara.', 'Cultural', 'https://example.com/foggara.jpg', 27.8800, -0.2900),
((SELECT id FROM adrar_id), 'Timimoun', 'تيميمون', 'Oasis rouge avec son architecture traditionnelle.', 'Architectural', 'https://example.com/timimoun.jpg', 29.2614, 0.2310);

INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
((SELECT id FROM adrar_id), 'Couscous au Chameau', 'كسكس بلحم الإبل', 'Couscous traditionnel à la viande de chameau.', 'Main Dish', 'https://example.com/couscous-chameau.jpg', ARRAY['semoule', 'viande de chameau', 'légumes', 'épices']);

-- Mostaganem
INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
('Mostaganem', 'مستغانم', 'Ville côtière historique avec des plages magnifiques et un riche patrimoine ottoman.', 'https://example.com/mostaganem.jpg', 35.9311, 0.0892);

WITH mostaganem_id AS (SELECT id FROM regions WHERE name = 'Mostaganem' LIMIT 1)
INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
((SELECT id FROM mostaganem_id), 'Dar El Kaïd', 'دار القايد', 'Palais ottoman du 18ème siècle.', 'Historical', 'https://example.com/dar-kaid.jpg', 35.9300, 0.0900),
((SELECT id FROM mostaganem_id), 'Plage de Sablettes', 'شاطئ صابلات', 'Plus belle plage de la région.', 'Natural', 'https://example.com/sablettes.jpg', 35.9400, 0.0500);

INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
((SELECT id FROM mostaganem_id), 'Bradj', 'البراج', 'Gâteau traditionnel aux dattes.', 'Dessert', 'https://example.com/bradj.jpg', ARRAY['semoule', 'dattes', 'beurre', 'huile']);

-- Ouargla
INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
('Ouargla', 'ورقلة', 'La reine des Zibans, oasis millénaire au cœur du Sahara.', 'https://example.com/ouargla.jpg', 31.9500, 5.3333);

WITH ouargla_id AS (SELECT id FROM regions WHERE name = 'Ouargla' LIMIT 1)
INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
((SELECT id FROM ouargla_id), 'Ksar de Ouargla', 'قصر ورقلة', 'Ancien ksar avec son architecture saharienne unique.', 'Historical', 'https://example.com/ksar-ouargla.jpg', 31.9547, 5.3242),
((SELECT id FROM ouargla_id), 'Sebkha', 'السبخة', 'Lac salé naturel aux propriétés thérapeutiques.', 'Natural', 'https://example.com/sebkha.jpg', 31.9600, 5.3400);

INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
((SELECT id FROM ouargla_id), 'Zriga', 'الزريقة', 'Soupe traditionnelle aux herbes du désert.', 'Soup', 'https://example.com/zriga.jpg', ARRAY['orge', 'herbes sauvages', 'tomates séchées', 'épices']);

-- El Oued
INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
('El Oued', 'الوادي', 'La ville aux mille coupoles, célèbre pour son architecture unique.', 'https://example.com/eloued.jpg', 33.3680, 6.8516);

WITH eloued_id AS (SELECT id FROM regions WHERE name = 'El Oued' LIMIT 1)
INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
((SELECT id FROM eloued_id), 'Souf traditionnel', 'سوف التقليدية', 'Quartier historique aux maisons à coupoles.', 'Architectural', 'https://example.com/souf.jpg', 33.3700, 6.8500),
((SELECT id FROM eloued_id), 'Ghout El Oued', 'غوط الوادي', 'Palmeraies creusées dans le sable.', 'Agricultural', 'https://example.com/ghout.jpg', 33.3750, 6.8600);

INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
((SELECT id FROM eloued_id), 'Malfouf', 'ملفوف', 'Pâtisserie traditionnelle aux dattes.', 'Dessert', 'https://example.com/malfouf.jpg', ARRAY['semoule fine', 'dattes', 'huile', 'sucre']);

-- Boumerdès
INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
('Boumerdès', 'بومرداس', 'Ville côtière moderne avec de belles plages et stations balnéaires.', 'https://example.com/boumerdes.jpg', 36.7667, 3.4667);

WITH boumerdes_id AS (SELECT id FROM regions WHERE name = 'Boumerdès' LIMIT 1)
INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
((SELECT id FROM boumerdes_id), 'Cap Djinet', 'رأس جنات', 'Cap rocheux avec phare historique.', 'Natural', 'https://example.com/cap-djinet.jpg', 36.8789, 3.7308),
((SELECT id FROM boumerdes_id), 'Thermes romains', 'الحمامات الرومانية', 'Vestiges de thermes de l''époque romaine.', 'Archaeological', 'https://example.com/thermes.jpg', 36.7700, 3.4700);

INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
((SELECT id FROM boumerdes_id), 'Poisson à la Bougiotte', 'سمك على طريقة البجاوية', 'Poisson grillé à la façon traditionnelle.', 'Seafood', 'https://example.com/poisson-boumerdes.jpg', ARRAY['poisson frais', 'citron', 'ail', 'huile d''olive', 'épices']);

-- M'Sila
INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
('M''Sila', 'المسيلة', 'Ville historique des Hauts Plateaux, connue pour son patrimoine islamique.', 'https://example.com/msila.jpg', 35.7058, 4.5419);

WITH msila_id AS (SELECT id FROM regions WHERE name = 'M''Sila' LIMIT 1)
INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
((SELECT id FROM msila_id), 'Kalâa des Béni Hammad', 'قلعة بني حماد', 'Site UNESCO, ancienne capitale hammadide.', 'Archaeological', 'https://example.com/kalaa.jpg', 35.8167, 4.7833),
((SELECT id FROM msila_id), 'Chott El Hodna', 'شط الحضنة', 'Grand lac salé avec écosystème unique.', 'Natural', 'https://example.com/chott-hodna.jpg', 35.5500, 4.5000);

INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
((SELECT id FROM msila_id), 'Rfis M''Sili', 'رفيس المسيلة', 'Pain traditionnel aux dattes et au beurre.', 'Traditional', 'https://example.com/rfis-msila.jpg', ARRAY['pain sec', 'dattes', 'beurre', 'miel']);

-- Mascara
INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
('Mascara', 'معسكر', 'Ville historique, berceau de l''Émir Abdelkader.', 'https://example.com/mascara.jpg', 35.4022, 0.1392);

WITH mascara_id AS (SELECT id FROM regions WHERE name = 'Mascara' LIMIT 1)
INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
((SELECT id FROM mascara_id), 'Beït El Emir', 'بيت الأمير', 'Demeure historique de l''Émir Abdelkader.', 'Historical', 'https://example.com/beit-emir.jpg', 35.4000, 0.1400),
((SELECT id FROM mascara_id), 'Forêt de Nesmoth', 'غابة نسموط', 'Vaste forêt de pins avec faune diverse.', 'Natural', 'https://example.com/nesmoth.jpg', 35.2667, 0.2500);

INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
((SELECT id FROM mascara_id), 'Berkoukes', 'بركوكس', 'Plat traditionnel de pâtes roulées à la main.', 'Main Dish', 'https://example.com/berkoukes.jpg', ARRAY['semoule', 'légumes', 'viande', 'pois chiches', 'épices']);

-- Djelfa
INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
('Djelfa', 'الجلفة', 'Carrefour du Sahara, connue pour ses sites préhistoriques et son artisanat.', 'https://example.com/djelfa.jpg', 34.6667, 3.2500);

WITH djelfa_id AS (SELECT id FROM regions WHERE name = 'Djelfa' LIMIT 1)
INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
((SELECT id FROM djelfa_id), 'Gravures Rupestres', 'النقوش الصخرية', 'Art rupestre préhistorique.', 'Archaeological', 'https://example.com/gravures.jpg', 34.6700, 3.2600),
((SELECT id FROM djelfa_id), 'Dar Diaf', 'دار الضياف', 'Palais historique du 19ème siècle.', 'Historical', 'https://example.com/dar-diaf.jpg', 34.6680, 3.2550);

INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
((SELECT id FROM djelfa_id), 'Doubara', 'الدوبارة', 'Soupe traditionnelle aux pois chiches.', 'Soup', 'https://example.com/doubara.jpg', ARRAY['pois chiches', 'viande', 'tomates', 'cumin', 'piment']);

-- Laghouat
INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
('Laghouat', 'الأغواط', 'Ville oasis aux portes du désert, riche en patrimoine saharien.', 'https://example.com/laghouat.jpg', 33.8000, 2.8667);

WITH laghouat_id AS (SELECT id FROM regions WHERE name = 'Laghouat' LIMIT 1)
INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
((SELECT id FROM laghouat_id), 'Ksar El Hirane', 'قصر الحيران', 'Village fortifié traditionnel.', 'Historical', 'https://example.com/ksar-hirane.jpg', 33.8100, 2.8700),
((SELECT id FROM laghouat_id), 'Jardin Landon', 'حديقة لاندون', 'Jardin colonial historique.', 'Cultural', 'https://example.com/landon.jpg', 33.8050, 2.8680);

INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
((SELECT id FROM laghouat_id), 'Tadjine Laghwati', 'طاجين الأغواطي', 'Tajine local aux légumes du désert.', 'Main Dish', 'https://example.com/tadjine-laghouat.jpg', ARRAY['viande', 'légumes', 'épices locales', 'huile d''olive']);

-- Bordj Bou Arreridj
INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
('Bordj Bou Arreridj', 'برج بوعريريج', 'La ville des Bibans, porte des Hauts Plateaux.', 'https://example.com/bordj.jpg', 36.0667, 4.7667);

WITH bordj_id AS (SELECT id FROM regions WHERE name = 'Bordj Bou Arreridj' LIMIT 1)
INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
((SELECT id FROM bordj_id), 'Les Portes de Fer', 'الأبواب الحديدية', 'Défilé montagneux historique.', 'Natural', 'https://example.com/portes-fer.jpg', 36.0700, 4.7700),
((SELECT id FROM bordj_id), 'Zamora', 'زمورة', 'Site archéologique romain.', 'Archaeological', 'https://example.com/zamora.jpg', 36.0720, 4.7720);

INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
((SELECT id FROM bordj_id), 'Chekhchoukha Bordji', 'شخشوخة برايجية', 'Version locale de la chekhchoukha.', 'Main Dish', 'https://example.com/chekhchoukha-bordj.jpg', ARRAY['pain traditionnel', 'viande', 'sauce tomate', 'pois chiches']);

-- El Bayadh
INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
('El Bayadh', 'البيض', 'Ville des hauts plateaux, connue pour ses tapis traditionnels.', 'https://example.com/bayadh.jpg', 33.6833, 1.0167);

WITH bayadh_id AS (SELECT id FROM regions WHERE name = 'El Bayadh' LIMIT 1)
INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
((SELECT id FROM bayadh_id), 'Ateliers de Tapis', 'ورشات السجاد', 'Centres d''artisanat traditionnel.', 'Cultural', 'https://example.com/tapis.jpg', 33.6850, 1.0180),
((SELECT id FROM bayadh_id), 'Monts des Ksour', 'جبال القصور', 'Chaîne montagneuse avec ksour anciens.', 'Natural', 'https://example.com/ksour.jpg', 33.7000, 1.0200);

INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
((SELECT id FROM bayadh_id), 'Méchoui El Bayadh', 'مشوي البيض', 'Agneau rôti traditionnel.', 'Main Dish', 'https://example.com/mechoui-bayadh.jpg', ARRAY['agneau', 'épices', 'oignons', 'pommes de terre']);

-- Illizi
INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
('Illizi', 'إليزي', 'Région du Tassili n''Ajjer, célèbre pour ses peintures rupestres.', 'https://example.com/illizi.jpg', 26.5000, 8.4833);

WITH illizi_id AS (SELECT id FROM regions WHERE name = 'Illizi' LIMIT 1)
INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
((SELECT id FROM illizi_id), 'Tassili n''Ajjer', 'طاسيلي ناجر', 'Site UNESCO avec art rupestre préhistorique.', 'UNESCO World Heritage', 'https://example.com/tassili.jpg', 25.5000, 8.0000),
((SELECT id FROM illizi_id), 'Djanet', 'جانت', 'Oasis saharienne avec architecture traditionnelle.', 'Cultural', 'https://example.com/djanet.jpg', 24.5500, 9.4833);

INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
((SELECT id FROM illizi_id), 'Pain de Sable', 'خبز الرمل', 'Pain traditionnel cuit dans le sable.', 'Traditional', 'https://example.com/pain-sable.jpg', ARRAY['farine', 'eau', 'sel', 'levure']);

-- Khenchela
INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
('Khenchela', 'خنشلة', 'Ville des Aurès, connue pour ses sources thermales.', 'https://example.com/khenchela.jpg', 35.4333, 7.1333);

WITH khenchela_id AS (SELECT id FROM regions WHERE name = 'Khenchela' LIMIT 1)
INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
((SELECT id FROM khenchela_id), 'Hammam Essalihine', 'حمام الصالحين', 'Sources thermales romaines.', 'Historical', 'https://example.com/hammam-essalihine.jpg', 35.4350, 7.1350),
((SELECT id FROM khenchela_id), 'Site de Theveste', 'موقع تبسة', 'Ruines romaines.', 'Archaeological', 'https://example.com/theveste.jpg', 35.4400, 7.1400);

INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
((SELECT id FROM khenchela_id), 'Cherchem', 'الشرشم', 'Soupe traditionnelle aux légumes.', 'Soup', 'https://example.com/cherchem.jpg', ARRAY['blé concassé', 'légumes', 'viande', 'épices']);

-- Souk Ahras
INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
('Souk Ahras', 'سوق أهراس', 'Ville natale de Saint Augustin, riche en histoire romaine.', 'https://example.com/souk-ahras.jpg', 36.2864, 7.9511);

WITH soukahras_id AS (SELECT id FROM regions WHERE name = 'Souk Ahras' LIMIT 1)
INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
((SELECT id FROM soukahras_id), 'Thagaste', 'ثاقاست', 'Site antique, ville natale de Saint Augustin.', 'Archaeological', 'https://example.com/thagaste.jpg', 36.2870, 7.9520),
((SELECT id FROM soukahras_id), 'Khémissa', 'خميسة', 'Site romain avec théâtre antique.', 'Archaeological', 'https://example.com/khemissa.jpg', 36.2000, 7.6500);

INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
((SELECT id FROM soukahras_id), 'Rechta Souk Ahras', 'رشتة سوق أهراس', 'Pâtes traditionnelles à la sauce blanche.', 'Main Dish', 'https://example.com/rechta-soukahras.jpg', ARRAY['pâtes maison', 'poulet', 'pois chiches', 'sauce blanche']);

-- Tipaza
INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
('Tipaza', 'تيبازة', 'Site UNESCO avec ruines romaines et phéniciennes en bord de mer.', 'https://example.com/tipaza.jpg', 36.6178, 2.4547);

WITH tipaza_id AS (SELECT id FROM regions WHERE name = 'Tipaza' LIMIT 1)
INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
((SELECT id FROM tipaza_id), 'Site Archéologique de Tipaza', 'الموقع الأثري تيبازة', 'Ruines romaines classées UNESCO.', 'UNESCO World Heritage', 'https://example.com/ruins-tipaza.jpg', 36.6180, 2.4550),
((SELECT id FROM tipaza_id), 'Tombeau de la Chrétienne', 'قبر الرومية', 'Mausolée royal mauritanien.', 'Historical', 'https://example.com/tombeau.jpg', 36.5833, 2.5167);

INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
((SELECT id FROM tipaza_id), 'Poisson à la Tipazienne', 'سمك على طريقة تيبازة', 'Poisson grillé aux herbes locales.', 'Seafood', 'https://example.com/poisson-tipaza.jpg', ARRAY['poisson frais', 'herbes', 'citron', 'huile d''olive']);

-- Chlef
INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
('Chlef', 'الشلف', 'Ville historique de la vallée du Chelif.', 'https://example.com/chlef.jpg', 36.1647, 1.3333);

WITH chlef_id AS (SELECT id FROM regions WHERE name = 'Chlef' LIMIT 1)
INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
((SELECT id FROM chlef_id), 'Ruines d''El Asnam', 'آثار الأصنام', 'Site archéologique de l''ancienne Castellum Tingitanum.', 'Archaeological', 'https://example.com/el-asnam.jpg', 36.1650, 1.3340),
((SELECT id FROM chlef_id), 'Ténès', 'تنس', 'Ville côtière historique avec phare.', 'Historical', 'https://example.com/tenes.jpg', 36.5167, 1.3167);

INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
((SELECT id FROM chlef_id), 'Couscous au Poisson', 'كسكس بالسمك', 'Couscous aux fruits de mer.', 'Seafood', 'https://example.com/couscous-chlef.jpg', ARRAY['semoule', 'poisson', 'légumes', 'pois chiches']);

-- Guelma
INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
('Guelma', 'قالمة', 'Ville antique connue pour ses thermes romains.', 'https://example.com/guelma.jpg', 36.4667, 7.4333);

WITH guelma_id AS (SELECT id FROM regions WHERE name = 'Guelma' LIMIT 1)
INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
((SELECT id FROM guelma_id), 'Théâtre Romain', 'المسرح الروماني', 'Théâtre antique bien préservé.', 'Archaeological', 'https://example.com/theatre-guelma.jpg', 36.4670, 7.4340),
((SELECT id FROM guelma_id), 'Hammam Debagh', 'حمام دباغ', 'Sources thermales thérapeutiques.', 'Natural', 'https://example.com/hammam-debagh.jpg', 36.4680, 7.4350);

INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
((SELECT id FROM guelma_id), 'Tbikha', 'الطبيخة', 'Ragoût traditionnel aux légumes.', 'Main Dish', 'https://example.com/tbikha.jpg', ARRAY['viande', 'légumes', 'pois chiches', 'épices']);

-- Sidi Bel Abbès
INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
('Sidi Bel Abbès', 'سيدي بلعباس', 'Ville culturelle, ancien siège de la Légion étrangère.', 'https://example.com/sba.jpg', 35.2000, -0.6333);

WITH sba_id AS (SELECT id FROM regions WHERE name = 'Sidi Bel Abbès' LIMIT 1)
INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
((SELECT id FROM sba_id), 'Grande Mosquée', 'الجامع الكبير', 'Mosquée historique du 19ème siècle.', 'Religious', 'https://example.com/mosquee-sba.jpg', 35.2010, -0.6340),
((SELECT id FROM sba_id), 'Forêt de Tenira', 'غابة تنيرة', 'Grande forêt naturelle.', 'Natural', 'https://example.com/tenira.jpg', 35.0167, -0.5333);

INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
((SELECT id FROM sba_id), 'Harrira', 'الحريرة', 'Soupe traditionnelle épaisse.', 'Soup', 'https://example.com/harrira.jpg', ARRAY['viande', 'pois chiches', 'lentilles', 'tomates', 'vermicelles']);

-- Skikda
INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
('Skikda', 'سكيكدة', 'Port historique avec plages magnifiques.', 'https://example.com/skikda.jpg', 36.8667, 6.9000);

WITH skikda_id AS (SELECT id FROM regions WHERE name = 'Skikda' LIMIT 1)
INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
((SELECT id FROM skikda_id), 'Russicada', 'روسيكادا', 'Vestiges de la ville romaine.', 'Archaeological', 'https://example.com/russicada.jpg', 36.8670, 6.9010),
((SELECT id FROM skikda_id), 'Cap de Fer', 'رأس الحديد', 'Cap rocheux spectaculaire.', 'Natural', 'https://example.com/cap-fer.jpg', 37.0333, 7.1667);

INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
((SELECT id FROM skikda_id), 'Sardines Farcies', 'سردين محشي', 'Sardines farcies à la skikdie.', 'Seafood', 'https://example.com/sardines-skikda.jpg', ARRAY['sardines', 'persil', 'ail', 'épices', 'citron']);

-- Aïn Defla
INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
('Aïn Defla', 'عين الدفلى', 'Région montagneuse avec riche patrimoine historique.', 'https://example.com/ain-defla.jpg', 36.2647, 1.9667);

WITH aindefla_id AS (SELECT id FROM regions WHERE name = 'Aïn Defla' LIMIT 1)
INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
((SELECT id FROM aindefla_id), 'Miliana', 'مليانة', 'Ville historique avec remparts.', 'Historical', 'https://example.com/miliana.jpg', 36.3000, 2.2333),
((SELECT id FROM aindefla_id), 'Mont Zaccar', 'جبل زكار', 'Montagne avec vue panoramique.', 'Natural', 'https://example.com/zaccar.jpg', 36.3167, 2.2500);

INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
((SELECT id FROM aindefla_id), 'Zirawi', 'زيراوي', 'Couscous aux légumes de saison.', 'Main Dish', 'https://example.com/zirawi.jpg', ARRAY['semoule', 'légumes', 'viande', 'pois chiches', 'fèves']);

-- Mila
INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
('Mila', 'ميلة', 'Ville antique avec un riche patrimoine architectural.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/Mila_City.jpg/1280px-Mila_City.jpg', 36.4500, 6.2667);

DO $$
DECLARE
    mila_id uuid;
BEGIN
    SELECT id INTO mila_id FROM regions WHERE name = 'Mila' LIMIT 1;
    
    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (mila_id, 'Vieux Mila', 'ميلة القديمة', 'Centre historique avec architecture médiévale.', 'Historical', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Old_Mila.jpg/1280px-Old_Mila.jpg', 36.4510, 6.2677),
    (mila_id, 'Mechta Ain El Kbira', 'مشتة عين الكبيرة', 'Site archéologique romain.', 'Archaeological', 'https://upload.wikimedia.org/wikipedia/commons/3/3f/Mila_ruins.jpg', 36.4520, 6.2687);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (mila_id, 'Kesra', 'كسرة', 'Pain traditionnel cuit sur pierre.', 'Traditional', 'https://www.algerie360.com/wp-content/uploads/2020/06/kesra-traditionnelle.jpg', ARRAY['semoule', 'eau', 'sel', 'huile d''olive']);
END $$;

-- Naâma
INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
('Naâma', 'النعامة', 'Porte du Sahara occidental avec ses ksour historiques.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a2/Naama_Desert.jpg/1280px-Naama_Desert.jpg', 33.2667, -0.3167);

DO $$
DECLARE
    naama_id uuid;
BEGIN
    SELECT id INTO naama_id FROM regions WHERE name = 'Naâma' LIMIT 1;
    
    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (naama_id, 'Ksar Moghrar', 'قصر مغرار', 'Village fortifié traditionnel.', 'Historical', 'https://www.vitaminedz.org/photos/1/1546-naama-ksar.jpg', 32.9500, -0.2833),
    (naama_id, 'Djebel Aissa', 'جبل عيسى', 'Montagne avec gravures rupestres.', 'Natural', 'https://www.vitaminedz.org/photos/1/1547-djebel-aissa.jpg', 33.0000, -0.3000);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (naama_id, 'Rfiss Naâmi', 'رفيس النعامة', 'Dessert traditionnel aux dattes.', 'Dessert', 'https://www.dzairdaily.com/wp-content/uploads/2022/04/rfiss-traditionnel.jpg', ARRAY['pain sec', 'dattes', 'beurre', 'miel']);
END $$;

-- Tissemsilt
INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
('Tissemsilt', 'تيسمسيلت', 'Région montagneuse avec des forêts denses et des sites historiques.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Tissemsilt_Panorama.jpg/1280px-Tissemsilt_Panorama.jpg', 35.6072, 1.8103);

DO $$
DECLARE
    tissemsilt_id uuid;
BEGIN
    SELECT id INTO tissemsilt_id FROM regions WHERE name = 'Tissemsilt' LIMIT 1;
    
    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (tissemsilt_id, 'Forêt de Theniet El Had', 'غابة ثنية الحد', 'Parc national avec des cèdres centenaires.', 'Natural', 'https://www.vitaminedz.org/photos/1/1548-theniet-el-had.jpg', 35.8667, 2.0167),
    (tissemsilt_id, 'Site historique d''Ain Soltane', 'عين السلطان', 'Source thermale et vestiges historiques.', 'Historical', 'https://www.vitaminedz.org/photos/1/1549-ain-soltane.jpg', 35.6100, 1.8120);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (tissemsilt_id, 'Berkoukes', 'بركوكس', 'Plat traditionnel aux boulettes de semoule.', 'Main Dish', 'https://www.dzairdaily.com/wp-content/uploads/2021/06/berkoukes-traditionnel.jpg', ARRAY['semoule', 'légumes', 'viande', 'pois chiches']);
END $$;

-- Tizi-Ouzou
INSERT INTO regions (name, name_ar, description, image_url, latitude, longitude) VALUES
('Tizi-Ouzou', 'تيزي وزو', 'Cœur de la Kabylie, région montagneuse riche en traditions.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5d/Tizi_Ouzou_City.jpg/1280px-Tizi_Ouzou_City.jpg', 36.7169, 4.0474);

DO $$
DECLARE
    tiziouzou_id uuid;
BEGIN
    SELECT id INTO tiziouzou_id FROM regions WHERE name = 'Tizi-Ouzou' LIMIT 1;
    
    INSERT INTO heritage_sites (region_id, name, name_ar, description, category, image_url, latitude, longitude) VALUES
    (tiziouzou_id, 'Village Ath Yenni', 'آث يني', 'Village traditionnel célèbre pour ses bijoux en argent.', 'Cultural', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Ath_Yenni_Village.jpg/1280px-Ath_Yenni_Village.jpg', 36.6333, 4.2333),
    (tiziouzou_id, 'Djurdjura', 'جرجرة', 'Parc national avec sommets enneigés.', 'Natural', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9f/Djurdjura_Mountains.jpg/1280px-Djurdjura_Mountains.jpg', 36.4667, 4.2333);

    INSERT INTO gastronomy (region_id, name, name_ar, description, category, image_url, ingredients) VALUES
    (tiziouzou_id, 'Aghrum', 'أغروم', 'Pain traditionnel kabyle.', 'Traditional', 'https://www.dzairdaily.com/wp-content/uploads/2021/08/pain-kabyle-traditionnel.jpg', ARRAY['semoule', 'sel', 'eau', 'levure']),
    (tiziouzou_id, 'Couscous aux fèves', 'الكسكس بالفول', 'Couscous printanier traditionnel.', 'Main Dish', 'https://www.196flavors.com/wp-content/uploads/2018/03/couscous-kabyle-2.jpg', ARRAY['semoule', 'fèves', 'huile d''olive', 'viande']);
END $$;

-- More regions coming...
