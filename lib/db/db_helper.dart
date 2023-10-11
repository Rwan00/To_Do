import 'package:sqflite/sqflite.dart';

import '../models/task.dart';

class DBHelper {
  static Database? _db;
  static const int _version = 1;
    static const String _tableName = "tasks";


  static Future<void> initDB() async {
    if (_db != null) {
      print("Not Null DB");
      return;
    } else {
      try {
        String _path = "${await getDatabasesPath()}task.db";
        print("in database path");
        _db = await openDatabase(_path, version: _version,
            onCreate: (Database db, int version) async {
          print("creating a new one");
          // When creating the db, create the table
          await db.execute(
              'CREATE TABLE $_tableName '
                  '(id INTEGER PRIMARY KEY AUTOINCREMENT, '
                  'title STRING, note STRING, date STRING, '
                  'startTime STRING, endTime STRING, '
                  'remind INTEGER, repeat STRING, '
                  'color INTEGER, '
                  'isCompleted INTEGER)'
          );
        });
        print("DB Created");
      } catch (e) {
        print(e);
      }
    }
  }

  static Future<int> insert(Task? task) async{
    print(":insert");
    return await _db!.insert(_tableName, task!.toJson());
  }
  static Future<int> delete(Task? task) async{
    print(":delete");
    return await _db!.delete(_tableName,where: "id= ?",whereArgs: [task!.id]);
  }
  static Future<List<Map<String,dynamic>>> query() async{
    print(":query");
    return await _db!.query(_tableName);
  }
  static Future<int> deleteAll() async{
    print(":deleteAll");
    return await _db!.delete(_tableName);
  }
  static Future<int> update(int id) async{
    print(":update");
    return await _db!.rawUpdate(
      '''
      UPDATE tasks
      SET isCompleted = ?
      WHERE id = ?
      
      ''',[1,id]
    );
  }
}
