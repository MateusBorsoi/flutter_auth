import 'package:app_auth/entitys/base.dart';
import 'package:floor/floor.dart';

abstract class IRepositoryDaoInterface<Table extends Base> {
  @insert
  Future<int> insertItem(Table item);

  @update
  Future<int> updateItem(Table item);

  @delete
  Future<int> deleteItem(Table item);
}
