import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';
import session from 'express-session';

async function bootstrap() {
  const app = await NestFactory.create(AppModule, { cors: true });

  app.use(
    session({
      name: 'job-listing',
      cookie: {},
      secret: 'nasa-secret',
      resave: false,
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
