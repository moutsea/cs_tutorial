.read fa17data.sql
.read sp18data.sql

-- Q2
CREATE TABLE obedience AS
  select seven, denero from students;

-- Q3
CREATE TABLE smallest_int AS
  select time, smallest from students
  where smallest > 15
  order by smallest
  limit 20;


-- Q4
CREATE TABLE matchmaker AS
  select  a.pet, a.song, a.color as color1, b.color as color2
  from students as a, students as b
  where a.pet = b.pet and a.song = b.song and a.time < b.time;
