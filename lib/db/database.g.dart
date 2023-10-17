// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  AnotationDao? _anotationDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Anotation` (`titulo` TEXT NOT NULL, `observacao` TEXT NOT NULL, `id` INTEGER PRIMARY KEY AUTOINCREMENT, `createdAt` TEXT NOT NULL, `updatedAt` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  AnotationDao get anotationDao {
    return _anotationDaoInstance ??= _$AnotationDao(database, changeListener);
  }
}

class _$AnotationDao extends AnotationDao {
  _$AnotationDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _anotationInsertionAdapter = InsertionAdapter(
            database,
            'Anotation',
            (Anotation item) => <String, Object?>{
                  'titulo': item.titulo,
                  'observacao': item.observacao,
                  'id': item.id,
                  'createdAt': item.createdAt,
                  'updatedAt': item.updatedAt
                },
            changeListener),
        _anotationUpdateAdapter = UpdateAdapter(
            database,
            'Anotation',
            ['id'],
            (Anotation item) => <String, Object?>{
                  'titulo': item.titulo,
                  'observacao': item.observacao,
                  'id': item.id,
                  'createdAt': item.createdAt,
                  'updatedAt': item.updatedAt
                },
            changeListener),
        _anotationDeletionAdapter = DeletionAdapter(
            database,
            'Anotation',
            ['id'],
            (Anotation item) => <String, Object?>{
                  'titulo': item.titulo,
                  'observacao': item.observacao,
                  'id': item.id,
                  'createdAt': item.createdAt,
                  'updatedAt': item.updatedAt
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Anotation> _anotationInsertionAdapter;

  final UpdateAdapter<Anotation> _anotationUpdateAdapter;

  final DeletionAdapter<Anotation> _anotationDeletionAdapter;

  @override
  Future<List<Anotation>> getAllAnotation() async {
    return _queryAdapter.queryList('SELECT * FROM Anotation',
        mapper: (Map<String, Object?> row) => Anotation(row['id'] as int?,
            row['createdAt'] as String, row['updatedAt'] as String,
            observacao: row['observacao'] as String,
            titulo: row['titulo'] as String));
  }

  @override
  Stream<List<String>> getAnotationName() {
    return _queryAdapter.queryListStream('SELECT titulo FROM Anotation',
        mapper: (Map<String, Object?> row) => row.values.first as String,
        queryableName: 'Anotation',
        isView: false);
  }

  @override
  Stream<Anotation?> getAnotationById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Anotation WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Anotation(row['id'] as int?,
            row['createdAt'] as String, row['updatedAt'] as String,
            observacao: row['observacao'] as String,
            titulo: row['titulo'] as String),
        arguments: [id],
        queryableName: 'Anotation',
        isView: false);
  }

  @override
  Future<int> insertItem(Anotation item) {
    return _anotationInsertionAdapter.insertAndReturnId(
        item, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateItem(Anotation item) {
    return _anotationUpdateAdapter.updateAndReturnChangedRows(
        item, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteItem(Anotation item) {
    return _anotationDeletionAdapter.deleteAndReturnChangedRows(item);
  }
}
