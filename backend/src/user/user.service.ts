import { Injectable } from '@nestjs/common';
import { UserRepository } from './user.repository';

@Injectable()
export class UserService {
  constructor(private userRepository: UserRepository) {}

  async getUserById(id: string) {
    return this.userRepository.get(id);
  }

  async getUserSkills(id: string) {
    return this.userRepository.getSkills(id);
  }

  async getUserJobs(id: string) {
    return this.userRepository.getJobs(id);
  }

  async applyForJob(userId: string, jobId: string) {
    return this.userRepository.addJob(userId, jobId);
  }

  async editSkills(id: string, skills: any) {
    return this.userRepository.editSkills(id, skills);
  }

  async acceptCandidate(
    id: string,
    jobId: string,
    candidateId: string,
    feedbackContent: string,
  ) {
    return this.userRepository.acceptCandidate(
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
    return this.userRepository.rejectCandidate(
      id,
      jobId,
      candidateId,
      feedbackContent,
    );
  }
}
