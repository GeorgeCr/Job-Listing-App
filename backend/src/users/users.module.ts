import { Module } from '@nestjs/common';
import { UsersController } from './users.controller';
import { UsersService } from './users.service';
import { UsersRepository } from './users.repository';
import { JwtAuthGuard } from 'src/auth/jwt-auth.guard';

@Module({
  imports: [],
  controllers: [UsersController],
  providers: [
    UsersService,
    UsersRepository,
    { provide: 'APP_GUARD', useClass: JwtAuthGuard },
  ],
  exports: [UsersService],
})
export class UsersModule {}
