import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/chat_message.dart';

class DatabaseService {
  static Database? _database;
  
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  initDB() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'chat_app.db'),
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE messages(
            id TEXT PRIMARY KEY,
            message TEXT,
            timestamp TEXT
          )
        ''');
      },
      version: 1,
    );
  }

  Future<void> insertMessage(ChatMessage message) async {
    final db = await database;
    await db.insert(
      'messages',
      message.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<ChatMessage>> getMessages() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('messages');

    return List.generate(maps.length, (i) {
      return ChatMessage.fromMap(maps[i]);
    });
  }
}
