import { Module } from '@nestjs/common';
import { JobPositionController } from './job-position.controller';
import { JobPositionService } from './job-position.service';

@Module({
  controllers: [JobPositionController],
  providers: [JobPositionService],
})
export class JobPositionModule {}
