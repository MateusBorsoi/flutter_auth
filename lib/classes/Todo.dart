class Todo {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Todo(
      {required this.userId,
      required this.completed,
      required this.id,
      required this.title});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'userId': int userId,
        'id': int id,
        'title': String title,
        'completed': bool completed,
      } =>
        Todo(completed: completed, id: id, title: title, userId: userId),
      _ => throw const FormatException('Falha ao carregar lista todo'),
    };
  }
}
