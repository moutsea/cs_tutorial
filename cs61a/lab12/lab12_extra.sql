.read lab12.sql

-- Q5
CREATE TABLE greatstudents AS
  select a.date, a.color, a.pet, a.number as number_18, b.number as number_17
  from students as a, students_pt1 as b
  where a.pet = b.pet and a.date = b.date and a.color = b.color;

-- Q6
CREATE TABLE sevens AS
  select seven
  from students as a, checkboxes as b
  where a.time = b.time and a.number = 7 and b.'7' = 'True';

-- Q7
CREATE TABLE fa17favnum AS
  select number, count(*) as cnt
  from students_pt1
  group by number order by cnt desc limit 1;


CREATE TABLE fa17favpets AS
  select pet, count(*) as cnt
  from students_pt1
  group by pet order by cnt desc limit 10;


CREATE TABLE sp18favpets AS
  select pet, count(*) as cnt
  from students
  group by pet order by cnt desc limit 10;


CREATE TABLE sp18dog AS
  select pet, count(*) as cnt
  from students
  where pet = 'dog'
  group by pet;


CREATE TABLE sp18alldogs AS
  select pet, count(*) as cnt
  from students
  where pet like '%dog%';


CREATE TABLE obedienceimages AS
  select seven, denero, count(*) as cnt
  from students
  where seven = '7'
  group by seven, denero;

-- Q8
CREATE TABLE smallest_int_count AS
  select smallest, count(*) as cnt
  from students
  group by smallest;


