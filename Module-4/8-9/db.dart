import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MyDB {
  late Database db;

  Future open() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, "demo1.db");
    print(path);

    db = await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
      db.execute(
        '''
        CREATE TABLE IF NOT EXISTS students1(
          id primary key,
          fName varchar(255) not null,
          lName varchar(255) not null,
          email varchar(255) not null
        );
        '''
      );
    });
    print("Table created");
  }
}