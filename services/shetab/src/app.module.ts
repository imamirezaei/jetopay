import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { databaseConfig } from './config/database.config';
import { AppController } from './app.controller';
import { AppService } from './app.service';

@Module({
  imports: [TypeOrmModule.forRoot(databaseConfig)],
  controllers: [AppController],  // اینجا کنترلر اضافه شده
  providers: [AppService],
})
export class AppModule {}
