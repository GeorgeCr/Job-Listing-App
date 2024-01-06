import { Body, Controller, Get, Param, Put, Post } from '@nestjs/common';
import { UserService } from './user.service';

@Controller('user')
export class UserController {
  constructor(private userService: UserService) {}

  @Get(':id') // replace :id with user session
  async getUserById(@Param('id') id: string) {
    return this.userService.getUserById(id);
  }

  @Get(':id/skills') // replace :id with user session
  async getUserSkills(@Param('id') id: string) {
    return this.userService.getUserSkills(id);
  }

  @Get(':id/jobs') // replace :id with user session
  async getUserAppliedJobs(@Param('id') id: string) {
    return this.userService.getUserJobs(id);
  }

  // add guard for user to be applicant role
  @Post(':userId/jobs/:jobId/apply') // replace :userId with user session
  async applyForJob(
    @Param('userId') userId: string,
    @Param('jobId') jobId: string,
  ) {
    return this.userService.applyForJob(userId, jobId);
  }

  @Put(':id/skills')
  async editUserSkills(@Param('id') id: string, @Body('skills') skills: any) {
    return this.userService.editSkills(id, skills);
  }

  // add guard for user to be recruiter role
  @Post(':id/feedbacks/:jobId/candidates/:candidateId/accept')
  async acceptCandidate(
    @Param('id') id: string,
    @Param('jobId') jobId: string,
    @Param('candidateId') candidateId: string,
    @Body('feedbackContent') feedbackContent: string,
  ) {
    return this.userService.acceptCandidate(
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
    return this.userService.rejectCandidate(
      id,
      jobId,
      candidateId,
      feedbackContent,
    );
  }
}
