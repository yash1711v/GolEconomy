import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/task/task.dart';

class DBService {
  static final DBService _instance = DBService._internal();
  factory DBService() => _instance;
  DBService._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'tasks.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE tasks (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        description TEXT NOT NULL,
        dueDate TEXT NOT NULL,
        priority TEXT NOT NULL,
        isCompleted INTEGER NOT NULL
      )
    ''');
  }

  Future<void> insertTask(Task task) async {
    final db = await database;
    await db.insert('tasks', {
      'id': task.id,
      'title': task.title,
      'description': task.description,
      'dueDate': task.dueDate.toString(),
      'priority': task.priority,
      'isCompleted': task.isCompleted ? 1 : 0, // Convert boolean to integer
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Task>> fetchTasks() async {
    final db = await database;
    final maps = await db.query('tasks');
    return List.generate(maps.length, (i) {
      final map = maps[i];
      return Task(
        id: map['id'] as int?,
        title: map['title'] as String,
        description: map['description'] as String,
        dueDate: DateTime.parse(map['dueDate'].toString()),
        priority: map['priority'] as String,
        isCompleted: (map['isCompleted'] as int) == 1, // Convert integer to boolean
      );
    });
  }

  Future<void> updateTask(Task task) async {
    final db = await database;
    await db.update('tasks', {
      'title': task.title,
      'description': task.description,
      'dueDate': task.dueDate,
      'priority': task.priority,
      'isCompleted': task.isCompleted ? 1 : 0, // Convert boolean to integer
    }, where: 'id = ?', whereArgs: [task.id]);
  }

  Future<void> deleteTask(int id) async {
    final db = await database;
    await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }
}
