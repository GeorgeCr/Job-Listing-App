import { Injectable } from '@nestjs/common';

@Injectable()
export class JobPositionService {
  async getAllJobs() {
    return {
      content: 'test',
    };
  }
}
