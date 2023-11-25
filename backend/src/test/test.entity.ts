import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
class Test {
  constructor() {}

  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  content: string;
}

export default Test;
