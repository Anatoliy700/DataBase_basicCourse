#/////Task 1////////
SELECT
  cc.title AS city,
  r.title  AS region,
  c.title  AS country
FROM _cities cc
  LEFT JOIN _regions r ON cc.region_id = r.id
  LEFT JOIN _countries c ON cc.country_id = c.id
WHERE cc.title = 'Кострома';

#/////Task 2////////
SELECT
  r.title AS region,
  c.title AS cities
FROM _regions r
  LEFT JOIN _cities c ON c.region_id = r.id
WHERE r.title = 'Московская область';


