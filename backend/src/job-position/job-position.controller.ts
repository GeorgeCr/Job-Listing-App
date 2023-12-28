import {
  Body,
  Controller,
  Get,
  Param,
  Post,
  Delete,
  Patch,
} from '@nestjs/common';
import { JobPositionService } from './job-position.service';

@Controller('job')
export class JobPositionController {
  constructor(private jobPositionService: JobPositionService) {}

  @Get()
  async getAllJobs() {
    return this.jobPositionService.getAllJobs();
  }

  @Get(':id')
  async getJobById(@Param('id') id: string) {
    return this.jobPositionService.getJobById(id);
  }

  @Post()
  async createJob(@Body() createJobDto: any): Promise<void> {
    console.log('matching', createJobDto);
    this.jobPositionService.createJob(createJobDto);
  }

  @Patch(':id')
  async updateJob(
    @Param('id') id: string,
    @Body() updateJobDto: any,
  ): Promise<void> {
    this.jobPositionService.updateJob(id, updateJobDto);
  }

  @Delete(':id')
  async deleteJobById(@Param('id') id: string) {
    return this.jobPositionService.deleteJobById(id);
  }

  @Get(':id/skills')
  async getJobSkills(@Param('id') id: string) {
    return this.jobPositionService.getJobSkills(id);
  }

  @Get(':id/applicants')
  async getJobApplicants(@Param('id') id: string) {
    return this.jobPositionService.getJobApplicants(id);
  }

  @Get(':id/benefits')
  async getJobBenefits(@Param('id') id: string) {
    return this.jobPositionService.getJobBenefits(id);
  }
}
