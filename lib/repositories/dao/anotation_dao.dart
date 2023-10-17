import 'package:app_auth/entitys/anotation.dart';
import 'package:app_auth/repositories/interfaces/RepositoryDaoInterface.dart';
import 'package:floor/floor.dart';

@dao
abstract class AnotationDao extends IRepositoryDaoInterface<Anotation> {
  @Query('SELECT * FROM Anotation')
  Future<List<Anotation>> getAllAnotation();

  @Query('SELECT titulo FROM Anotation')
  Stream<List<String>> getAnotationName();

  @Query('SELECT * FROM Anotation WHERE id = :id')
  Stream<Anotation?> getAnotationById(int id);

  @Query('DELETE FROM Anotation WHERE id = :id')
  Future<int?> removeAnotationById(int id);
}
