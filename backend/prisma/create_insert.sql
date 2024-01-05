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

insert into "Users" (id, role, username, "firstName", "lastName", hobbies, "lastEducation") values ('1', 'Recruiter', 'igass0', 'Irina', 'Gass', 'cooking', 'High School');
insert into "Users" (id, role, username, "firstName", "lastName", hobbies, "lastEducation") values ('2', 'Applicant', 'wstory1', 'Winfield', 'Story', 'painting', 'High School');
insert into "Users" (id, role, username, "firstName", "lastName", hobbies, "lastEducation") values ('3', 'Recruiter', 'cboughtwood2', 'Ches', 'Boughtwood', 'reading', 'Master''s Degree');
insert into "Users" (id, role, username, "firstName", "lastName", hobbies, "lastEducation") values ('4', 'Recruiter', 'ydugall3', 'Ynez', 'Dugall', 'cooking', 'PhD');
insert into "Users" (id, role, username, "firstName", "lastName", hobbies, "lastEducation") values ('5', 'Recruiter', 'kthompsett4', 'Kele', 'Thompsett', 'painting', 'High School');
insert into "Users" (id, role, username,  "firstName", "lastName", hobbies, "lastEducation") values ('6', 'Recruiter', 'lfarn5', 'Lezley', 'Farn', 'gardening', 'Master''s Degree');
insert into "Users" (id, role, username,  "firstName", "lastName", hobbies, "lastEducation") values ('7', 'Applicant', 'rgibling6', 'Rriocard', 'Gibling', 'cooking', 'High School');
insert into "Users" (id, role, username,  "firstName", "lastName", hobbies, "lastEducation") values ('8', 'Applicant', 'aepsly7', 'Ashlin', 'Epsly', 'painting', 'High School');
insert into "Users" (id, role, username,  "firstName", "lastName", hobbies, "lastEducation") values ('9', 'Recruiter', 'hfoister8', 'Hagan', 'Foister', 'photography', 'Master''s Degree');
insert into "Users" (id, role, username,  "firstName", "lastName", hobbies, "lastEducation") values ('10', 'Recruiter', 'galmon9', 'Gilberte', 'Almon', 'photography', 'PhD');


insert into "Skills" (name) values ('Java');
insert into "Skills" (name) values ('CSS');
insert into "Skills" (name) values ('Ruby');
insert into "Skills" (name) values ('SQL');
insert into "Skills" (name) values ('JavaScript');
insert into "Skills" (name) values ('Python');
insert into "Skills" (name) values ('Swift');
insert into "Skills" (name) values ('Dart');
insert into "Skills" (name) values ('C++');
insert into "Skills" (name) values ('R');

insert into "Benefits" (description) values ('health insurance');
insert into "Benefits" (description) values ('paid time off');
insert into "Benefits" (description) values ('employee discounts');
insert into "Benefits" (description) values ('professional development opportunities');
insert into "Benefits" (description) values ('retirement plan');

insert into "Companies" (name, location) values ('Leexo', 'Room 1565');
insert into "Companies" (name, location) values ('Jaxbean', 'Apt 1290');
insert into "Companies" (name, location) values ('Realbuzz', 'Room 706');
insert into "Companies" (name, location) values ('Skiba', 'Apt 790');
insert into "Companies" (name, location) values ('Centimia', '17th Floor');
insert into "Companies" (name, location) values ('Meemm', 'PO Box 69662');
insert into "Companies" (name, location) values ('Lazz', '16th Floor');
insert into "Companies" (name, location) values ('Twitterwire', 'Apt 553');
insert into "Companies" (name, location) values ('Tanoodle', 'Suite 26');
insert into "Companies" (name, location) values ('Janyx', 'PO Box 73208');

insert into Jobs (title, description, applicantsCount) values ('Network Administrator', 'Database Administrator', 18);
insert into Jobs (title, description, applicantsCount) values ('Software Engineer', 'Data Analyst', 62);
insert into Jobs (title, description, applicantsCount) values ('IT Project Manager', 'Network Administrator', 70);
insert into Jobs (title, description, applicantsCount) values ('IT Project Manager', 'IT Project Manager', 54);
insert into Jobs (title, description, applicantsCount) values ('Data Analyst', 'Software Engineer', 42);
insert into Jobs (title, description, applicantsCount) values ('Network Administrator', 'IT Project Manager', 79);
insert into Jobs (title, description, applicantsCount) values ('Database Administrator', 'Software Engineer', 26);
insert into Jobs (title, description, applicantsCount) values ('Software Engineer', 'Database Administrator', 67);
insert into Jobs (title, description, applicantsCount) values ('Database Administrator', 'Data Analyst', 80);
insert into Jobs (title, description, applicantsCount) values ('Network Administrator', 'Database Administrator', 54);
insert into Jobs (title, description, applicantsCount) values ('IT Project Manager', 'Data Analyst', 74);
insert into Jobs (title, description, applicantsCount) values ('Network Administrator', 'Data Analyst', 96);
insert into Jobs (title, description, applicantsCount) values ('Software Engineer', 'Database Administrator', 87);
insert into Jobs (title, description, applicantsCount) values ('Network Administrator', 'Database Administrator', 65);
insert into Jobs (title, description, applicantsCount) values ('Software Engineer', 'Network Administrator', 27);
insert into Jobs (title, description, applicantsCount) values ('IT Project Manager', 'Database Administrator', 49);
insert into Jobs (title, description, applicantsCount) values ('Software Engineer', 'Software Engineer', 2);
insert into Jobs (title, description, applicantsCount) values ('Network Administrator', 'IT Project Manager', 17);
insert into Jobs (title, description, applicantsCount) values ('Software Engineer', 'Software Engineer', 51);
insert into Jobs (title, description, applicantsCount) values ('Database Administrator', 'IT Project Manager', 53);
insert into Jobs (title, description, applicantsCount) values ('Software Engineer', 'Software Engineer', 71);
insert into Jobs (title, description, applicantsCount) values ('IT Project Manager', 'Database Administrator', 29);
insert into Jobs (title, description, applicantsCount) values ('Network Administrator', 'Software Engineer', 50);
insert into Jobs (title, description, applicantsCount) values ('Software Engineer', 'IT Project Manager', 61);
insert into Jobs (title, description, applicantsCount) values ('Data Analyst', 'Data Analyst', 92);
insert into Jobs (title, description, applicantsCount) values ('Data Analyst', 'Database Administrator', 46);
insert into Jobs (title, description, applicantsCount) values ('Database Administrator', 'Data Analyst', 58);
insert into Jobs (title, description, applicantsCount) values ('IT Project Manager', 'Database Administrator', 9);
insert into Jobs (title, description, applicantsCount) values ('IT Project Manager', 'Software Engineer', 22);
insert into Jobs (title, description, applicantsCount) values ('IT Project Manager', 'IT Project Manager', 96);
insert into Jobs (title, description, applicantsCount) values ('Network Administrator', 'Data Analyst', 49);
insert into Jobs (title, description, applicantsCount) values ('IT Project Manager', 'Data Analyst', 56);
insert into Jobs (title, description, applicantsCount) values ('IT Project Manager', 'Database Administrator', 92);
insert into Jobs (title, description, applicantsCount) values ('Software Engineer', 'Database Administrator', 34);
insert into Jobs (title, description, applicantsCount) values ('Data Analyst', 'IT Project Manager', 85);
insert into Jobs (title, description, applicantsCount) values ('Database Administrator', 'Data Analyst', 88);
insert into Jobs (title, description, applicantsCount) values ('Network Administrator', 'IT Project Manager', 93);
insert into Jobs (title, description, applicantsCount) values ('Network Administrator', 'Data Analyst', 90);
insert into Jobs (title, description, applicantsCount) values ('Database Administrator', 'Software Engineer', 81);
insert into Jobs (title, description, applicantsCount) values ('Database Administrator', 'Software Engineer', 43);
insert into Jobs (title, description, applicantsCount) values ('Software Engineer', 'Data Analyst', 90);
insert into Jobs (title, description, applicantsCount) values ('Data Analyst', 'IT Project Manager', 54);
insert into Jobs (title, description, applicantsCount) values ('Software Engineer', 'IT Project Manager', 94);
insert into Jobs (title, description, applicantsCount) values ('Data Analyst', 'Network Administrator', 45);
insert into Jobs (title, description, applicantsCount) values ('Network Administrator', 'IT Project Manager', 95);
insert into Jobs (title, description, applicantsCount) values ('Database Administrator', 'Data Analyst', 26);
insert into Jobs (title, description, applicantsCount) values ('Data Analyst', 'Data Analyst', 27);
insert into Jobs (title, description, applicantsCount) values ('Network Administrator', 'Network Administrator', 71);
insert into Jobs (title, description, applicantsCount) values ('Database Administrator', 'IT Project Manager', 68);
insert into Jobs (title, description, applicantsCount) values ('Network Administrator', 'Data Analyst', 59);


-- insert into "JobSkills" (job_id, skill_id) values ('e9ee1ba5-7cab-49da-94e7-3f973a874f1a', '45dbb806-2e2d-473f-9cee-f9a65eb5bbd8');
-- insert into "JobSkills" (job_id, skill_id) values ('9903fe96-0969-4657-a3d5-e445ab8f19e8', '14c1a374-4f33-4cee-a82a-24b5d10fd32e');
-- insert into "JobSkills" (job_id, skill_id) values ('8f02e551-b89f-4dc5-8a7a-af307aa40a1e', '4d1b1d86-e5d0-435a-a05e-3f1c219b053c');
-- insert into "JobSkills" (job_id, skill_id) values ('3fb71c7a-eca1-4fa6-904c-1a3ace70305f', '0686bba6-c0f0-4ea8-a3cb-ac16125a46f5');
-- insert into "JobSkills" (job_id, skill_id) values ('68268729-040e-4d5c-a48e-a0e007bc8389', '60553fa6-bd71-457b-b4bd-b29d9574b017');
-- insert into "JobSkills" (job_id, skill_id) values ('a06387e3-dc85-4950-92df-62a508cc1b46', '7806022b-e9fa-468f-a74f-e7b0421e475d');
-- insert into "JobSkills" (job_id, skill_id) values ('bda87ef4-9d5b-4db5-be7c-d80b69e12d98', 'b48f9bb6-e11c-4d31-8859-0145379c7f39');
-- insert into "JobSkills" (job_id, skill_id) values ('b63db3ea-8eb0-4daa-92c7-aec31b919e2e', '64067806-2c4e-48d7-b913-c8040023b91c');
-- insert into "JobSkills" (job_id, skill_id) values ('e0a95e13-68be-45b4-bb5c-f00b519141c8', 'af037207-f165-4c97-b953-af7cb81e9041');
-- insert into "JobSkills" (job_id, skill_id) values ('a587ba96-5d1d-45ae-a28e-9d14f499d2f9', '8d385304-d5a5-4f28-9c11-43c022412755');
-- insert into "JobSkills" (job_id, skill_id) values ('14b8d680-4599-402e-8584-c3278475ba4d', '45dbb806-2e2d-473f-9cee-f9a65eb5bbd8');
-- insert into "JobSkills" (job_id, skill_id) values ('ac92d7d0-e4d1-4885-b487-8c00ea4b77af', '14c1a374-4f33-4cee-a82a-24b5d10fd32e');
-- insert into "JobSkills" (job_id, skill_id) values ('02aa8076-fd41-4338-8c50-4dbae51298d9', '4d1b1d86-e5d0-435a-a05e-3f1c219b053c');
-- insert into "JobSkills" (job_id, skill_id) values ('e02ec73b-06bd-4eea-b753-7a2299674203', '0686bba6-c0f0-4ea8-a3cb-ac16125a46f5');
-- insert into "JobSkills" (job_id, skill_id) values ('954c1a45-f0bc-4a2b-ba72-3d6103b46578', '60553fa6-bd71-457b-b4bd-b29d9574b017');
-- insert into "JobSkills" (job_id, skill_id) values ('c75f4e01-8d39-45cf-93b3-e6def544a1e2', '7806022b-e9fa-468f-a74f-e7b0421e475d');
-- insert into "JobSkills" (job_id, skill_id) values ('0be9d40d-2c8d-44d9-ac95-ba903df7a94a', 'b48f9bb6-e11c-4d31-8859-0145379c7f39');
-- insert into "JobSkills" (job_id, skill_id) values ('599a90a0-e3d3-424b-a4d3-0eeb5efdc79b', '64067806-2c4e-48d7-b913-c8040023b91c');
-- insert into "JobSkills" (job_id, skill_id) values ('3f81fc2e-c38c-436d-b9a9-71dba92e3d5d', 'af037207-f165-4c97-b953-af7cb81e9041');
-- insert into "JobSkills" (job_id, skill_id) values ('d6c7cc3c-4474-4225-a02a-1ad66c456c1d', '8d385304-d5a5-4f28-9c11-43c022412755');
-- insert into "JobSkills" (job_id, skill_id) values ('2aa8c859-2c19-4507-9f82-d13347c009f1', '45dbb806-2e2d-473f-9cee-f9a65eb5bbd8');
-- insert into "JobSkills" (job_id, skill_id) values ('b2a9b405-c04d-4f87-a0ae-dbbf2aac51d8', '14c1a374-4f33-4cee-a82a-24b5d10fd32e');
-- insert into "JobSkills" (job_id, skill_id) values ('71a48d9b-6834-4ccb-afd5-0cc77fb17ce2', '4d1b1d86-e5d0-435a-a05e-3f1c219b053c');
-- insert into "JobSkills" (job_id, skill_id) values ('ee3bcc1f-0131-4018-97b6-50775dfb9c61', '0686bba6-c0f0-4ea8-a3cb-ac16125a46f5');
-- insert into "JobSkills" (job_id, skill_id) values ('aad2edb4-5512-47f1-b4c6-b528c5742999', '60553fa6-bd71-457b-b4bd-b29d9574b017');
-- insert into "JobSkills" (job_id, skill_id) values ('44361bbb-3c60-4e3d-ba05-ccb75d60eb9e', '7806022b-e9fa-468f-a74f-e7b0421e475d');
-- insert into "JobSkills" (job_id, skill_id) values ('2b244d0d-8ee1-4873-ae7a-9d525d07914d', 'b48f9bb6-e11c-4d31-8859-0145379c7f39');
-- insert into "JobSkills" (job_id, skill_id) values ('0dea359a-6fd5-48e6-965d-0431f89a8882', '64067806-2c4e-48d7-b913-c8040023b91c');
-- insert into "JobSkills" (job_id, skill_id) values ('b1572a3d-efc0-4b89-a22d-02f7e1897cc7', 'af037207-f165-4c97-b953-af7cb81e9041');
-- insert into "JobSkills" (job_id, skill_id) values ('c26a0b38-4ce5-4d85-800b-26adadc7cae6', '8d385304-d5a5-4f28-9c11-43c022412755');
-- insert into "JobSkills" (job_id, skill_id) values ('58252eba-0e74-4f4a-9f81-26caa0b0e058', '45dbb806-2e2d-473f-9cee-f9a65eb5bbd8');
-- insert into "JobSkills" (job_id, skill_id) values ('3c5372e3-bcd5-4302-bd3e-4955f66c9dc6', '14c1a374-4f33-4cee-a82a-24b5d10fd32e');
-- insert into "JobSkills" (job_id, skill_id) values ('29385404-5a47-4997-a1ab-37724c5866ab', '4d1b1d86-e5d0-435a-a05e-3f1c219b053c');
-- insert into "JobSkills" (job_id, skill_id) values ('644526dc-f0ea-45cc-bfc8-1907a9084403', '0686bba6-c0f0-4ea8-a3cb-ac16125a46f5');
-- insert into "JobSkills" (job_id, skill_id) values ('e117af95-fc87-41e9-8d98-257bc6eb9713', '60553fa6-bd71-457b-b4bd-b29d9574b017');
-- insert into "JobSkills" (job_id, skill_id) values ('b9fc9e4b-4634-4d89-be46-a45de71d3191', '7806022b-e9fa-468f-a74f-e7b0421e475d');
-- insert into "JobSkills" (job_id, skill_id) values ('76994836-dfb5-4ebc-9d16-b66a170c21c7', 'b48f9bb6-e11c-4d31-8859-0145379c7f39');
-- insert into "JobSkills" (job_id, skill_id) values ('13c82880-5950-407a-ba71-43e78e533936', '64067806-2c4e-48d7-b913-c8040023b91c');
-- insert into "JobSkills" (job_id, skill_id) values ('baf53244-05f4-4d7b-b197-af172391a28b', 'af037207-f165-4c97-b953-af7cb81e9041');
-- insert into "JobSkills" (job_id, skill_id) values ('7c444718-c42e-4475-afcf-d0f33c043ce3', '8d385304-d5a5-4f28-9c11-43c022412755');
-- insert into "JobSkills" (job_id, skill_id) values ('12741c72-ba11-446a-b9c3-1ae99d38b531', '45dbb806-2e2d-473f-9cee-f9a65eb5bbd8');
-- insert into "JobSkills" (job_id, skill_id) values ('3cb51458-b4bb-419e-90e2-9fd5180be069', '14c1a374-4f33-4cee-a82a-24b5d10fd32e');
-- insert into "JobSkills" (job_id, skill_id) values ('909ec2ab-1d65-4857-9b8c-43ebac697f89', '4d1b1d86-e5d0-435a-a05e-3f1c219b053c');
-- insert into "JobSkills" (job_id, skill_id) values ('1b438c31-d76b-4401-aab4-208c303e5dcb', '0686bba6-c0f0-4ea8-a3cb-ac16125a46f5');
-- insert into "JobSkills" (job_id, skill_id) values ('0ca2c696-25c4-47cc-95d5-b84a84fd245f', '60553fa6-bd71-457b-b4bd-b29d9574b017');
-- insert into "JobSkills" (job_id, skill_id) values ('8d6b9423-f5bb-4fbe-8601-7dfe120144f8', '7806022b-e9fa-468f-a74f-e7b0421e475d');


-- insert into "UserJobs" (user_id, job_id) values (2, '3fb71c7a-eca1-4fa6-904c-1a3ace70305f');
-- insert into "UserJobs" (user_id, job_id) values (3, '9903fe96-0969-4657-a3d5-e445ab8f19e8');
-- insert into "UserJobs" (user_id, job_id) values (4, '8f02e551-b89f-4dc5-8a7a-af307aa40a1e');
-- insert into "UserJobs" (user_id, job_id) values (5, '3fb71c7a-eca1-4fa6-904c-1a3ace70305f');
-- insert into "UserJobs" (user_id, job_id) values (6, '68268729-040e-4d5c-a48e-a0e007bc8389');
-- insert into "UserJobs" (user_id, job_id) values (7, 'a06387e3-dc85-4950-92df-62a508cc1b46');
-- insert into "UserJobs" (user_id, job_id) values (8, 'bda87ef4-9d5b-4db5-be7c-d80b69e12d98');
-- insert into "UserJobs" (user_id, job_id) values (9, 'b63db3ea-8eb0-4daa-92c7-aec31b919e2e');
-- insert into "UserJobs" (user_id, job_id) values (10, 'e0a95e13-68be-45b4-bb5c-f00b519141c8');
-- insert into "UserJobs" (user_id, job_id) values (1, 'a587ba96-5d1d-45ae-a28e-9d14f499d2f9');
-- insert into "UserJobs" (user_id, job_id) values (2, '14b8d680-4599-402e-8584-c3278475ba4d');
-- insert into "UserJobs" (user_id, job_id) values (3, 'ac92d7d0-e4d1-4885-b487-8c00ea4b77af');
-- insert into "UserJobs" (user_id, job_id) values (4, '02aa8076-fd41-4338-8c50-4dbae51298d9');
-- insert into "UserJobs" (user_id, job_id) values (5, 'e02ec73b-06bd-4eea-b753-7a2299674203');
-- insert into "UserJobs" (user_id, job_id) values (6, '954c1a45-f0bc-4a2b-ba72-3d6103b46578');
-- insert into "UserJobs" (user_id, job_id) values (7, 'c75f4e01-8d39-45cf-93b3-e6def544a1e2');
-- insert into "UserJobs" (user_id, job_id) values (9, '0be9d40d-2c8d-44d9-ac95-ba903df7a94a');
-- insert into "UserJobs" (user_id, job_id) values (10, '599a90a0-e3d3-424b-a4d3-0eeb5efdc79b');
-- insert into "UserJobs" (user_id, job_id) values (1, '3f81fc2e-c38c-436d-b9a9-71dba92e3d5d');

-- insert into "JobBenefits" (job_id, benefit_id) values ('e3e6dd6f-0e00-49c0-b6d6-8d4ddb827492', '212e44bd-f471-4940-b8fe-f73df4b27b20');
-- insert into "JobBenefits" (job_id, benefit_id) values ('09f9e5b3-26bb-4ca4-8365-564574252c40', '1336d393-b46d-494f-a83c-cf0cfe35eed5');
-- insert into "JobBenefits" (job_id, benefit_id) values ('ce0f7ef3-9903-4aa1-b9ba-7c2c9cca3778', '6a5f686f-3c1c-4b0d-b29d-b2c9d75971d0');
-- insert into "JobBenefits" (job_id, benefit_id) values ('676406c8-1874-442d-9d84-8e13d11056c0', '5bde4fcf-4cd2-4507-b0ab-e96ecff707f3');
-- insert into "JobBenefits" (job_id, benefit_id) values ('974796f8-cd60-4361-aa0e-8558fd000e3c', '212e44bd-f471-4940-b8fe-f73df4b27b20');
-- insert into "JobBenefits" (job_id, benefit_id) values ('14f070b8-55f8-4995-b4bf-50a80e3a6267', '5fc472f7-0f6d-4ea3-acff-35b8fb6f5519');
-- insert into "JobBenefits" (job_id, benefit_id) values ('830be6c4-536e-4361-84d8-58bc978d92a6', '212e44bd-f471-4940-b8fe-f73df4b27b20');
-- insert into "JobBenefits" (job_id, benefit_id) values ('a6044710-cb94-4e18-8ce8-a6248213151c', '212e44bd-f471-4940-b8fe-f73df4b27b20');
-- insert into "JobBenefits" (job_id, benefit_id) values ('425c6d01-c376-4534-bb12-dfa4c7451f12', '212e44bd-f471-4940-b8fe-f73df4b27b20');
-- insert into "JobBenefits" (job_id, benefit_id) values ('91b3ac90-644a-4db3-8180-a29c3575cfae', '6a5f686f-3c1c-4b0d-b29d-b2c9d75971d0');
-- insert into "JobBenefits" (job_id, benefit_id) values ('b77f54e0-abe6-4023-a810-b806d69df274', '5bde4fcf-4cd2-4507-b0ab-e96ecff707f3');
-- insert into "JobBenefits" (job_id, benefit_id) values ('6cd7ad6a-7a2b-447b-af83-97a627b44a9b', '212e44bd-f471-4940-b8fe-f73df4b27b20');
-- insert into "JobBenefits" (job_id, benefit_id) values ('680de93e-0be9-4552-8f53-a853d6664634', '1336d393-b46d-494f-a83c-cf0cfe35eed5');
-- insert into "JobBenefits" (job_id, benefit_id) values ('5ff882db-7787-4c04-a269-c49d599da62a', '6a5f686f-3c1c-4b0d-b29d-b2c9d75971d0');
-- insert into "JobBenefits" (job_id, benefit_id) values ('b112bb76-cc98-4b9b-9eab-5229fda9ad9e', '5bde4fcf-4cd2-4507-b0ab-e96ecff707f3');
-- insert into "JobBenefits" (job_id, benefit_id) values ('427bcaa1-1148-4640-807b-23b4a9fc1a0c', '212e44bd-f471-4940-b8fe-f73df4b27b20');
-- insert into "JobBenefits" (job_id, benefit_id) values ('d42ba589-01a4-4de8-928b-deace82803f7', '1336d393-b46d-494f-a83c-cf0cfe35eed5');
-- insert into "JobBenefits" (job_id, benefit_id) values ('ce7e45db-8daf-4040-b424-5427b9457d8f', '6a5f686f-3c1c-4b0d-b29d-b2c9d75971d0');
-- insert into "JobBenefits" (job_id, benefit_id) values ('29b380ce-a376-4be1-93ae-5d34629e1262', '5bde4fcf-4cd2-4507-b0ab-e96ecff707f3');


-- insert into "UserSkills" (user_id, skill_id, seniority) values (1, '86abf06a-4fcb-4a1b-a5d2-8e3b0865bdbf', 'Intermediate');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (2, '0985a530-ae17-493c-8f2b-fcd4ec6afccc', 'Senior');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (10, 'ff4705c8-4afb-48c9-aa5e-92f90c66e4e1', 'Junior');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (4, '663d8ea6-10ee-45c8-9d63-8a1407e60631', 'Expert');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (7, '7f637f23-b0f0-47b7-b8c2-e9b7518ee324', 'Senior');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (5, '86abf06a-4fcb-4a1b-a5d2-8e3b0865bdbf', 'Senior');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (8, '0985a530-ae17-493c-8f2b-fcd4ec6afccc', 'Expert');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (3, '0985a530-ae17-493c-8f2b-fcd4ec6afccc', 'Intermediate');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (9, '663d8ea6-10ee-45c8-9d63-8a1407e60631', 'Senior');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (10, '86abf06a-4fcb-4a1b-a5d2-8e3b0865bdbf', 'Expert');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (2, '7f637f23-b0f0-47b7-b8c2-e9b7518ee324', 'Intermediate');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (1, '1f15b15a-d0c2-4200-a12d-c969e7df1ce5', 'Intermediate');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (7, '0985a530-ae17-493c-8f2b-fcd4ec6afccc', 'Junior');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (9, '86abf06a-4fcb-4a1b-a5d2-8e3b0865bdbf', 'Junior');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (9, '93527976-dd6a-40f5-8e8a-c1f526888117', 'Senior');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (8, '1f15b15a-d0c2-4200-a12d-c969e7df1ce5', 'Intermediate');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (3, '663d8ea6-10ee-45c8-9d63-8a1407e60631', 'Junior');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (6, '86abf06a-4fcb-4a1b-a5d2-8e3b0865bdbf', 'Junior');
-- insert into "UserSkills" (user_id, skill_id, seniority) values (6, 'ff4705c8-4afb-48c9-aa5e-92f90c66e4e1', 'Intermediate');

