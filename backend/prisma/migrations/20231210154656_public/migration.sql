-- CreateTable
CREATE TABLE "Users" (
    "id" SERIAL NOT NULL,
    "role" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "passwordHash" TEXT NOT NULL,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "hobbies" TEXT NOT NULL,
    "lastEducation" TEXT NOT NULL,

    CONSTRAINT "Users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserSkills" (
    "user_id" INTEGER NOT NULL,
    "skill_id" INTEGER NOT NULL,

    CONSTRAINT "UserSkills_pkey" PRIMARY KEY ("user_id","skill_id")
);

-- CreateTable
CREATE TABLE "Skills" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "seniority" TEXT NOT NULL,

    CONSTRAINT "Skills_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Feedback" (
    "id" SERIAL NOT NULL,
    "type" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "userId" INTEGER NOT NULL,
    "jobId" INTEGER NOT NULL,

    CONSTRAINT "Feedback_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserJobs" (
    "user_id" INTEGER NOT NULL,
    "job_id" INTEGER NOT NULL,

    CONSTRAINT "UserJobs_pkey" PRIMARY KEY ("user_id","job_id")
);

-- CreateTable
CREATE TABLE "Jobs" (
    "id" SERIAL NOT NULL,
    "description" TEXT NOT NULL,
    "applicantsCount" INTEGER NOT NULL,
    "companyId" INTEGER NOT NULL,

    CONSTRAINT "Jobs_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "JobBenefits" (
    "job_id" INTEGER NOT NULL,
    "benefit_id" INTEGER NOT NULL,

    CONSTRAINT "JobBenefits_pkey" PRIMARY KEY ("job_id","benefit_id")
);

-- CreateTable
CREATE TABLE "JobSkills" (
    "job_id" INTEGER NOT NULL,
    "skill_id" INTEGER NOT NULL,

    CONSTRAINT "JobSkills_pkey" PRIMARY KEY ("job_id","skill_id")
);

-- CreateTable
CREATE TABLE "Benefits" (
    "id" SERIAL NOT NULL,
    "description" TEXT NOT NULL,

    CONSTRAINT "Benefits_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Companies" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "location" TEXT NOT NULL,

    CONSTRAINT "Companies_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "UserSkills" ADD CONSTRAINT "UserSkills_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "Users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserSkills" ADD CONSTRAINT "UserSkills_skill_id_fkey" FOREIGN KEY ("skill_id") REFERENCES "Skills"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Feedback" ADD CONSTRAINT "Feedback_userId_fkey" FOREIGN KEY ("userId") REFERENCES "Users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Feedback" ADD CONSTRAINT "Feedback_jobId_fkey" FOREIGN KEY ("jobId") REFERENCES "Jobs"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserJobs" ADD CONSTRAINT "UserJobs_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "Users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserJobs" ADD CONSTRAINT "UserJobs_job_id_fkey" FOREIGN KEY ("job_id") REFERENCES "Jobs"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Jobs" ADD CONSTRAINT "Jobs_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES "Companies"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "JobBenefits" ADD CONSTRAINT "JobBenefits_job_id_fkey" FOREIGN KEY ("job_id") REFERENCES "Jobs"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "JobBenefits" ADD CONSTRAINT "JobBenefits_benefit_id_fkey" FOREIGN KEY ("benefit_id") REFERENCES "Benefits"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "JobSkills" ADD CONSTRAINT "JobSkills_job_id_fkey" FOREIGN KEY ("job_id") REFERENCES "Jobs"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "JobSkills" ADD CONSTRAINT "JobSkills_skill_id_fkey" FOREIGN KEY ("skill_id") REFERENCES "Skills"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
