CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- TABLES CREATE

CREATE TABLE IF NOT EXISTS "Users" (
  id VARCHAR(50) PRIMARY KEY,
  role VARCHAR(10),
  username VARCHAR(20),
  "firstName" VARCHAR(50),
  "lastName" VARCHAR(50),
  hobbies VARCHAR(200),
  "lastEducation" VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS "UserSkills" (
  user_id VARCHAR(50),
  skill_id uuid,
  seniority VARCHAR(20),
  PRIMARY KEY (user_id, skill_id)
);

CREATE TABLE IF NOT EXISTS "Skills" (
  id uuid DEFAULT uuid_generate_v4() PRIMARY KEY,
  name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS "Feedback" (
  id uuid DEFAULT uuid_generate_v4() PRIMARY KEY,
  type VARCHAR(10),
  "userId" VARCHAR(50),
  "jobId" uuid,
  content VARCHAR(200)
);

CREATE TABLE IF NOT EXISTS "UserJobs" (
  user_id VARCHAR(50),
  job_id uuid,
  PRIMARY KEY (user_id, job_id)
);

CREATE TABLE IF NOT EXISTS "Jobs" (
  id uuid DEFAULT uuid_generate_v4() PRIMARY KEY,
  description VARCHAR(200),
  "applicantsCount" INTEGER,
  "companyId" uuid
);

CREATE TABLE IF NOT EXISTS "JobBenefits" (
  job_id uuid,
  benefit_id uuid,
  PRIMARY KEY (job_id, benefit_id)
);

CREATE TABLE IF NOT EXISTS "JobSkills" (
  job_id uuid,
  skill_id uuid,
  PRIMARY KEY (job_id, skill_id)
);

CREATE TABLE IF NOT EXISTS "Benefits" (
  id uuid DEFAULT uuid_generate_v4() PRIMARY KEY,
  description VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS "Companies" (
  id uuid DEFAULT uuid_generate_v4() PRIMARY KEY,
  name VARCHAR(50),
  location VARCHAR(100)
);

ALTER TABLE "UserSkills" ADD FOREIGN KEY (user_id) REFERENCES "Users" (id);

ALTER TABLE "UserSkills" ADD FOREIGN KEY (skill_id) REFERENCES "Skills" (id);

ALTER TABLE "Feedback" ADD FOREIGN KEY ("userId") REFERENCES "Users" (id);

ALTER TABLE "Feedback" ADD FOREIGN KEY ("jobId") REFERENCES "Jobs" (id);

ALTER TABLE "UserJobs" ADD FOREIGN KEY (user_id) REFERENCES "Users" (id);

ALTER TABLE "UserJobs" ADD FOREIGN KEY (job_id) REFERENCES "Jobs" (id);

ALTER TABLE "Jobs" ADD FOREIGN KEY ("companyId") REFERENCES "Companies" (id);

ALTER TABLE "JobBenefits" ADD FOREIGN KEY (job_id) REFERENCES "Jobs" (id);

ALTER TABLE "JobBenefits" ADD FOREIGN KEY (benefit_id) REFERENCES "Benefits" (id);

ALTER TABLE "JobSkills" ADD FOREIGN KEY (job_id) REFERENCES "Jobs" (id);

ALTER TABLE "JobSkills" ADD FOREIGN KEY (skill_id) REFERENCES "Skills" (id);

-- INSERTS

-- insert into "Users" (id, role, username, "firstName", "lastName", hobbies, "lastEducation") values ('1', 'Recruiter', 'igass0', 'Irina', 'Gass', 'cooking', 'High School');
-- insert into "Users" (id, role, username, "firstName", "lastName", hobbies, "lastEducation") values ('2', 'Applicant', 'wstory1', 'Winfield', 'Story', 'painting', 'High School');
-- insert into "Users" (id, role, username, "firstName", "lastName", hobbies, "lastEducation") values ('3', 'Recruiter', 'cboughtwood2', 'Ches', 'Boughtwood', 'reading', 'Master''s Degree');
-- insert into "Users" (id, role, username, "firstName", "lastName", hobbies, "lastEducation") values ('4', 'Recruiter', 'ydugall3', 'Ynez', 'Dugall', 'cooking', 'PhD');
-- insert into "Users" (id, role, username, "firstName", "lastName", hobbies, "lastEducation") values ('5', 'Recruiter', 'kthompsett4', 'Kele', 'Thompsett', 'painting', 'High School');
-- insert into "Users" (id, role, username,  "firstName", "lastName", hobbies, "lastEducation") values ('6', 'Recruiter', 'lfarn5', 'Lezley', 'Farn', 'gardening', 'Master''s Degree');
-- insert into "Users" (id, role, username,  "firstName", "lastName", hobbies, "lastEducation") values ('7', 'Applicant', 'rgibling6', 'Rriocard', 'Gibling', 'cooking', 'High School');
-- insert into "Users" (id, role, username,  "firstName", "lastName", hobbies, "lastEducation") values ('8', 'Applicant', 'aepsly7', 'Ashlin', 'Epsly', 'painting', 'High School');
-- insert into "Users" (id, role, username,  "firstName", "lastName", hobbies, "lastEducation") values ('9', 'Recruiter', 'hfoister8', 'Hagan', 'Foister', 'photography', 'Master''s Degree');
-- insert into "Users" (id, role, username,  "firstName", "lastName", hobbies, "lastEducation") values ('10', 'Recruiter', 'galmon9', 'Gilberte', 'Almon', 'photography', 'PhD');


-- insert into "Skills" (name) values ('Java');
-- insert into "Skills" (name) values ('CSS');
-- insert into "Skills" (name) values ('Ruby');
-- insert into "Skills" (name) values ('SQL');
-- insert into "Skills" (name) values ('JavaScript');
-- insert into "Skills" (name) values ('Python');
-- insert into "Skills" (name) values ('Swift');
-- insert into "Skills" (name) values ('Dart');
-- insert into "Skills" (name) values ('C++');
-- insert into "Skills" (name) values ('R');

-- insert into "Benefits" (description) values ('health insurance');
-- insert into "Benefits" (description) values ('paid time off');
-- insert into "Benefits" (description) values ('employee discounts');
-- insert into "Benefits" (description) values ('professional development opportunities');
-- insert into "Benefits" (description) values ('retirement plan');

-- insert into "Companies" (name, location) values ('Leexo', 'Room 1565');
-- insert into "Companies" (name, location) values ('Jaxbean', 'Apt 1290');
-- insert into "Companies" (name, location) values ('Realbuzz', 'Room 706');
-- insert into "Companies" (name, location) values ('Skiba', 'Apt 790');
-- insert into "Companies" (name, location) values ('Centimia', '17th Floor');
-- insert into "Companies" (name, location) values ('Meemm', 'PO Box 69662');
-- insert into "Companies" (name, location) values ('Lazz', '16th Floor');
-- insert into "Companies" (name, location) values ('Twitterwire', 'Apt 553');
-- insert into "Companies" (name, location) values ('Tanoodle', 'Suite 26');
-- insert into "Companies" (name, location) values ('Janyx', 'PO Box 73208');

-- insert into "Jobs" (description, "applicantsCount", "companyId") values ('Network Administrator', 134, 'b253b761-8121-4b45-b5f6-959cd45f02bb');
-- insert into "Jobs" (description, "applicantsCount", "companyId") values ('IT Project Manager', 22, '8337be06-e8d3-4b8d-bf8a-5c01a546cc25');
-- insert into "Jobs" (description, "applicantsCount", "companyId") values ('Network Administrator', 19, '085c70ea-ec52-40ee-892e-199e2e630c46');
-- insert into "Jobs" (description, "applicantsCount", "companyId") values ('Software Engineer', 149, 'cad34b64-d07d-42e6-8482-b876f21322ac');
-- insert into "Jobs" (description, "applicantsCount", "companyId") values ('Cybersecurity Specialist', 142, '515dae54-4ce3-4406-88ec-973ace239f18');
-- insert into "Jobs" (description, "applicantsCount", "companyId") values ('IT Project Manager', 116, '79c082fd-aae0-48bd-b50b-60bf1bd30ef1');
-- insert into "Jobs" (description, "applicantsCount", "companyId") values ('Network Administrator', 91, '48e172b2-ea30-4ff5-b8d3-d77a4b851fff');
-- insert into "Jobs" (description, "applicantsCount", "companyId") values ('Data Analyst', 76, 'fc6a8ce1-e3b8-42aa-bb45-75953e66dda3');
-- insert into "Jobs" (description, "applicantsCount", "companyId") values ('Cybersecurity Specialist', 3, 'db79a856-aa6a-46e5-830f-357ea6002d9f');
-- insert into "Jobs" (description, "applicantsCount", "companyId") values ('Software Engineer', 109, 'b7e16d44-e724-4faf-ba6c-037733b03259');
-- insert into "Jobs" (description, "applicantsCount", "companyId") values ('Network Administrator', 96, 'b253b761-8121-4b45-b5f6-959cd45f02bb');
-- insert into "Jobs" (description, "applicantsCount", "companyId") values ('Cybersecurity Specialist', 58, '8337be06-e8d3-4b8d-bf8a-5c01a546cc25');
-- insert into "Jobs" (description, "applicantsCount", "companyId") values ('Network Administrator', 57, '085c70ea-ec52-40ee-892e-199e2e630c46');
-- insert into "Jobs" (description, "applicantsCount", "companyId") values ('Software Engineer', 134, 'cad34b64-d07d-42e6-8482-b876f21322ac');
-- insert into "Jobs" (description, "applicantsCount", "companyId") values ('Cybersecurity Specialist', 18, '515dae54-4ce3-4406-88ec-973ace239f18');
-- insert into "Jobs" (description, "applicantsCount", "companyId") values ('Cybersecurity Specialist', 52, '79c082fd-aae0-48bd-b50b-60bf1bd30ef1');
-- insert into "Jobs" (description, "applicantsCount", "companyId") values ('Cybersecurity Specialist', 48, '48e172b2-ea30-4ff5-b8d3-d77a4b851fff');
-- insert into "Jobs" (description, "applicantsCount", "companyId") values ('Cybersecurity Specialist', 66, 'fc6a8ce1-e3b8-42aa-bb45-75953e66dda3');
-- insert into "Jobs" (description, "applicantsCount", "companyId") values ('Network Administrator', 76, 'db79a856-aa6a-46e5-830f-357ea6002d9f');
-- insert into "Jobs" (description, "applicantsCount", "companyId") values ('IT Project Manager', 89, 'b7e16d44-e724-4faf-ba6c-037733b03259');
-- insert into "Jobs" (description, "applicantsCount", "companyId") values ('Cybersecurity Specialist', 133, 'b253b761-8121-4b45-b5f6-959cd45f02bb');
-- insert into "Jobs" (description, "applicantsCount", "companyId") values ('Software Engineer', 111, '8337be06-e8d3-4b8d-bf8a-5c01a546cc25');
-- insert into "Jobs" (description, "applicantsCount", "companyId") values ('Software Engineer', 21, '085c70ea-ec52-40ee-892e-199e2e630c46');
-- insert into "Jobs" (description, "applicantsCount", "companyId") values ('Software Engineer', 127, 'cad34b64-d07d-42e6-8482-b876f21322ac');
-- insert into "Jobs" (description, "applicantsCount", "companyId") values ('IT Project Manager', 111, '515dae54-4ce3-4406-88ec-973ace239f18');
-- insert into "Jobs" (description, "applicantsCount", "companyId") values ('Cybersecurity Specialist', 35, '79c082fd-aae0-48bd-b50b-60bf1bd30ef1');
-- insert into "Jobs" (description, "applicantsCount", "companyId") values ('Data Analyst', 112, '48e172b2-ea30-4ff5-b8d3-d77a4b851fff');
-- insert into "Jobs" (description, "applicantsCount", "companyId") values ('Cybersecurity Specialist', 125, 'fc6a8ce1-e3b8-42aa-bb45-75953e66dda3');
-- insert into "Jobs" (description, "applicantsCount", "companyId") values ('Network Administrator', 27, 'db79a856-aa6a-46e5-830f-357ea6002d9f');
-- insert into "Jobs" (description, "applicantsCount", "companyId") values ('IT Project Manager', 30, 'b7e16d44-e724-4faf-ba6c-037733b03259');
-- insert into "Jobs" (description, "applicantsCount", "companyId") values ('Cybersecurity Specialist', 55, 'b253b761-8121-4b45-b5f6-959cd45f02bb');
-- insert into "Jobs" (description, "applicantsCount", "companyId") values ('IT Project Manager', 96, '8337be06-e8d3-4b8d-bf8a-5c01a546cc25');
-- insert into "Jobs" (description, "applicantsCount", "companyId") values ('IT Project Manager', 137, '085c70ea-ec52-40ee-892e-199e2e630c46');
-- insert into "Jobs" (description, "applicantsCount", "companyId") values ('Software Engineer', 121, 'cad34b64-d07d-42e6-8482-b876f21322ac');
-- insert into "Jobs" (description, "applicantsCount", "companyId") values ('IT Project Manager', 40, '515dae54-4ce3-4406-88ec-973ace239f18');
-- insert into "Jobs" (description, "applicantsCount", "companyId") values ('Network Administrator', 128, '79c082fd-aae0-48bd-b50b-60bf1bd30ef1');
-- insert into "Jobs" (description, "applicantsCount", "companyId") values ('Cybersecurity Specialist', 17, '48e172b2-ea30-4ff5-b8d3-d77a4b851fff');
-- insert into "Jobs" (description, "applicantsCount", "companyId") values ('Network Administrator', 36, 'fc6a8ce1-e3b8-42aa-bb45-75953e66dda3');
-- insert into "Jobs" (description, "applicantsCount", "companyId") values ('Software Engineer', 46, 'db79a856-aa6a-46e5-830f-357ea6002d9f');
-- insert into "Jobs" (description, "applicantsCount", "companyId") values ('Cybersecurity Specialist', 38, 'b7e16d44-e724-4faf-ba6c-037733b03259');
-- insert into "Jobs" (description, "applicantsCount", "companyId") values ('Network Administrator', 134, 'b253b761-8121-4b45-b5f6-959cd45f02bb');
-- insert into "Jobs" (description, "applicantsCount", "companyId") values ('Data Analyst', 127, '8337be06-e8d3-4b8d-bf8a-5c01a546cc25');
-- insert into "Jobs" (description, "applicantsCount", "companyId") values ('IT Project Manager', 82, '085c70ea-ec52-40ee-892e-199e2e630c46');
-- insert into "Jobs" (description, "applicantsCount", "companyId") values ('Cybersecurity Specialist', 101, 'cad34b64-d07d-42e6-8482-b876f21322ac');
-- insert into "Jobs" (description, "applicantsCount", "companyId") values ('Cybersecurity Specialist', 16, '515dae54-4ce3-4406-88ec-973ace239f18');
-- insert into "Jobs" (description, "applicantsCount", "companyId") values ('Software Engineer', 51, '79c082fd-aae0-48bd-b50b-60bf1bd30ef1');
-- insert into "Jobs" (description, "applicantsCount", "companyId") values ('Cybersecurity Specialist', 145, '48e172b2-ea30-4ff5-b8d3-d77a4b851fff');
-- insert into "Jobs" (description, "applicantsCount", "companyId") values ('Data Analyst', 58, 'fc6a8ce1-e3b8-42aa-bb45-75953e66dda3');
-- insert into "Jobs" (description, "applicantsCount", "companyId") values ('Data Analyst', 119, 'db79a856-aa6a-46e5-830f-357ea6002d9f');
-- insert into "Jobs" (description, "applicantsCount", "companyId") values ('Network Administrator', 69, 'b7e16d44-e724-4faf-ba6c-037733b03259');

-- ------------------------- DONE TILL HERE --------------------------

-- insert into "UserJobs" (user_id, job_id) values (8, 10);
-- insert into "UserJobs" (user_id, job_id) values (6, 35);
-- insert into "UserJobs" (user_id, job_id) values (4, 42);
-- insert into "UserJobs" (user_id, job_id) values (10, 48);
-- insert into "UserJobs" (user_id, job_id) values (6, 30);
-- insert into "UserJobs" (user_id, job_id) values (1, 36);
-- insert into "UserJobs" (user_id, job_id) values (1, 45);
-- insert into "UserJobs" (user_id, job_id) values (5, 17);
-- insert into "UserJobs" (user_id, job_id) values (1, 20);
-- insert into "UserJobs" (user_id, job_id) values (9, 49);
-- insert into "UserJobs" (user_id, job_id) values (6, 4);
-- insert into "UserJobs" (user_id, job_id) values (10, 49);
-- insert into "UserJobs" (user_id, job_id) values (7, 20);
-- insert into "UserJobs" (user_id, job_id) values (5, 8);
-- insert into "UserJobs" (user_id, job_id) values (6, 39);
-- insert into "UserJobs" (user_id, job_id) values (1, 27);
-- insert into "UserJobs" (user_id, job_id) values (6, 14);
-- insert into "UserJobs" (user_id, job_id) values (5, 39);
-- insert into "UserJobs" (user_id, job_id) values (10, 15);
-- insert into "UserJobs" (user_id, job_id) values (2, 43);
-- insert into "UserJobs" (user_id, job_id) values (8, 30);
-- insert into "UserJobs" (user_id, job_id) values (6, 2);
-- insert into "UserJobs" (user_id, job_id) values (3, 45);
-- insert into "UserJobs" (user_id, job_id) values (8, 21);
-- insert into "UserJobs" (user_id, job_id) values (9, 42);
-- insert into "UserJobs" (user_id, job_id) values (9, 19);
-- insert into "UserJobs" (user_id, job_id) values (9, 24);
-- insert into "UserJobs" (user_id, job_id) values (2, 13);
-- insert into "UserJobs" (user_id, job_id) values (9, 13);
-- insert into "UserJobs" (user_id, job_id) values (5, 2);
-- insert into "UserJobs" (user_id, job_id) values (9, 30);
-- insert into "UserJobs" (user_id, job_id) values (8, 8);
-- insert into "UserJobs" (user_id, job_id) values (1, 35);
-- insert into "UserJobs" (user_id, job_id) values (10, 30);
-- insert into "UserJobs" (user_id, job_id) values (4, 44);
-- insert into "UserJobs" (user_id, job_id) values (7, 48);
-- insert into "UserJobs" (user_id, job_id) values (1, 23);
-- insert into "UserJobs" (user_id, job_id) values (7, 17);
-- insert into "UserJobs" (user_id, job_id) values (10, 12);
-- insert into "UserJobs" (user_id, job_id) values (3, 48);
-- insert into "UserJobs" (user_id, job_id) values (4, 5);
-- insert into "UserJobs" (user_id, job_id) values (5, 5);
-- insert into "UserJobs" (user_id, job_id) values (10, 46);
-- insert into "UserJobs" (user_id, job_id) values (7, 21);
-- insert into "UserJobs" (user_id, job_id) values (6, 34);
-- insert into "UserJobs" (user_id, job_id) values (9, 21);
-- insert into "UserJobs" (user_id, job_id) values (4, 41);

-- insert into "JobBenefits" (job_id, benefit_id) values (26, 2);
-- insert into "JobBenefits" (job_id, benefit_id) values (9, 2);
-- insert into "JobBenefits" (job_id, benefit_id) values (36, 3);
-- insert into "JobBenefits" (job_id, benefit_id) values (40, 2);
-- insert into "JobBenefits" (job_id, benefit_id) values (6, 3);
-- insert into "JobBenefits" (job_id, benefit_id) values (7, 4);
-- insert into "JobBenefits" (job_id, benefit_id) values (19, 5);
-- insert into "JobBenefits" (job_id, benefit_id) values (23, 5);
-- insert into "JobBenefits" (job_id, benefit_id) values (34, 2);
-- insert into "JobBenefits" (job_id, benefit_id) values (46, 1);
-- insert into "JobBenefits" (job_id, benefit_id) values (37, 4);
-- insert into "JobBenefits" (job_id, benefit_id) values (12, 4);
-- insert into "JobBenefits" (job_id, benefit_id) values (22, 3);
-- insert into "JobBenefits" (job_id, benefit_id) values (14, 4);
-- insert into "JobBenefits" (job_id, benefit_id) values (10, 1);
-- insert into "JobBenefits" (job_id, benefit_id) values (31, 2);
-- insert into "JobBenefits" (job_id, benefit_id) values (24, 4);
-- insert into "JobBenefits" (job_id, benefit_id) values (21, 1);
-- insert into "JobBenefits" (job_id, benefit_id) values (40, 4);
-- insert into "JobBenefits" (job_id, benefit_id) values (20, 4);
-- insert into "JobBenefits" (job_id, benefit_id) values (39, 2);
-- insert into "JobBenefits" (job_id, benefit_id) values (15, 5);
-- insert into "JobBenefits" (job_id, benefit_id) values (12, 1);
-- insert into "JobBenefits" (job_id, benefit_id) values (29, 4);
-- insert into "JobBenefits" (job_id, benefit_id) values (13, 1);
-- insert into "JobBenefits" (job_id, benefit_id) values (49, 2);
-- insert into "JobBenefits" (job_id, benefit_id) values (26, 5);
-- insert into "JobBenefits" (job_id, benefit_id) values (20, 3);
-- insert into "JobBenefits" (job_id, benefit_id) values (35, 5);
-- insert into "JobBenefits" (job_id, benefit_id) values (46, 2);
-- insert into "JobBenefits" (job_id, benefit_id) values (38, 3);
-- insert into "JobBenefits" (job_id, benefit_id) values (43, 1);
-- insert into "JobBenefits" (job_id, benefit_id) values (31, 1);
-- insert into "JobBenefits" (job_id, benefit_id) values (33, 2);
-- insert into "JobBenefits" (job_id, benefit_id) values (2, 1);
-- insert into "JobBenefits" (job_id, benefit_id) values (47, 3);
-- insert into "JobBenefits" (job_id, benefit_id) values (2, 2);
-- insert into "JobBenefits" (job_id, benefit_id) values (38, 4);
-- insert into "JobBenefits" (job_id, benefit_id) values (15, 1);
-- insert into "JobBenefits" (job_id, benefit_id) values (8, 1);
-- insert into "JobBenefits" (job_id, benefit_id) values (14, 3);
-- insert into "JobBenefits" (job_id, benefit_id) values (12, 2);
-- insert into "JobBenefits" (job_id, benefit_id) values (16, 1);
-- insert into "JobBenefits" (job_id, benefit_id) values (49, 5);
-- insert into "JobBenefits" (job_id, benefit_id) values (45, 5);

-- insert into "JobSkills" (job_id, skill_id) values (39, 5);
-- insert into "JobSkills" (job_id, skill_id) values (14, 5);
-- insert into "JobSkills" (job_id, skill_id) values (32, 8);
-- insert into "JobSkills" (job_id, skill_id) values (4, 10);
-- insert into "JobSkills" (job_id, skill_id) values (45, 7);
-- insert into "JobSkills" (job_id, skill_id) values (14, 2);
-- insert into "JobSkills" (job_id, skill_id) values (35, 7);
-- insert into "JobSkills" (job_id, skill_id) values (35, 1);
-- insert into "JobSkills" (job_id, skill_id) values (16, 6);
-- insert into "JobSkills" (job_id, skill_id) values (13, 5);
-- insert into "JobSkills" (job_id, skill_id) values (21, 8);
-- insert into "JobSkills" (job_id, skill_id) values (23, 3);
-- insert into "JobSkills" (job_id, skill_id) values (41, 10);
-- insert into "JobSkills" (job_id, skill_id) values (34, 6);
-- insert into "JobSkills" (job_id, skill_id) values (12, 6);
-- insert into "JobSkills" (job_id, skill_id) values (38, 10);
-- insert into "JobSkills" (job_id, skill_id) values (42, 2);
-- insert into "JobSkills" (job_id, skill_id) values (17, 9);
-- insert into "JobSkills" (job_id, skill_id) values (25, 9);
-- insert into "JobSkills" (job_id, skill_id) values (7, 8);
-- insert into "JobSkills" (job_id, skill_id) values (22, 1);
-- insert into "JobSkills" (job_id, skill_id) values (31, 10);
-- insert into "JobSkills" (job_id, skill_id) values (26, 3);
-- insert into "JobSkills" (job_id, skill_id) values (35, 3);
-- insert into "JobSkills" (job_id, skill_id) values (22, 9);
-- insert into "JobSkills" (job_id, skill_id) values (3, 6);
-- insert into "JobSkills" (job_id, skill_id) values (19, 7);
-- insert into "JobSkills" (job_id, skill_id) values (26, 8);
-- insert into "JobSkills" (job_id, skill_id) values (9, 7);
-- insert into "JobSkills" (job_id, skill_id) values (44, 9);
-- insert into "JobSkills" (job_id, skill_id) values (10, 1);
-- insert into "JobSkills" (job_id, skill_id) values (2, 2);
-- insert into "JobSkills" (job_id, skill_id) values (4, 7);
-- insert into "JobSkills" (job_id, skill_id) values (49, 4);
-- insert into "JobSkills" (job_id, skill_id) values (29, 1);
-- insert into "JobSkills" (job_id, skill_id) values (30, 7);
-- insert into "JobSkills" (job_id, skill_id) values (16, 1);
-- insert into "JobSkills" (job_id, skill_id) values (29, 7);
-- insert into "JobSkills" (job_id, skill_id) values (14, 1);
-- insert into "JobSkills" (job_id, skill_id) values (48, 8);
-- insert into "JobSkills" (job_id, skill_id) values (30, 8);
-- insert into "JobSkills" (job_id, skill_id) values (38, 9);
-- insert into "JobSkills" (job_id, skill_id) values (47, 9);
-- insert into "JobSkills" (job_id, skill_id) values (49, 2);
-- insert into "JobSkills" (job_id, skill_id) values (46, 7);
-- insert into "JobSkills" (job_id, skill_id) values (6, 5);

-- insert into "UserSkills" (user_id, skill_id, seniority) values (1, 1, 'Intermediate');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (2, 6, 'Senior');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (10, 1, 'Junior');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (4, 5, 'Expert');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (2, 3, 'Senior');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (7, 10, 'Senior');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (4, 1, 'Intermediate');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (10, 2, 'Expert');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (1, 10, 'Intermediate');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (5, 5, 'Senior');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (10, 9, 'Junior');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (10, 8, 'Senior');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (3, 6, 'Senior');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (2, 1, 'Expert');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (7, 2, 'Junior');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (5, 10, 'Expert');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (9, 9, 'Senior');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (5, 1, 'Senior');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (6, 9, 'Junior');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (8, 2, 'Expert');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (1, 7, 'Intermediate');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (8, 7, 'Junior');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (10, 10, 'Expert');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (8, 3, 'Senior');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (6, 6, 'Intermediate');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (8, 10, 'Intermediate');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (10, 5, 'Senior');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (7, 1, 'Expert');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (8, 9, 'Junior');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (9, 7, 'Intermediate');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (7, 5, 'Senior');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (4, 6, 'Junior');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (2, 8, 'Intermediate');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (9, 8, 'Junior');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (4, 3, 'Expert');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (2, 5, 'Expert');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (4, 9, 'Intermediate');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (3, 5, 'Junior');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (6, 1, 'Junior');
