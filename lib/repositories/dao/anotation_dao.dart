import 'package:app_auth/entitys/anotation.dart';
import 'package:floor/floor.dart';

@dao
abstract class AnotationDao {
  @Query('SELECT * FROM Anotation')
  Future<List<Anotation>> getAllAnotation();

  @Query('SELECT titulo FROM Anotation')
  Stream<List<String>> getAnotationName();

  @Query('SELECT * FROM Anotation WHERE id = :id')
  Stream<Anotation?> getAnotationById(int id);

  @insert
  Future<int> insertItem(Anotation anotation);

  @update
  Future<int> updateItem(Anotation anotation);

  @delete
  Future<int> deleteItem(Anotation anotation);
}
