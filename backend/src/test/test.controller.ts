import { Controller, Get } from '@nestjs/common';
import { TestService } from './test.service';

@Controller('test')
export class TestController {
  constructor(private testService: TestService) {}

  @Get()
  async getSecret() {
    return {
      secrets: [
        {
          content: 'secret1',
        },
        {
          content: 'secret2',
        },
      ],
    };
  }
}
