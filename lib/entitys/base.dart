import 'package:floor/floor.dart';

class Base {
  @PrimaryKey(autoGenerate: true)
  int? id;

  final String createdAt;
  final String updatedAt;

  Base(this.createdAt, this.updatedAt);
}
