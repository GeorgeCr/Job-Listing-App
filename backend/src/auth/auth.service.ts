import { Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { UsersService } from 'src/users/users.service';
import bcrypt from 'bcrypt';

@Injectable()
export class AuthService {
  constructor(
    private usersService: UsersService,
    private jwtService: JwtService,
  ) {}

  async validateUser(username: string, password: string) {
    const user = await this.usersService.getUserByUsername(username);
    if (!user?.password) {
      return null;
    }
    const doesPasswordMatch = await bcrypt.compare(password, user.password);

    if (doesPasswordMatch) {
      // eslint-disable-next-line @typescript-eslint/no-unused-vars
      const { password, ...result } = user;
      return result;
    }

    return null;
  }

  async login(user: any) {
    const { username, id } = user;
    const payload = { username, sub: id };

    return {
      access_token: this.jwtService.sign(payload),
    };
  }
}
