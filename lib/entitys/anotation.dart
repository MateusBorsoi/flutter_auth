import 'package:floor/floor.dart';

@Entity(tableName: 'Anotation')
class Anotation {
  @PrimaryKey(autoGenerate: true)
  int? id;
  final String titulo;
  final String observacao;

  Anotation({this.id, required this.observacao, required this.titulo});
}
