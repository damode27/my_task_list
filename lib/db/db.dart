import 'task.dart';
import 'package:sqflite/sqflite.dart';

class DB {

  static Future<Database> _openDB () async {
    return openDatabase(
      'database_notas.db',
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE tasks(id INTEGER PRIMARY KEY AUTOINCREMENT, titulo TEXT, descripcion TEXT, fecha TEXT, terminada TEXT, fechaTermino TEXT, imagen TEXT)',
        );
      },
    );
  }

  static Future<int> insert(Task task) async {
    Database database = await _openDB();
    return database.insert('tasks', task.toMap());
  }

  static Future<int> delete(Task task) async {
    Database database = await _openDB();
    return database.delete('tasks', where: 'id = ?', whereArgs: [task.id]);
  }

  static Future<int> update(Task task) async {
    Database database = await _openDB();
    return database.update('tasks', task.toMap(), where: 'id = ?', whereArgs: [task.id]);
  }

  static Future<List<Task>> tasks() async {
    Database database = await _openDB();
    final List<Map<String, dynamic>> tasksMap = await database.query('tasks');

    return List.generate(
      tasksMap.length,
          (i) => Task(
            id: tasksMap[i]['id'],
            titulo: tasksMap[i]['titulo'],
            descripcion: tasksMap[i]['descripcion'],
            fecha: tasksMap[i]['fecha'],
            terminada: tasksMap[i]['terminada'],
            fechaTermino: tasksMap[i]['fechaTermino'],
            imagen: tasksMap[i]['imagen'],
          ),
    );
  }


}
