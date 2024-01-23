import {
  Body,
  Controller,
  Get,
  Param,
  Put,
  Post,
  Req,
  Delete,
} from '@nestjs/common';
import { UsersService } from './users.service';
import { SkipAuth } from 'src/decorators';

@Controller('user')
export class UsersController {
  constructor(private usersService: UsersService) {}

  @Get('/data')
  async getUserData(@Req() req) {
    console.log('user data here');
    const { userId } = req.session?.auth || {};
    return this.usersService.getUserData(userId);
  }

  @Get(':id/skills') // replace :id with user session
  async getUserSkills(@Param('id') id: string) {
    return this.usersService.getUserSkills(id);
  }

  @Get('/jobs') // replace :id with user session
  async getUserAppliedJobs(@Req() req) {
    return this.usersService.getUserJobs(req.session?.auth?.userId);
  }

  // add guard for user to be applicant role
  @SkipAuth()
  @Post('/jobs/:jobId/apply') // replace :userId with user session
  async applyForJob(@Req() req, @Param('jobId') jobId: string) {
    return this.usersService.applyForJob(req.session?.auth?.userId, jobId);
  }

  @Delete('/jobs/:jobId/apply')
  async removeJobApplication(@Req() req, @Param('jobId') jobId: string) {
    return this.usersService.removeJobApplication(
      req.session?.auth?.userId,
      jobId,
    );
  }

  @Put(':id/skills')
  async editUserSkills(@Param('id') id: string, @Body('skills') skills: any) {
    return this.usersService.editSkills(id, skills);
  }

  // add guard for user to be recruiter role
  @Post(':id/feedbacks/:jobId/candidates/:candidateId/accept')
  async acceptCandidate(
    @Param('id') id: string,
    @Param('jobId') jobId: string,
    @Param('candidateId') candidateId: string,
    @Body('feedbackContent') feedbackContent: string,
  ) {
    return this.usersService.acceptCandidate(
      id,
      jobId,
      candidateId,
      feedbackContent,
    );
  }

  // add guard for user to be recruiter role
  @Post(':id/feedbacks/:jobId/candidates/:candidateId/reject')
  async rejectCandidate(
    @Param('id') id: string,
    @Param('jobId') jobId: string,
    @Param('candidateId') candidateId: string,
    @Body('feedbackContent') feedbackContent: string,
  ) {
    return this.usersService.rejectCandidate(
      id,
      jobId,
      candidateId,
      feedbackContent,
    );
  }
}
