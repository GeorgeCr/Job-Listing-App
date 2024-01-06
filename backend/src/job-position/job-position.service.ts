import { Injectable } from '@nestjs/common';
import { JobPositionRepository } from './job-position.repository';

@Injectable()
export class JobPositionService {
  constructor(private jobPositionRepository: JobPositionRepository) {
    console.log(this.constructor.prototype, 'this');
  }
  async getAllJobs() {
    return this.jobPositionRepository.getAll();
  }

  async getJobById(id: string) {
    return this.jobPositionRepository.get(id);
  }

  async createJob(createJobDto: any) {
    this.jobPositionRepository.create(createJobDto);
  }

  async updateJob(id: string, updateJobDto: any) {
    this.jobPositionRepository.update(id, updateJobDto);
  }

  async deleteJobById(id: string) {
    this.jobPositionRepository.delete(id);
  }

  async getJobSkills(id: string) {
    return this.jobPositionRepository.getSkills(id, { useRawQuery: true });
  }

  async getJobApplicants(id: string) {
    return this.jobPositionRepository.getApplicants(id);
  }

  async getJobBenefits(id: string) {
    return this.jobPositionRepository.getBenefits(id, { useRawQuery: true });
  }
}
