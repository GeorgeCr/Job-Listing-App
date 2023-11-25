import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import Test from './test.entity';
import { Repository } from 'typeorm';

@Injectable()
export class TestService {
  constructor(
    @InjectRepository(Test) private testRepository: Repository<Test>,
  ) {}

  async getSecret(): Promise<Record<string, Test[]>> {
    const secrets = await this.testRepository.find();
    return { secrets };
  }
}
