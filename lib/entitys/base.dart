import 'package:floor/floor.dart';

class Base {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String createdAt;
  final String updatedAt;

  Base(this.id, this.createdAt, this.updatedAt);
}
