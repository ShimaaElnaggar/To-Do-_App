import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDatabase{
  static Database? _database;
  Future<Database?> get database async{
    if(_database == null){
      _database = await initialDatabase();
      return _database;
    }else{
      return _database;
    }
  }

  initialDatabase()async{

    String databasePath = await getDatabasesPath();
    String path = join( databasePath , "todo.db");

    Database myDatabase = await openDatabase (
        path,
      onCreate: (Database database , int version)async{
          await database.execute('''
            CREATE TABLE "tasks" (
            id INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            date TEXT,
            time TEXT,
            status TEXT,
            )
          ''');
          print("Database is created");
      }
    );
  }


}