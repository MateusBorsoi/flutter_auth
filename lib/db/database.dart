import 'dart:async';
import 'package:app_auth/entitys/anotation.dart';
import 'package:app_auth/repositories/dao/anotation_dao.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [Anotation])
abstract class AppDatabase extends FloorDatabase {
  AnotationDao get anotationDao;
}
