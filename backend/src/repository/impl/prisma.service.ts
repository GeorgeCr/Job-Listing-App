import { IDataServices } from '../types';
import { PrismaRepository } from './prisma.repository';

export class PrismaDataService implements IDataServices {
  constructor(public jobs: PrismaRepository) {}
}
