import { Controller, Get } from '@nestjs/common';
import { JobPositionService } from './job-position.service';

@Controller('job')
export class JobPositionController {
  constructor(private jobPositionService: JobPositionService) {}

  @Get('/')
  async getAllJobs() {
    return this.jobPositionService.getAllJobs();
  }
}
