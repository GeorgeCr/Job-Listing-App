import { Injectable } from '@nestjs/common';
import { UsersRepository } from './users.repository';

@Injectable()
export class UsersService {
  constructor(private usersRepository: UsersRepository) {}

  async getUserByUsername(username: string) {
    return this.usersRepository.getByUsername(username);
  }

  async getUserById(id: string) {
    return this.usersRepository.get(id);
  }

  async getUserSkills(id: string) {
    return this.usersRepository.getSkills(id);
  }

  async getUserJobs(id: string) {
    return this.usersRepository.getJobs(id);
  }

  async applyForJob(userId: string, jobId: string) {
    return this.usersRepository.addJob(userId, jobId);
  }

  async editSkills(id: string, skills: any) {
    return this.usersRepository.editSkills(id, skills);
  }

  async acceptCandidate(
    id: string,
    jobId: string,
    candidateId: string,
    feedbackContent: string,
  ) {
    return this.usersRepository.acceptCandidate(
      id,
      jobId,
      candidateId,
      feedbackContent,
    );
  }

  async rejectCandidate(
    id: string,
    jobId: string,
    candidateId: string,
    feedbackContent: string,
  ) {
    return this.usersRepository.rejectCandidate(
      id,
      jobId,
      candidateId,
      feedbackContent,
    );
  }
}
