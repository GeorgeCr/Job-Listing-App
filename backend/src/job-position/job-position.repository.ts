import { Injectable } from '@nestjs/common';
import { IJobPositionRepository } from '../repository/types';

import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

@Injectable()
export class JobPositionRepository implements IJobPositionRepository {
  async getAll() {
    return prisma.jobs.findMany();
  }

  async get(id: string) {
    return prisma.jobs.findFirst({
      where: {
        id,
      },
    });
  }

  async create(createJobDto: any) {
    console.log('create job dto', createJobDto);
    const job = await prisma.jobs.create({ data: createJobDto });
    console.log('job wtf', job);
  }

  async update(id: string, updateJobDto: any) {
    console.log(
      await prisma.jobs.update({
        where: { id },
        data: updateJobDto,
      }),
    );
  }

  async delete(id: string) {
    console.log('idd', id);
    console.log(await prisma.jobs.delete({ where: { id } }));
  }

  async getSkills(id: string, { useRawQuery } = { useRawQuery: true }) {
    if (useRawQuery) {
      return prisma.$queryRaw`SELECT * FROM "Skills" INNER JOIN "JobSkills" ON "Skills".id = "JobSkills".skill_id INNER JOIN "Jobs" ON "JobSkills".job_id = "Jobs".id WHERE "Jobs".id::text = ${id}`;
    }

    return prisma.skills.findMany({
      where: {
        jobSkills: {
          some: {
            job_id: id,
          },
        },
      },
    });
  }

  async getApplicants(id: string, { useRawQuery } = { useRawQuery: true }) {
    if (useRawQuery) {
      return prisma.$queryRaw`SELECT * FROM "Jobs" INNER JOIN "UserJobs" ON "Jobs".id = "UserJobs".job_id INNER JOIN "Users" ON "UserJobs".user_id = "Users".id WHERE "Jobs".id::text = ${id}`;
    }
  }

  async getBenefits(id: string, { useRawQuery } = { useRawQuery: true }) {
    if (useRawQuery) {
      return prisma.$queryRaw`SELECT * FROM "Jobs" INNER JOIN "JobBenefits" ON "Jobs".id = "JobBenefits".job_id INNER JOIN "Benefits" ON "JobBenefits".benefit_id = "Benefits".id WHERE "Jobs".id::text = ${id}`;
    }
  }
}
