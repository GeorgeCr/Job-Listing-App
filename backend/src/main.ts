import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';
import session from 'express-session';
import cookieParser from 'cookie-parser';
import pg from 'pg';
import PgStorage from 'connect-pg-simple';
import { NestExpressApplication } from '@nestjs/platform-express';

const pgPool = new pg.Pool({
  user: 'postgres',
  password: 'test123$',
  database: 'JobListing',
});
const Storage = PgStorage(session);

async function bootstrap() {
  const app = await NestFactory.create<NestExpressApplication>(AppModule);

  app.set('trust proxy', 1);

  app.enableCors({
    credentials: true,
    origin: 'http://localhost:3000',
  });

  app.use(cookieParser());

  app.use(
    session({
      store: new Storage({
        pool: pgPool,
        tableName: 'UserSessions',
        createTableIfMissing: true,
      }),
      name: 'job-listing',
      cookie: { sameSite: 'lax', maxAge: 10000 * 1000, secure: false },
      secret: 'nasa-secret',
      resave: true,
      saveUninitialized: true,
      rolling: true,
    }),
  );

  const config = new DocumentBuilder()
    .setTitle('Job Listing API')
    .setDescription('Job Listing API methods for each Domain entity')
    .setVersion('1.0')
    .build();

  const document = SwaggerModule.createDocument(app, config);
  SwaggerModule.setup('api', app, document);

  await app.listen(8080);
}
bootstrap();
