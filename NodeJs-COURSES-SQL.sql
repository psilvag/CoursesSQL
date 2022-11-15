CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "name" varchar,
  "email" varchar,
  "password" varchar,
  "age" int,
  "role_id" int,
  "membership_id" int
);

CREATE TABLE "memberships" (
  "id" serial PRIMARY KEY,
  "name" varchar,
  "description" text,
  "price" float
);

CREATE TABLE "courses" (
  "id" uuid PRIMARY KEY,
  "title" varchar,
  "description" text,
  "level" varchar(20),
  "teacher" varchar(50),
  "duration" int,
  "price" float4,
  "url_cover" text
);

CREATE TABLE "course_videos" (
  "id" uuid PRIMARY KEY,
  "title" varchar,
  "url" varchar,
  "course_id" uuid
);

CREATE TABLE "categories" (
  "id" serial PRIMARY KEY,
  "name" varchar(70)
);

CREATE TABLE "roles" (
  "id" serial PRIMARY KEY,
  "name" varchar(15)
);

CREATE TABLE "courses_categories" (
  "id" uuid,
  "course_id" uuid,
  "categorie_id" int
);

CREATE TABLE "users_courses" (
  "id" uuid,
  "user_id" uuid,
  "course_id" uuid,
  "status_course" varchar
);

ALTER TABLE "courses_categories" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "courses_categories" ADD FOREIGN KEY ("categorie_id") REFERENCES "categories" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("role_id") REFERENCES "roles" ("id");

ALTER TABLE "course_videos" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("membership_id") REFERENCES "memberships" ("id");

ALTER TABLE "users_courses" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "users_courses" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");


-------------------------------------REGISTERS ON TABLES-------------------------------------------

--CREATE TABLE USERS
insert into users (
id,
name,
email,
password,
age,
role_id,
membership_id
)

values(
'4b334b2a-ab08-4871-96c0-985fa776ce45',
'Ricardo Soliz',
'ricardo@gmail.com',
'saf53fsadf4',
34,
3,
1
),(
'554bffd5-9679-490d-861c-7cbd1804acdd',
'Martha Conde',
'conde@gmail.com',
'3565gddr43',
28,
2,
null
),(
'08a38ad9-7d9f-48de-8b1a-002891876e46',
'Esteban Berman',
'berman@gmail.com',
'456dfg5FGT6',
41,
3,
3
);

--CREATE TABLE ROLES
insert into roles(
name
)
values (
'admin'
),(
'teacher'
),(
'student'
);

--CREATE TABLE MEMBERSHIPS
insert into memberships(
name,
description,
price
)
values (
'Basic',
'The Student can share any course with only one friend',
120.00
),(
'Premium',
'The student can share the course with four friends',
280.00
),(
'Gold',
'For each course that the student buys, they can choose an extra one',
300.00
);


--CREATE TABLE COURSES
insert into courses (
id,
title,
description,
level,
teacher,
duration,
price, 
url_cover
)

values(
'a532f5f0-a896-40e1-a207-1311408363cf',
'Learn JavaScript,HTML5 and CSS3',
'Learn web development with this 100% practical course',
'Beginner',
'Juan Pablo de la Torre',
83,
89.99,
'https://acortar.link/6VNWgC'
),
(
'688ceb60-1249-4b8e-ac41-0ff3ed175289',
'React Native',
'React native create your apps for Android and Ios',
'Advanced',
'Fernando Herrera',
58,
84.99,
'https://acortar.link/GypP5Q'
),
(
'e2b1e827-245c-4cb5-a206-8645de1c3985',
'PostgreSQL',
'Configure a high availability system in PostgresSQL',
'Beginner',
'Alejandro Guzman Castellanos',
58,
34.99,
'https://acortar.link/cXdP8a'
);


--CREATE TABLE CATEGORIES
insert into categories (
name
)
 values ('Web Development'),('Mobile Development'),('Data bases');


--CREATE TABLE COURSE_VIDEOS
insert into course_videos (
id,
title,
url,
course_id
)
values (
'cca4b69d-5b33-4ced-959e-f4de791cbc2d',
'My first app in React Native',
'https://www.udemy.com/course/react-native-fh/',
'688ceb60-1249-4b8e-ac41-0ff3ed175289'
),(
'79be508e-4ee2-4269-8eb9-ca22efaf785f',
'Calculator Ios',
'https://www.udemy.com/course/react-native-fh/',
'688ceb60-1249-4b8e-ac41-0ff3ed175289'
),(
'3c0cdffa-bfda-48a0-a3e1-ca56cec87f1e',
'postgreSQL Start',
'https://www.udemy.com/course/dba-postgresql/',
'e2b1e827-245c-4cb5-a206-8645de1c3985'
),(
'4a9e59d0-a25f-4bb8-bbd8-566423120a39',
'Use triggers in PostgreSQL',
'https://www.udemy.com/course/dba-postgresql/',
'e2b1e827-245c-4cb5-a206-8645de1c3985'
),(
'573f523d-b4eb-4c95-ba46-5a23fdb2b75b',
'My first step in HTML5 and CC3',
'https://www.udemy.com/course/todo-html5-y-css3-de-novato-a-experto/',
'a532f5f0-a896-40e1-a207-1311408363cf'
);

-- CREATE TABLE COURSES CATEGORIES

insert into courses_categories (
id,
course_id,
categorie_id 
)
values(
'501281c5-41e5-4e65-a817-aab4d51e7a8c',
'688ceb60-1249-4b8e-ac41-0ff3ed175289',
2
),(
'fa0b7498-22d8-44fe-a5f4-1db6dc2c3fa5',
'a532f5f0-a896-40e1-a207-1311408363cf',
1
),
(
'3079db96-4f17-456c-9fc9-f3b0b0c0daed',
'e2b1e827-245c-4cb5-a206-8645de1c3985',
3
)
 
-- CREATE TABLE COURSES CATEGORIES

insert into users_courses (
id,
user_id,
course_id,
status_course 
)
values (
'1cd45b82-4261-45d3-96ea-f90721fb2b4e',
'4b334b2a-ab08-4871-96c0-985fa776ce45',
'688ceb60-1249-4b8e-ac41-0ff3ed175289',
'Advance 45 %'
),(
'00ac002d-9c2e-411a-875b-d4eae2a9a498',
'08a38ad9-7d9f-48de-8b1a-002891876e46',
'e2b1e827-245c-4cb5-a206-8645de1c3985',
'Complete'
),(
'a71242e5-fc2d-45d2-94a9-85af6a1b4092',
'08a38ad9-7d9f-48de-8b1a-002891876e46',
'a532f5f0-a896-40e1-a207-1311408363cf',
'Advance 56 %'
);


--------------------------------------------SQL CODE--------------------------------------
select * from courses;
select title,description,level,teacher from  courses;
select * from courses as c;

update courses
set duration=96
where id='a532f5f0-a896-40e1-a207-1311408363cf';

select * from courses;

select * from course_videos;

delete from course_videos where id='4a9e59d0-a25f-4bb8-bbd8-566423120a39';
select * from course_videos;

select * from courses as c inner join courses_categories as cc on cc.course_id =c.id;

select c.id, c.title, c.description, cv.id, cv.title, cv.url from courses as c inner join course_videos as cv on cv.course_id =c.id;

select * from courses as c inner join users_courses as uc on uc.course_id =c.id;
