import { Injectable } from '@nestjs/common';

import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

@Injectable()
export class UsersRepository {
  async getByUsername(username: string) {
    return prisma.users.findFirst({
      where: {
        username,
      },
    });
  }

  async get(id: string) {
    return prisma.users.findFirst({
      where: {
        id,
      },
      include: {
        skills: true,
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
            company: true,
          },
        },
      },
    });
  }

  async addJob(userId: string, jobId: string) {
    // console.log('userid', userId, 'jobId', jobId);
    console.log('userid', userId, 'jobId', jobId);
    const currentJob = await prisma.jobs.findUnique({
      where: {
        id: jobId,
      },
      select: { applicantsCount: true, users: true, id: true },
    });
    console.log('current job', currentJob);
    const hasUserAlreadyApplied = currentJob.users.some(
      (user) => user.id === userId,
    );

    if (hasUserAlreadyApplied) {
      return {}; // fe should handle better
    }

    console.log('has already', currentJob.applicantsCount);

    return prisma.users.update({
      where: {
        id: userId,
      },
      data: {
        jobs: {
          connect: {
            id: jobId,
          },
          update: {
            where: {
              id: jobId,
            },
            data: {
              applicantsCount: currentJob.applicantsCount + 1,
            },
          },
        },
      },
      include: {
        jobs: true,
      },
    });
  }

  async removeJob(userId: string, jobId: string) {
    const currentJob = await prisma.jobs.findUnique({
      where: {
        id: jobId,
      },
      select: { applicantsCount: true, id: true },
    });

    if (!currentJob) {
      // Handle the case where the job is not found
      throw new Error(`Job with ID ${jobId} not found.`);
    }

    // Update the user to disconnect the job
    const updatedUser = await prisma.users.update({
      where: {
        id: userId,
      },
      data: {
        jobs: {
          disconnect: {
            id: jobId,
          },
        },
      },
      include: {
        jobs: true,
      },
    });

    // Update the job to decrement the applicants count
    const updatedJob = await prisma.jobs.update({
      where: {
        id: jobId,
      },
      data: {
        applicantsCount: currentJob.applicantsCount - 1,
      },
    });

    return { updatedUser, updatedJob };
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
