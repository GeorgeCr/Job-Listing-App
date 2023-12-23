/*
  Warnings:

  - You are about to drop the column `seniority` on the `Skills` table. All the data in the column will be lost.
  - Added the required column `seniority` to the `UserSkills` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Skills" DROP COLUMN "seniority";

-- AlterTable
ALTER TABLE "UserSkills" ADD COLUMN     "seniority" TEXT NOT NULL;
