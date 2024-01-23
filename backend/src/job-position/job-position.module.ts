import { Module } from '@nestjs/common';
import { JobPositionController } from './job-position.controller';
import { JobPositionService } from './job-position.service';
import { JobPositionRepository } from './job-position.repository';

@Module({
  controllers: [JobPositionController],
  providers: [JobPositionService, JobPositionRepository],
})
export class JobPositionModule {}
