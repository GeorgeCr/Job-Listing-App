import { IRepository } from '../types';

export class PrismaRepository implements IRepository {
  constructor(private repository: any) {}

  async getAll(): Promise<any> {
    return this.repository.getAll();
  }

  async get(id: string): Promise<object> {
    return this.repository.get(id);
  }

  async create(createDto: any): Promise<void> {
    this.repository.create(createDto);
  }

  async update(id: string, updateDto: any): Promise<void> {
    this.repository.update(id, updateDto);
  }

  async delete(id: string): Promise<void> {
    this.repository.delete(id);
  }
}
