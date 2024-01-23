import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { UsersModule } from './users/users.module';
import { ConfigModule } from '@nestjs/config';
import { JobPositionModule } from './job-position/job-position.module';
import { AuthModule } from './auth/auth.module';

@Module({
  imports: [ConfigModule.forRoot(), UsersModule, JobPositionModule, AuthModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
