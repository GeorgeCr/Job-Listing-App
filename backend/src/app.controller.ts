import { Controller, Get, Res, Session } from '@nestjs/common';
import { AppService } from './app.service';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get('/health')
  async getHello(@Res() res, @Session() session): Promise<string> {
    console.log('session', session);
    return res.json('OK');
  }
}
