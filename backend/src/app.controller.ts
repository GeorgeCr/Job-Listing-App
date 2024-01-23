import {
  Controller,
  Get,
  Post,
  Req,
  Res,
  Session,
  UseGuards,
} from '@nestjs/common';
import { LocalAuthGuard } from './auth/local-auth.guard';
import { AuthService } from './auth/auth.service';
import { JwtAuthGuard } from './auth/jwt-auth.guard';
import { SkipAuth } from './decorators';
import { Response } from 'express';

@Controller()
export class AppController {
  constructor(private authService: AuthService) {}

  @SkipAuth()
  @Get('/health')
  async getHello(@Res() res): Promise<string> {
    return res.json({ success: 'OK' });
  }

  @SkipAuth()
  @UseGuards(LocalAuthGuard)
  @Post('auth/login')
  async login(@Req() req, @Res() res: Response, @Session() session) {
    const { access_token } = await this.authService.login(req.user);
    session.auth = {
      access_token,
      userId: req.user?.id,
    };
    res.json({
      authenticated: true,
    });
    return;
  }

  @SkipAuth()
  @UseGuards(JwtAuthGuard)
  @Get('protected-route')
  async getProtectedRoute(@Req() req) {
    return req.user;
  }
}
