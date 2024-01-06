import { Injectable } from '@nestjs/common';

import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

@Injectable()
export class UserRepository {
  async get(id: string) {
    return prisma.users.findFirst({
      where: {
        id,
      },
    });
  }

  async getSkills(id: string) {
    return prisma.userSkills.findMany({
      where: {
        userId: id,
      },
    });
  }

  async getJobs(id: string) {
    return prisma.users.findFirst({
      where: {
        id,
      },
      select: {
        jobs: {
          select: {
            id: true,
            title: true,
            description: true,
            feedbacks: true,
            applicantsCount: true,
          },
        },
      },
    });
  }

  async addJob(userId: string, jobId: string) {
    return prisma.users.update({
      where: {
        id: userId,
      },
      data: {
        jobs: {
          connect: {
            id: jobId,
          },
        },
      },
      include: {
        jobs: true,
      },
    });
  }

  async editSkills(id: string, skills: any) {
    return prisma.users.update({
      where: {
        id,
      },
      data: {
        skills: {
          deleteMany: {},
          createMany: {
            data: skills,
          },
        },
      },
    });
  }

  async acceptCandidate(
    id: string,
    jobId: string,
    candidateId: string,
    feedbackContent: string,
  ) {
    return prisma.feedbacks.updateMany({
      where: {
        userId: candidateId,
        jobId,
      },
      data: {
        type: 'Positive',
        content: feedbackContent,
      },
    });
  }

  async rejectCandidate(
    id: string,
    jobId: string,
    candidateId: string,
    feedbackContent: string,
  ) {
    return prisma.feedbacks.updateMany({
      where: {
        userId: candidateId,
        jobId,
      },
      data: {
        type: 'Negative',
        content: feedbackContent,
      },
    });
  }
}
