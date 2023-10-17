import 'package:app_auth/entitys/base.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'Anotation')
class Anotation extends Base {
  final String titulo;
  final String observacao;

  Anotation(super.createdAt, super.updatedAt,
      {required this.observacao, required this.titulo});
}
