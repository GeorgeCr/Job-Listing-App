export interface IRepository {
  getAll(): Promise<any>;
  get(id: string): Promise<object>;
  create(createJobDto: any): void;
  update(id: string, updateJobDto: any): void;
  delete(id: string): void;
}

interface IJobPositionRepository extends IRepository {
  getSkills(jobId: string, options: { useRawQuery: boolean }): Promise<any>;
  getApplicants(jobId: string, options: { useRawQuery: boolean }): Promise<any>;
  getBenefits(jobId: string, options: { useRawQuery: boolean }): Promise<any>;
}

interface IDataServices {
  jobs: IJobPositionRepository;
}

export { IDataServices, IJobPositionRepository };
