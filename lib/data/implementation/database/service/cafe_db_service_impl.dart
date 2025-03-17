import 'package:amary_cafe/data/implementation/database/entity/cafe_entity.dart';
import 'package:amary_cafe/data/implementation/database/service/cafe_db_service.dart';
import 'package:sqflite/sqflite.dart';

class CafeDbServiceImpl implements CafeDbService {
  final String _databaseName;
  final String _tableName;
  final int _version;

  CafeDbServiceImpl({
    required String databaseName,
    required String tableName,
    required int version,
  }) : _databaseName = databaseName,
       _tableName = tableName,
       _version = version;

  @override
  Future<List<CafeEntity>> getAllItem() async {
    final db = await _initializeDb();
    final results = await db.query(_tableName);

    return results.map((result) => CafeEntity.fromJson(result)).toList();
  }

  @override
  Future<CafeEntity> getItemById(String id) async {
    final db = await _initializeDb();
    final results = await db.query(
      _tableName,
      where: "id = ?",
      whereArgs: [id],
      limit: 1,
    );

    return results.map((result) => CafeEntity.fromJson(result)).first;
  }

  @override
  Future<int> insertItem(CafeEntity entity) async {
    final db = await _initializeDb();

    final data = entity.toJson();
    final id = await db.insert(
      _tableName,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return id;
  }

  @override
  Future<int> removeItem(String id) async {
    final db = await _initializeDb();

    final result = await db.delete(
      _tableName,
      where: "id = ?",
      whereArgs: [id],
    );

    return result;
  }

  Future<void> _createTables(Database database) async {
    await database.execute("""
        CREATE TABLE $_tableName(
          id TEXT PRIMARY KEY,
          name TEXT,
          description TEXT,
          pictureId TEXT,
          city TEXT,
          rating REAL
        )
      """);
  }

  Future<Database> _initializeDb() async {
    return openDatabase(
      _databaseName,
      version: _version,
      onCreate: (Database database, int version) async {
        await _createTables(database);
      },
    );
  }
}
