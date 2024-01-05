/*
  Warnings:

  - You are about to drop the column `jobsId` on the `Benefits` table. All the data in the column will be lost.
  - You are about to drop the `Skills` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `jobId` to the `Benefits` table without a default value. This is not possible if the table is not empty.
  - Added the required column `title` to the `Jobs` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Benefits" DROP CONSTRAINT "Benefits_jobsId_fkey";

-- DropForeignKey
ALTER TABLE "Skills" DROP CONSTRAINT "Skills_jobsId_fkey";

-- DropForeignKey
ALTER TABLE "Skills" DROP CONSTRAINT "Skills_userId_fkey";

-- AlterTable
ALTER TABLE "Benefits" DROP COLUMN "jobsId",
ADD COLUMN     "jobId" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Jobs" ADD COLUMN     "title" TEXT NOT NULL;

-- DropTable
DROP TABLE "Skills";

-- CreateTable
CREATE TABLE "UserSkills" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "seniority" TEXT NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "UserSkills_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "JobSkills" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "seniority" TEXT NOT NULL,
    "jobsId" TEXT NOT NULL,

    CONSTRAINT "JobSkills_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "UserSkills" ADD CONSTRAINT "UserSkills_userId_fkey" FOREIGN KEY ("userId") REFERENCES "Users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "JobSkills" ADD CONSTRAINT "JobSkills_jobsId_fkey" FOREIGN KEY ("jobsId") REFERENCES "Jobs"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Benefits" ADD CONSTRAINT "Benefits_jobId_fkey" FOREIGN KEY ("jobId") REFERENCES "Jobs"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
