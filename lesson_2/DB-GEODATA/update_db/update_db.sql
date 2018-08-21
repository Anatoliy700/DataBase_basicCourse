ALTER TABLE _countries
  DROP title_ua,
  DROP title_be,
  DROP title_en,
  DROP title_es,
  DROP title_pt,
  DROP title_de,
  DROP title_fr,
  DROP title_it,
  DROP title_pl,
  DROP title_ja,
  DROP title_lt,
  DROP title_lv,
  DROP title_cz,
  CHANGE title_ru title VARCHAR(150) NOT NULL UNIQUE,
  CHANGE country_id id INT NOT NULL AUTO_INCREMENT PRIMARY KEY;




ALTER TABLE `_regions`
  DROP title_ua,
  DROP title_be,
  DROP title_en,
  DROP title_es,
  DROP title_pt,
  DROP title_de,
  DROP title_fr,
  DROP title_it,
  DROP title_pl,
  DROP title_ja,
  DROP title_lt,
  DROP title_lv,
  DROP title_cz;
CREATE TABLE tmp_table LIKE _regions;
ALTER TABLE tmp_table
  CHANGE title_ru title VARCHAR(150) NOT NULL UNIQUE,
  CHANGE region_id id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  ADD CONSTRAINT fk_region_country FOREIGN KEY (country_id) REFERENCES `_countries` (id)
  ON DELETE CASCADE
  ON UPDATE CASCADE;
INSERT IGNORE INTO tmp_table SELECT * FROM _regions;
DROP TABLE _regions;
RENAME TABLE tmp_table TO _regions;




ALTER TABLE `_cities`
DROP area_ru,
DROP region_ru,
DROP title_ua,
DROP area_ua,
DROP region_ua,
DROP title_be,
DROP area_be,
DROP region_be,
DROP title_en,
DROP area_en,
DROP region_en,
DROP title_es,
DROP area_es,
DROP region_es,
DROP title_pt,
DROP area_pt,
DROP region_pt,
DROP title_de,
DROP area_de,
DROP region_de,
DROP title_fr,
DROP area_fr,
DROP region_fr,
DROP title_it,
DROP area_it,
DROP region_it,
DROP title_pl,
DROP area_pl,
DROP region_pl,
DROP title_ja,
DROP area_ja,
DROP region_ja,
DROP title_lt,
DROP area_lt,
DROP region_lt,
DROP title_lv,
DROP area_lv,
DROP region_lv,
DROP title_cz,
DROP area_cz,
DROP region_cz;
DELETE FROM `_cities`
WHERE city_id IN (
  SELECT c.city_id
  FROM (SELECT * FROM _cities) c
    LEFT JOIN `_regions` r ON r.id = c.region_id
  WHERE r.id IS NULL
        AND c.region_id IS NOT NULL
);
CREATE TABLE tmp_table LIKE `_cities`;
ALTER TABLE tmp_table
CHANGE title_ru title VARCHAR(150) NOT NULL UNIQUE,
  CHANGE city_id id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  ADD CONSTRAINT fk_city_country FOREIGN KEY (country_id) REFERENCES `_countries` (id)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  ADD CONSTRAINT fk_city_region FOREIGN KEY (region_id) REFERENCES `_regions` (id)
  ON DELETE CASCADE
  ON UPDATE CASCADE;
INSERT IGNORE INTO tmp_table SELECT * FROM `_cities`;
DROP TABLE `_cities`;
RENAME TABLE tmp_table TO `_cities`;