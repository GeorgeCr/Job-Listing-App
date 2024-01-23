import { PrismaClient } from '@prisma/client';
import {
  jobs,
  skills,
  users,
  benefits,
  bestCompany,
  worstCompany,
  goodFeedback,
  badFeedback,
} from './seed_data.json';

const client = new PrismaClient();

const seed = async () => {
  for await (const user of users) {
    await client.users.create({
      data: {
        ...user,
        collaborationType: Math.random() < 0.5 ? 'CIM' : 'B2B',
        skills: {
          createMany: { data: [...skills] },
        },
        jobs: {
          connectOrCreate: [
            {
              create: {
                title: 'Dream Job SE',
                description: 'Some dream job',
                applicantsCount: 0,
                salary: Math.floor(Math.random() * (2501 - 300) + 300) * 10,
                collaborationType: Math.random() < 0.5 ? 'CIM' : 'B2B',
              },
              where: {
                id: 'test',
              },
            },
          ],
        },
        feedbacks: {
          create: [
            {
              ...(Math.round(Math.random() * 10) % 2 === 0
                ? goodFeedback
                : badFeedback),
              job: {
                create: {
                  title: 'Software Engineer',
                  description: 'Database Administrator',
                  applicantsCount: 0,
                  salary: Math.floor(Math.random() * (2501 - 300) + 300) * 10,
                  collaborationType: Math.random() < 0.5 ? 'CIM' : 'B2B',
                },
              },
            },
          ],
        },
      },
    });
  }

  for (const job of jobs) {
    await client.jobs.create({
      data: {
        ...job,
        salary: Math.floor(Math.random() * (2501 - 300) + 300) * 10,
        collaborationType: Math.random() < 0.5 ? 'CIM' : 'B2B',
        skills: {
          createMany: { data: [...skills] },
        },
        benefits: {
          createMany: {
            data: [...benefits],
          },
        },
        company: {
          create: {
            ...(Math.round(Math.random() * 10) % 2 === 0
              ? bestCompany
              : worstCompany),
          },
        },
      },
    });
  }

  //   const users = await client.users.create({
  //     data: {
  //       role: 'Applicant',
  //       username: 'geo98',
  //       firstName: 'George',
  //       lastName: 'Craciun',
  //       hobbies: 'PC Games, cooking',
  //       lastEducation: 'Masters',
  //       skills: {
  //         createMany: {
  //           data: [
  //             {
  //               name: 'JavaScript',
  //               seniority: 'Senior',
  //             },
  //             {
  //               name: 'CSS',
  //               seniority: 'Mid',
  //             },
  //             {
  //               name: 'HTML',
  //               seniority: 'Expert',
  //             },
  //             {
  //               name: 'PostgreSQL',
  //               seniority: 'Mid',
  //             },
  //           ],
  //         },
  //       },
  //       jobs: {
  //         create: [
  //           {
  //             description: 'Awesome job description',
  //             applicantsCount: 20,
  //             company: {
  //               create: {
  //                 name: 'Perfect Company',
  //                 location: 'Romania',
  //               },
  //             },
  //           },
  //         ],
  //       },
  //     },
  //   });
};

seed()
  .then(() => {
    client.$disconnect();
  })
  .catch(async (err) => {
    console.error(err);
    client.$disconnect();
    process.exit(1);
  });
