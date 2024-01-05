import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { UserModule } from './user/user.module';
import { ConfigModule } from '@nestjs/config';
import { JobPositionModule } from './job-position/job-position.module';

@Module({
  imports: [ConfigModule.forRoot(), UserModule, JobPositionModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
