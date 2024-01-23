import {
  Body,
  Controller,
  Get,
  Param,
  Post,
  Delete,
  Patch,
  Req,
} from '@nestjs/common';
import { JobPositionService } from './job-position.service';
import { SkipAuth } from 'src/decorators';

@Controller('job')
export class JobPositionController {
  constructor(private jobPositionService: JobPositionService) {}

  // @SkipAuth()
  @Get()
  async getAllJobs() {
    return this.jobPositionService.getAllJobs();
  }

  @SkipAuth()
  @Get(':id')
  async getJobById(@Param('id') id: string, @Req() req) {
    return this.jobPositionService.getJobById(id, req.session?.auth?.userId);
  }

  @Post()
  async createJob(@Body() createJobDto: any): Promise<void> {
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

  @SkipAuth()
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
