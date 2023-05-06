import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../model/MyNoteModel.dart';

class NotesDatabase {
  static final NotesDatabase instance = NotesDatabase._init();
  static Database? _database;

  NotesDatabase._init();

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initializeDB('Notes.db');
    return _database;
  }

  Future<Database> _initializeDB(String filepath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filepath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final boolType = 'BOOLEAN NOT NULL';
    final textType = 'TEXT NOT NULL';
    await db.execute('''
    CREATE TABLE Notes (
    ${NotesImpNames.id} $idType,
    ${NotesImpNames.pin} $boolType,
    ${NotesImpNames.title} $textType,
    ${NotesImpNames.content} $textType,
    ${NotesImpNames.createdTime} $textType,
      // id INTEGER PRIMARY KEY AUTOINCREMENT,
      // pin BOOLEAN NOT NULL,
      // title TEXT NOT NULL,
      // content TEXT NOT NULL,
      // createdTime TEXT NOT NULL
    )
    ''');
  }

  Future<Note?> InsertEntry(Note note) async {
    final db = await instance.database;
    final id = await db!.insert(NotesImpNames.TableName, note.toJson());
    return note.copy(id: id);
  }

  // Future<bool?> InsertEntry() async {
  //   final db = await instance.database;
  //   await db!.insert("Notes", {
  //     "pin": 0,
  //     "title": "This is my title DB",
  //     "content": "This is my notes content DB",
  //     "createdTime": "26 Jan 2022"
  //   });
  //   return true;
  // }

  Future<List<Note>> readAllNotes() async {
    final db = await instance.database;
    final orderBy = '${NotesImpNames.createdTime} ASC';
    final query_result =
        await db!.query(NotesImpNames.TableName, orderBy: orderBy);
    return query_result.map((json) => Note.fromJson(json)).toList();
  }

  Future<Note?> readOneNote(int id) async {
    final db = await instance.database;
    final map = await db!.query(NotesImpNames.TableName,
        columns: NotesImpNames.values,
        where: '${NotesImpNames.id}= ?',
        whereArgs: [id]);
    if (map.isNotEmpty) {
      return Note.fromJson(map.first);
    } else {
      return null;
    }
    //print(map);
  }

  Future updateNote(Note note) async {
    final db = await instance.database;
    await db!.update(NotesImpNames.TableName, note.toJson(),
        where: '${NotesImpNames.id} = ?', whereArgs: [note.id]);
  }

  Future delteNotes(Note note) async {
    final db = await instance.database;
    await db!.delete(NotesImpNames.TableName,
        where: '${NotesImpNames.id}= ?', whereArgs: [note.id]);
  }

  Future clsoeDB() async{
    final db = await instance.database;
    db!.close();
  }
}
