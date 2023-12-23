import { Injectable } from '@nestjs/common';

import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();
@Injectable()
export class JobPositionService {
  async getAllJobs() {
    return prisma.jobs.findMany();
  }

  async getJobById(id: string) {
    return prisma.jobs.findFirst({
      where: {
        id,
      },
    });
  }

  async createJob(createJobDto: any) {
    console.log('create job dto', createJobDto);
    const job = await prisma.jobs.create({ data: createJobDto });
    console.log('job wtf', job);
  }

  async updateJob(id: string, updateJobDto: any) {
    console.log(
      await prisma.jobs.update({
        where: { id },
        data: updateJobDto,
      }),
    );
  }

  async deleteJobById(id: string) {
    console.log('idd', id);
    console.log(await prisma.jobs.delete({ where: { id } }));
  }
}
