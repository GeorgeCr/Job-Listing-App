import { Injectable } from '@nestjs/common';

import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

@Injectable()
export class JobPositionRepository {
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

  async create(createJobDto: {
    title: string;
    description: string;
    company: any;
    benefits: any;
    skills: any;
  }) {
    console.log('create job dto', createJobDto);
    const { title, description, company, benefits, skills } = createJobDto;
    const job = await prisma.jobs.create({
      data: {
        title,
        description,
        applicantsCount: 0,
        benefits: {
          create: benefits,
        },
        company: {
          create: company,
        },
        skills: {
          create: skills,
        },
      },
    });
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

    return prisma.jobSkills.findMany({
      where: {
        jobId: id,
      },
    });
  }

  async getApplicants(id: string) {
    return prisma.users.findMany({
      where: {
        role: 'Applicant',
      },
      include: {
        jobs: {
          where: {
            id,
          },
        },
      },
    });
  }

  async getBenefits(id: string, { useRawQuery } = { useRawQuery: true }) {
    if (useRawQuery) {
      return prisma.$queryRaw`SELECT * FROM "Jobs" INNER JOIN "JobBenefits" ON "Jobs".id = "JobBenefits".job_id INNER JOIN "Benefits" ON "JobBenefits".benefit_id = "Benefits".id WHERE "Jobs".id::text = ${id}`;
    }
  }
}
