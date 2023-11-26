import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';

@Entity({ name: 'users' })
class User {
  @PrimaryGeneratedColumn('increment')
  id: number;

  @Column()
  role: string;

  @Column()
  username: string;

  @Column({ name: 'passwordhash' })
  passwordHash: string;

  @Column({ name: 'firstname' })
  firstName: string;

  @Column({ name: 'lastname' })
  lastName: string;

  @Column({ name: 'lasteducation' })
  lastEducation: string;
}

export default User;
