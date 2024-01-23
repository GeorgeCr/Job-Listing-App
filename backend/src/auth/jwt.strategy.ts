import { Injectable } from '@nestjs/common';
import { PassportStrategy } from '@nestjs/passport';
import { Strategy } from 'passport-jwt';
import { AuthService } from './auth.service';
import { jwtConstants } from './constants';

@Injectable()
export class JwtStrategy extends PassportStrategy(Strategy) {
  constructor(private authService: AuthService) {
    super({
      jwtFromRequest: JwtStrategy.fromServerSession,
      ignoreExpiration: false,
      secretOrKey: jwtConstants.secret,
    });
  }

  static fromServerSession(req: any) {
    const token = req?.session?.auth?.access_token;
    return token || null;
  }

  async validate(payload: any) {
    const { sub, username } = payload;
    return {
      userId: sub,
      username,
    };
  }
}
