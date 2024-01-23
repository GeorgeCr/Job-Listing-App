import { Injectable } from '@nestjs/common';

import { PrismaClient } from '@prisma/client';

enum seniorities {
  'Junior' = 1,
  'Mid' = 2,
  'Senior' = 3,
  'Expert' = 4,
}

const prisma = new PrismaClient();

@Injectable()
export class JobPositionRepository {
  async getAll() {
    return prisma.jobs.findMany({
      include: {
        company: {
          select: {
            name: true,
          },
        },
      },
    });
  }

  async get(id: string, userId: string) {
    const currentUser = await prisma.users.findUnique({
      where: {
        id: userId,
      },
      select: {
        skills: true,
        jobs: {
          where: {
            id,
          },
          take: 1,
          select: {
            users: {
              where: {
                id: userId,
              },
              select: {
                skills: true,
              },
            },
            skills: {
              select: {
                name: true,
                seniority: true,
                id: true,
                job: true,
              },
            },
            applicantsCount: true,
            collaborationType: true,
            company: {
              select: {
                name: true,
                location: true,
              },
            },
            description: true,
            id: true,
            salary: true,
            title: true,
          },
        },
      },
    });

    // maybe return this and drop skills call from FE
    // console.log('current user job skills', currentUser.jobs[0].skills);
    // console.log('user skills', currentUser.skills);
    const hasUserAlreadyApplied = currentUser.jobs.some((job) => job.id === id);

    console.log('user id', userId);
    const userAllSkills = await prisma.userSkills.findMany({
      where: {
        userId: userId,
      },
    });

    // maybe return this and drop skills call from FE
    // console.log('current user job skills', currentUser.jobs[0].skills);
    // console.log('user skills', currentUser.skills);
    const jobSkillsMismatches = currentUser.jobs[0]?.skills.filter(
      (jobSkill) => {
        console.log('user skills', userAllSkills);
        const foundUserSkill = userAllSkills.find(
          (userSkill) => userSkill.name === jobSkill.name,
        );
        console.log('found user skill', foundUserSkill);

        if (
          seniorities[jobSkill?.seniority] >
          seniorities[foundUserSkill?.seniority]
        ) {
          console.log('found user skill in if', foundUserSkill);
          return foundUserSkill;
        }
      },
    );

    const result = await prisma.jobs.findFirst({
      where: {
        id,
      },
      include: {
        company: {
          select: {
            name: true,
            location: true,
          },
        },
      },
    });

    return {
      ...result,
      hasUserAlreadyApplied,
      jobSkillsMismatches,
    };
  }

  async create(createJobDto: {
    title: string;
    description: string;
    company: any;
    benefits: any;
    skills: any;
    salary: number;
    collaborationType: string;
    location: string;
  }) {
    const {
      title,
      description,
      company,
      benefits,
      skills,
      salary,
      collaborationType,
      location,
    } = createJobDto;
    console.log('create job dto', createJobDto);
    const job = await prisma.jobs.create({
      data: {
        title,
        description,
        applicantsCount: 0,
        salary,
        collaborationType,
        benefits: {
          create: benefits,
        },
        company: {
          create: {
            name: company,
            location,
          },
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

  async getSkills(id: string, { useRawQuery } = { useRawQuery: false }) {
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
