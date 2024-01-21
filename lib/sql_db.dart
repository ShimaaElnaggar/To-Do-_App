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
      version: 1,
      onCreate: (Database database , int version)async{
          await database.execute('''
            CREATE TABLE "tasks" (
            id INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            date TEXT,
            time TEXT,
            status TEXT,
            )
          ''').then((value) => print("Database is created"))
              .catchError((error){
                print(error);
              });

      },
      onOpen: (Database database){
          print("opened=============");
      },
      onUpgrade: (Database database , int oldVersion , int newVersion){
          print("OnUpgraded================================");
      },
    );
  }
  // readData(String sql) async{
  //   Database? myDatabase = await database;
  //   List <Map> response = await myDatabase!.rowQuery(sql);
  // }
  insertData(String sql) async{
    Database ? myDatabase = await database;
    myDatabase?.transaction(
            (txn) {
              txn.rawInsert(sql);
              return database;
            });

  }
  // deleteData(String sql) async{
  //   Database ? myDatabase = await database;
  //   int response = await myDatabase!.rowDelete(sql);
  // }
  // updateData(String sql) async{
  //   Database ? myDatabase = await database;
  //   int response = await myDatabase!.rowUpdate(sql);
  // }

}