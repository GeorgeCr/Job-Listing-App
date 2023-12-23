-- TABLES CREATE

CREATE TABLE IF NOT EXISTS "Users" (
  id SERIAL PRIMARY KEY,
  role VARCHAR(10),
  username VARCHAR(20),
  "passwordHash" VARCHAR(60),
  "firstName" VARCHAR(50),
  "lastName" VARCHAR(50),
  hobbies VARCHAR(200),
  "lastEducation" VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS "UserSkills" (
  user_id INTEGER,
  skill_id INTEGER,
  seniority VARCHAR(20),
  PRIMARY KEY (user_id, skill_id)
);

CREATE TABLE IF NOT EXISTS "Skills" (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS "Feedback" (
  id SERIAL PRIMARY KEY,
  type VARCHAR(10),
  "userId" INTEGER,
  "jobId" INTEGER,
  content VARCHAR(200)
);

CREATE TABLE IF NOT EXISTS "UserJobs" (
  user_id INTEGER,
  job_id INTEGER,
  PRIMARY KEY (user_id, job_id)
);

CREATE TABLE IF NOT EXISTS "Jobs" (
  id SERIAL PRIMARY KEY,
  description VARCHAR(200),
  "applicantsCount" INTEGER,
  "companyId" INTEGER
);

CREATE TABLE IF NOT EXISTS "JobBenefits" (
  job_id INTEGER,
  benefit_id INTEGER,
  PRIMARY KEY (job_id, benefit_id)
);

CREATE TABLE IF NOT EXISTS "JobSkills" (
  job_id INTEGER,
  skill_id INTEGER,
  PRIMARY KEY (job_id, skill_id)
);

CREATE TABLE IF NOT EXISTS "Benefits" (
  id SERIAL PRIMARY KEY,
  description VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS "Companies" (
  id SERIAL PRIMARY KEY,
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

insert into "Users" (id, role, username, "passwordHash", "firstName", "lastName", hobbies, "lastEducation") values (1, 'Recruiter', 'igass0', '$2a$04$5EbcNE0qoAtMQWQdpSmcVOoAPncYCqUDU4xQTJyC7tzq770l2i6N6', 'Irina', 'Gass', 'cooking', 'High School');
insert into "Users" (id, role, username, "passwordHash", "firstName", "lastName", hobbies, "lastEducation") values (2, 'Applicant', 'wstory1', '$2a$04$orMejI2aK8scFn8deNJC/Ob4HUtxAi6bLaUXpU4.5LrHhEvnp/xxu', 'Winfield', 'Story', 'painting', 'High School');
insert into "Users" (id, role, username, "passwordHash", "firstName", "lastName", hobbies, "lastEducation") values (3, 'Recruiter', 'cboughtwood2', '$2a$04$YOCPbkBntSaxZUTBb.ZZU.IvtC6OlaD5f5qarq8SJJW7Bd4GLPmoe', 'Ches', 'Boughtwood', 'reading', 'Master''s Degree');
insert into "Users" (id, role, username, "passwordHash", "firstName", "lastName", hobbies, "lastEducation") values (4, 'Recruiter', 'ydugall3', '$2a$04$aiL2Aruf2dunHkP9BPuYb.kjOltTcEv8gtY3iQ7zWyziAXRUWrB8K', 'Ynez', 'Dugall', 'cooking', 'PhD');
insert into "Users" (id, role, username, "passwordHash", "firstName", "lastName", hobbies, "lastEducation") values (5, 'Recruiter', 'kthompsett4', '$2a$04$vimmHYyzHborYRw6XKVg1OG7wnLXv5oc/lDSzoJ8P9pM/PjnHKJcK', 'Kele', 'Thompsett', 'painting', 'High School');
insert into "Users" (id, role, username, "passwordHash", "firstName", "lastName", hobbies, "lastEducation") values (6, 'Recruiter', 'lfarn5', '$2a$04$mG2rURVMrpA1u1VFAy7RAuVIqZgucE.crj1W3NIYd62032vpl0nwq', 'Lezley', 'Farn', 'gardening', 'Master''s Degree');
insert into "Users" (id, role, username, "passwordHash", "firstName", "lastName", hobbies, "lastEducation") values (7, 'Applicant', 'rgibling6', '$2a$04$RUIeQiCiE1/s8L2FFAUnu.j7tBkPYyf8Y/9Htf5uroXI52b2kDxoO', 'Rriocard', 'Gibling', 'cooking', 'High School');
insert into "Users" (id, role, username, "passwordHash", "firstName", "lastName", hobbies, "lastEducation") values (8, 'Applicant', 'aepsly7', '$2a$04$WQ/sFOH.KL9tyfFpV3ATzOulE0X.oJJ8pMeA4Uh0rB/3Wco3Pms8C', 'Ashlin', 'Epsly', 'painting', 'High School');
insert into "Users" (id, role, username, "passwordHash", "firstName", "lastName", hobbies, "lastEducation") values (9, 'Recruiter', 'hfoister8', '$2a$04$PP/YtvZnTwn9RO2XFWRvUeaK1ZnTOAwnRDiexusLKcWY5SEm8C5mK', 'Hagan', 'Foister', 'photography', 'Master''s Degree');
insert into "Users" (id, role, username, "passwordHash", "firstName", "lastName", hobbies, "lastEducation") values (10, 'Recruiter', 'galmon9', '$2a$04$BsBhH3Gzf8j1nO0WCgbezuj6D/nJek0Zq1yLDomrwtG1o3LP3tJx2', 'Gilberte', 'Almon', 'photography', 'PhD');

insert into "Skills" (id, name) values (1, 'Java');
insert into "Skills" (id, name) values (2, 'CSS');
insert into "Skills" (id, name) values (3, 'Ruby');
insert into "Skills" (id, name) values (4, 'SQL');
insert into "Skills" (id, name) values (5, 'JavaScript');
insert into "Skills" (id, name) values (6, 'Python');
insert into "Skills" (id, name) values (7, 'Swift');
insert into "Skills" (id, name) values (8, 'Dart');
insert into "Skills" (id, name) values (9, 'C++');
insert into "Skills" (id, name) values (10, 'R');

insert into "Benefits" (id, description) values (1, 'health insurance');
insert into "Benefits" (id, description) values (2, 'paid time off');
insert into "Benefits" (id, description) values (3, 'employee discounts');
insert into "Benefits" (id, description) values (4, 'professional development opportunities');
insert into "Benefits" (id, description) values (5, 'retirement plan');

insert into "Companies" (id, name, location) values (1, 'Leexo', 'Room 1565');
insert into "Companies" (id, name, location) values (2, 'Jaxbean', 'Apt 1290');
insert into "Companies" (id, name, location) values (3, 'Realbuzz', 'Room 706');
insert into "Companies" (id, name, location) values (4, 'Skiba', 'Apt 790');
insert into "Companies" (id, name, location) values (5, 'Centimia', '17th Floor');
insert into "Companies" (id, name, location) values (6, 'Meemm', 'PO Box 69662');
insert into "Companies" (id, name, location) values (7, 'Lazz', '16th Floor');
insert into "Companies" (id, name, location) values (8, 'Twitterwire', 'Apt 553');
insert into "Companies" (id, name, location) values (9, 'Tanoodle', 'Suite 26');
insert into "Companies" (id, name, location) values (10, 'Janyx', 'PO Box 73208');

insert into "Jobs" (id, description, "applicantsCount", "companyId") values (1, 'Network Administrator', 134, 9);
insert into "Jobs" (id, description, "applicantsCount", "companyId") values (2, 'IT Project Manager', 22, 2);
insert into "Jobs" (id, description, "applicantsCount", "companyId") values (3, 'Network Administrator', 19, 9);
insert into "Jobs" (id, description, "applicantsCount", "companyId") values (4, 'Software Engineer', 149, 5);
insert into "Jobs" (id, description, "applicantsCount", "companyId") values (5, 'Cybersecurity Specialist', 142, 4);
insert into "Jobs" (id, description, "applicantsCount", "companyId") values (6, 'IT Project Manager', 116, 8);
insert into "Jobs" (id, description, "applicantsCount", "companyId") values (7, 'Network Administrator', 91, 3);
insert into "Jobs" (id, description, "applicantsCount", "companyId") values (8, 'Data Analyst', 76, 2);
insert into "Jobs" (id, description, "applicantsCount", "companyId") values (9, 'Cybersecurity Specialist', 3, 7);
insert into "Jobs" (id, description, "applicantsCount", "companyId") values (10, 'Software Engineer', 109, 10);
insert into "Jobs" (id, description, "applicantsCount", "companyId") values (11, 'Network Administrator', 96, 8);
insert into "Jobs" (id, description, "applicantsCount", "companyId") values (12, 'Cybersecurity Specialist', 58, 2);
insert into "Jobs" (id, description, "applicantsCount", "companyId") values (13, 'Network Administrator', 57, 8);
insert into "Jobs" (id, description, "applicantsCount", "companyId") values (14, 'Software Engineer', 134, 8);
insert into "Jobs" (id, description, "applicantsCount", "companyId") values (15, 'Cybersecurity Specialist', 18, 5);
insert into "Jobs" (id, description, "applicantsCount", "companyId") values (16, 'Cybersecurity Specialist', 52, 7);
insert into "Jobs" (id, description, "applicantsCount", "companyId") values (17, 'Cybersecurity Specialist', 48, 9);
insert into "Jobs" (id, description, "applicantsCount", "companyId") values (18, 'Cybersecurity Specialist', 66, 9);
insert into "Jobs" (id, description, "applicantsCount", "companyId") values (19, 'Network Administrator', 76, 8);
insert into "Jobs" (id, description, "applicantsCount", "companyId") values (20, 'IT Project Manager', 89, 4);
insert into "Jobs" (id, description, "applicantsCount", "companyId") values (21, 'Cybersecurity Specialist', 133, 7);
insert into "Jobs" (id, description, "applicantsCount", "companyId") values (22, 'Software Engineer', 111, 10);
insert into "Jobs" (id, description, "applicantsCount", "companyId") values (23, 'Software Engineer', 21, 10);
insert into "Jobs" (id, description, "applicantsCount", "companyId") values (24, 'Software Engineer', 127, 7);
insert into "Jobs" (id, description, "applicantsCount", "companyId") values (25, 'IT Project Manager', 111, 2);
insert into "Jobs" (id, description, "applicantsCount", "companyId") values (26, 'Cybersecurity Specialist', 35, 2);
insert into "Jobs" (id, description, "applicantsCount", "companyId") values (27, 'Data Analyst', 112, 8);
insert into "Jobs" (id, description, "applicantsCount", "companyId") values (28, 'Cybersecurity Specialist', 125, 5);
insert into "Jobs" (id, description, "applicantsCount", "companyId") values (29, 'Network Administrator', 27, 2);
insert into "Jobs" (id, description, "applicantsCount", "companyId") values (30, 'IT Project Manager', 30, 3);
insert into "Jobs" (id, description, "applicantsCount", "companyId") values (31, 'Cybersecurity Specialist', 55, 1);
insert into "Jobs" (id, description, "applicantsCount", "companyId") values (32, 'IT Project Manager', 96, 6);
insert into "Jobs" (id, description, "applicantsCount", "companyId") values (33, 'IT Project Manager', 137, 5);
insert into "Jobs" (id, description, "applicantsCount", "companyId") values (34, 'Software Engineer', 121, 10);
insert into "Jobs" (id, description, "applicantsCount", "companyId") values (35, 'IT Project Manager', 40, 9);
insert into "Jobs" (id, description, "applicantsCount", "companyId") values (36, 'Network Administrator', 128, 1);
insert into "Jobs" (id, description, "applicantsCount", "companyId") values (37, 'Cybersecurity Specialist', 17, 2);
insert into "Jobs" (id, description, "applicantsCount", "companyId") values (38, 'Network Administrator', 36, 4);
insert into "Jobs" (id, description, "applicantsCount", "companyId") values (39, 'Software Engineer', 46, 6);
insert into "Jobs" (id, description, "applicantsCount", "companyId") values (40, 'Cybersecurity Specialist', 38, 7);
insert into "Jobs" (id, description, "applicantsCount", "companyId") values (41, 'Network Administrator', 134, 3);
insert into "Jobs" (id, description, "applicantsCount", "companyId") values (42, 'Data Analyst', 127, 5);
insert into "Jobs" (id, description, "applicantsCount", "companyId") values (43, 'IT Project Manager', 82, 6);
insert into "Jobs" (id, description, "applicantsCount", "companyId") values (44, 'Cybersecurity Specialist', 101, 6);
insert into "Jobs" (id, description, "applicantsCount", "companyId") values (45, 'Cybersecurity Specialist', 16, 5);
insert into "Jobs" (id, description, "applicantsCount", "companyId") values (46, 'Software Engineer', 51, 10);
insert into "Jobs" (id, description, "applicantsCount", "companyId") values (47, 'Cybersecurity Specialist', 145, 5);
insert into "Jobs" (id, description, "applicantsCount", "companyId") values (48, 'Data Analyst', 58, 6);
insert into "Jobs" (id, description, "applicantsCount", "companyId") values (49, 'Data Analyst', 119, 7);
insert into "Jobs" (id, description, "applicantsCount", "companyId") values (50, 'Network Administrator', 69, 7);

insert into "UserJobs" (user_id, job_id) values (8, 10);
insert into "UserJobs" (user_id, job_id) values (6, 35);
insert into "UserJobs" (user_id, job_id) values (4, 42);
insert into "UserJobs" (user_id, job_id) values (10, 48);
insert into "UserJobs" (user_id, job_id) values (6, 30);
insert into "UserJobs" (user_id, job_id) values (1, 36);
insert into "UserJobs" (user_id, job_id) values (1, 45);
insert into "UserJobs" (user_id, job_id) values (5, 17);
insert into "UserJobs" (user_id, job_id) values (1, 20);
insert into "UserJobs" (user_id, job_id) values (9, 49);
insert into "UserJobs" (user_id, job_id) values (6, 4);
insert into "UserJobs" (user_id, job_id) values (10, 49);
insert into "UserJobs" (user_id, job_id) values (7, 20);
insert into "UserJobs" (user_id, job_id) values (5, 8);
insert into "UserJobs" (user_id, job_id) values (6, 39);
insert into "UserJobs" (user_id, job_id) values (1, 27);
insert into "UserJobs" (user_id, job_id) values (6, 14);
insert into "UserJobs" (user_id, job_id) values (5, 39);
insert into "UserJobs" (user_id, job_id) values (10, 15);
insert into "UserJobs" (user_id, job_id) values (2, 43);
insert into "UserJobs" (user_id, job_id) values (8, 30);
insert into "UserJobs" (user_id, job_id) values (6, 2);
insert into "UserJobs" (user_id, job_id) values (3, 45);
insert into "UserJobs" (user_id, job_id) values (8, 21);
insert into "UserJobs" (user_id, job_id) values (9, 42);
insert into "UserJobs" (user_id, job_id) values (9, 19);
insert into "UserJobs" (user_id, job_id) values (9, 24);
insert into "UserJobs" (user_id, job_id) values (2, 13);
insert into "UserJobs" (user_id, job_id) values (9, 13);
insert into "UserJobs" (user_id, job_id) values (5, 2);
insert into "UserJobs" (user_id, job_id) values (9, 30);
insert into "UserJobs" (user_id, job_id) values (8, 8);
insert into "UserJobs" (user_id, job_id) values (1, 35);
insert into "UserJobs" (user_id, job_id) values (10, 30);
insert into "UserJobs" (user_id, job_id) values (4, 44);
insert into "UserJobs" (user_id, job_id) values (7, 48);
insert into "UserJobs" (user_id, job_id) values (1, 23);
insert into "UserJobs" (user_id, job_id) values (7, 17);
insert into "UserJobs" (user_id, job_id) values (10, 12);
insert into "UserJobs" (user_id, job_id) values (3, 48);
insert into "UserJobs" (user_id, job_id) values (4, 5);
insert into "UserJobs" (user_id, job_id) values (5, 5);
insert into "UserJobs" (user_id, job_id) values (10, 46);
insert into "UserJobs" (user_id, job_id) values (7, 21);
insert into "UserJobs" (user_id, job_id) values (6, 34);
insert into "UserJobs" (user_id, job_id) values (9, 21);
insert into "UserJobs" (user_id, job_id) values (4, 41);

insert into "JobBenefits" (job_id, benefit_id) values (26, 2);
insert into "JobBenefits" (job_id, benefit_id) values (9, 2);
insert into "JobBenefits" (job_id, benefit_id) values (36, 3);
insert into "JobBenefits" (job_id, benefit_id) values (40, 2);
insert into "JobBenefits" (job_id, benefit_id) values (6, 3);
insert into "JobBenefits" (job_id, benefit_id) values (7, 4);
insert into "JobBenefits" (job_id, benefit_id) values (19, 5);
insert into "JobBenefits" (job_id, benefit_id) values (23, 5);
insert into "JobBenefits" (job_id, benefit_id) values (34, 2);
insert into "JobBenefits" (job_id, benefit_id) values (46, 1);
insert into "JobBenefits" (job_id, benefit_id) values (37, 4);
insert into "JobBenefits" (job_id, benefit_id) values (12, 4);
insert into "JobBenefits" (job_id, benefit_id) values (22, 3);
insert into "JobBenefits" (job_id, benefit_id) values (14, 4);
insert into "JobBenefits" (job_id, benefit_id) values (10, 1);
insert into "JobBenefits" (job_id, benefit_id) values (31, 2);
insert into "JobBenefits" (job_id, benefit_id) values (24, 4);
insert into "JobBenefits" (job_id, benefit_id) values (21, 1);
insert into "JobBenefits" (job_id, benefit_id) values (40, 4);
insert into "JobBenefits" (job_id, benefit_id) values (20, 4);
insert into "JobBenefits" (job_id, benefit_id) values (39, 2);
insert into "JobBenefits" (job_id, benefit_id) values (15, 5);
insert into "JobBenefits" (job_id, benefit_id) values (12, 1);
insert into "JobBenefits" (job_id, benefit_id) values (29, 4);
insert into "JobBenefits" (job_id, benefit_id) values (13, 1);
insert into "JobBenefits" (job_id, benefit_id) values (49, 2);
insert into "JobBenefits" (job_id, benefit_id) values (26, 5);
insert into "JobBenefits" (job_id, benefit_id) values (20, 3);
insert into "JobBenefits" (job_id, benefit_id) values (35, 5);
insert into "JobBenefits" (job_id, benefit_id) values (46, 2);
insert into "JobBenefits" (job_id, benefit_id) values (38, 3);
insert into "JobBenefits" (job_id, benefit_id) values (43, 1);
insert into "JobBenefits" (job_id, benefit_id) values (31, 1);
insert into "JobBenefits" (job_id, benefit_id) values (33, 2);
insert into "JobBenefits" (job_id, benefit_id) values (2, 1);
insert into "JobBenefits" (job_id, benefit_id) values (47, 3);
insert into "JobBenefits" (job_id, benefit_id) values (2, 2);
insert into "JobBenefits" (job_id, benefit_id) values (38, 4);
insert into "JobBenefits" (job_id, benefit_id) values (15, 1);
insert into "JobBenefits" (job_id, benefit_id) values (8, 1);
insert into "JobBenefits" (job_id, benefit_id) values (14, 3);
insert into "JobBenefits" (job_id, benefit_id) values (12, 2);
insert into "JobBenefits" (job_id, benefit_id) values (16, 1);
insert into "JobBenefits" (job_id, benefit_id) values (49, 5);
insert into "JobBenefits" (job_id, benefit_id) values (45, 5);

insert into "JobSkills" (job_id, skill_id) values (39, 5);
insert into "JobSkills" (job_id, skill_id) values (14, 5);
insert into "JobSkills" (job_id, skill_id) values (32, 8);
insert into "JobSkills" (job_id, skill_id) values (4, 10);
insert into "JobSkills" (job_id, skill_id) values (45, 7);
insert into "JobSkills" (job_id, skill_id) values (14, 2);
insert into "JobSkills" (job_id, skill_id) values (35, 7);
insert into "JobSkills" (job_id, skill_id) values (35, 1);
insert into "JobSkills" (job_id, skill_id) values (16, 6);
insert into "JobSkills" (job_id, skill_id) values (13, 5);
insert into "JobSkills" (job_id, skill_id) values (21, 8);
insert into "JobSkills" (job_id, skill_id) values (23, 3);
insert into "JobSkills" (job_id, skill_id) values (41, 10);
insert into "JobSkills" (job_id, skill_id) values (34, 6);
insert into "JobSkills" (job_id, skill_id) values (12, 6);
insert into "JobSkills" (job_id, skill_id) values (38, 10);
insert into "JobSkills" (job_id, skill_id) values (42, 2);
insert into "JobSkills" (job_id, skill_id) values (17, 9);
insert into "JobSkills" (job_id, skill_id) values (25, 9);
insert into "JobSkills" (job_id, skill_id) values (7, 8);
insert into "JobSkills" (job_id, skill_id) values (22, 1);
insert into "JobSkills" (job_id, skill_id) values (31, 10);
insert into "JobSkills" (job_id, skill_id) values (26, 3);
insert into "JobSkills" (job_id, skill_id) values (35, 3);
insert into "JobSkills" (job_id, skill_id) values (22, 9);
insert into "JobSkills" (job_id, skill_id) values (3, 6);
insert into "JobSkills" (job_id, skill_id) values (19, 7);
insert into "JobSkills" (job_id, skill_id) values (26, 8);
insert into "JobSkills" (job_id, skill_id) values (9, 7);
insert into "JobSkills" (job_id, skill_id) values (44, 9);
insert into "JobSkills" (job_id, skill_id) values (10, 1);
insert into "JobSkills" (job_id, skill_id) values (2, 2);
insert into "JobSkills" (job_id, skill_id) values (4, 7);
insert into "JobSkills" (job_id, skill_id) values (49, 4);
insert into "JobSkills" (job_id, skill_id) values (29, 1);
insert into "JobSkills" (job_id, skill_id) values (30, 7);
insert into "JobSkills" (job_id, skill_id) values (16, 1);
insert into "JobSkills" (job_id, skill_id) values (29, 7);
insert into "JobSkills" (job_id, skill_id) values (14, 1);
insert into "JobSkills" (job_id, skill_id) values (48, 8);
insert into "JobSkills" (job_id, skill_id) values (30, 8);
insert into "JobSkills" (job_id, skill_id) values (38, 9);
insert into "JobSkills" (job_id, skill_id) values (47, 9);
insert into "JobSkills" (job_id, skill_id) values (49, 2);
insert into "JobSkills" (job_id, skill_id) values (46, 7);
insert into "JobSkills" (job_id, skill_id) values (6, 5);

insert into "UserSkills" (user_id, skill_id, seniority) values (1, 1, 'Intermediate');
insert into "UserSkills" (user_id, skill_id, seniority) values (2, 6, 'Senior');
insert into "UserSkills" (user_id, skill_id, seniority) values (10, 1, 'Junior');
insert into "UserSkills" (user_id, skill_id, seniority) values (4, 5, 'Expert');
insert into "UserSkills" (user_id, skill_id, seniority) values (2, 3, 'Senior');
insert into "UserSkills" (user_id, skill_id, seniority) values (7, 10, 'Senior');
insert into "UserSkills" (user_id, skill_id, seniority) values (4, 1, 'Intermediate');
insert into "UserSkills" (user_id, skill_id, seniority) values (10, 2, 'Expert');
insert into "UserSkills" (user_id, skill_id, seniority) values (1, 10, 'Intermediate');
insert into "UserSkills" (user_id, skill_id, seniority) values (5, 5, 'Senior');
insert into "UserSkills" (user_id, skill_id, seniority) values (10, 9, 'Junior');
insert into "UserSkills" (user_id, skill_id, seniority) values (10, 8, 'Senior');
insert into "UserSkills" (user_id, skill_id, seniority) values (3, 6, 'Senior');
insert into "UserSkills" (user_id, skill_id, seniority) values (2, 1, 'Expert');
insert into "UserSkills" (user_id, skill_id, seniority) values (7, 2, 'Junior');
insert into "UserSkills" (user_id, skill_id, seniority) values (5, 10, 'Expert');
insert into "UserSkills" (user_id, skill_id, seniority) values (9, 9, 'Senior');
insert into "UserSkills" (user_id, skill_id, seniority) values (5, 1, 'Senior');
insert into "UserSkills" (user_id, skill_id, seniority) values (6, 9, 'Junior');
insert into "UserSkills" (user_id, skill_id, seniority) values (8, 2, 'Expert');
insert into "UserSkills" (user_id, skill_id, seniority) values (1, 7, 'Intermediate');
insert into "UserSkills" (user_id, skill_id, seniority) values (8, 7, 'Junior');
insert into "UserSkills" (user_id, skill_id, seniority) values (10, 10, 'Expert');
insert into "UserSkills" (user_id, skill_id, seniority) values (8, 3, 'Senior');
insert into "UserSkills" (user_id, skill_id, seniority) values (6, 6, 'Intermediate');
insert into "UserSkills" (user_id, skill_id, seniority) values (8, 10, 'Intermediate');
insert into "UserSkills" (user_id, skill_id, seniority) values (10, 5, 'Senior');
insert into "UserSkills" (user_id, skill_id, seniority) values (7, 1, 'Expert');
insert into "UserSkills" (user_id, skill_id, seniority) values (8, 9, 'Junior');
insert into "UserSkills" (user_id, skill_id, seniority) values (9, 7, 'Intermediate');
insert into "UserSkills" (user_id, skill_id, seniority) values (7, 5, 'Senior');
insert into "UserSkills" (user_id, skill_id, seniority) values (4, 6, 'Junior');
insert into "UserSkills" (user_id, skill_id, seniority) values (2, 8, 'Intermediate');
insert into "UserSkills" (user_id, skill_id, seniority) values (9, 8, 'Junior');
insert into "UserSkills" (user_id, skill_id, seniority) values (4, 3, 'Expert');
insert into "UserSkills" (user_id, skill_id, seniority) values (2, 5, 'Expert');
insert into "UserSkills" (user_id, skill_id, seniority) values (4, 9, 'Intermediate');
insert into "UserSkills" (user_id, skill_id, seniority) values (3, 5, 'Junior');
insert into "UserSkills" (user_id, skill_id, seniority) values (6, 1, 'Junior');
