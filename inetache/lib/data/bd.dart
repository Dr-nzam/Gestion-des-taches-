import 'package:inetache/data/model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'gestion_des_taches.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE tache(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        titre TEXT,
        description TEXT,
        priorite INTEGER, 
        date TEXT,
        isDone INTEGER 
      )
    ''');
  }

  Future<void> insertTache(Tache tache) async {
    final db = await database;
    await db.rawInsert('''
      INSERT INTO tache (titre, description, priorite, date, isDone) 
      VALUES (?, ?, ?, ?, ?)
    ''', [tache.titre, tache.description, tache.priorite, tache.date, tache.isDone]);	
  }

Future<List<Tache>> getTaches() async {
  final db = await database;
  final List<Map<String, dynamic>> maps = await db.rawQuery('SELECT * FROM tache ORDER BY -id');

  return List.generate(maps.length, (i) {
    return Tache(
      id: maps[i]['id'],
      titre: maps[i]['titre'] ?? '', // Assurez-vous de gérer les valeurs nulles
      description: maps[i]['description'] ?? '',
      priorite: maps[i]['priorite'] ?? 0, // Utiliser une valeur par défaut
      date: maps[i]['date'] ?? '',
      isDone: maps[i]['isDone'] ?? 0, // Assurez-vous de gérer les valeurs nulles
    );
  });
}


    Future<void> terminerTache(Tache tache) async {
    final db = await database;

    await db.rawUpdate('''
      UPDATE tache 
      SET isDone = ?
      WHERE id = ?
    ''', [ tache.isDone, tache.id ]);
  }


  Future<void> updateTache(Tache tache) async {
    final db = await database;
    await db.rawUpdate('''
      UPDATE tache 
      SET titre = ?, description = ?, priorite = ?, date = ?
      WHERE id = ?
    ''', [tache.titre, tache.description, tache.priorite, tache.date,tache.id,]);
  }

  Future<String> deleteTache(int id) async {
    final db = await database;
    await db.rawDelete('''
      DELETE FROM tache 
      WHERE id = ?
    ''', [id]);
    return 'success';
  }
}
