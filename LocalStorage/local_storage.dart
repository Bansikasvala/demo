import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DemoLocalStorage extends StatefulWidget {
  const DemoLocalStorage({Key? key}) : super(key: key);

  @override
  State<DemoLocalStorage> createState() => _DemoLocalStorageState();
}

class _DemoLocalStorageState extends State<DemoLocalStorage> {
  Database? database;

  Future<void> createDB() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');

    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, age INTEGER)');
    });
  }

  Future<void> insertData() async {
    await database!.insert('Test', {
      "id": "2",
      "name": "abcdc1",
      "age": "24",
    });
  }

  Future<void> getData() async {
    List<Map<String, dynamic>> data = await database!.query('Test');
    print('DATA ${data}');
  }

  Future<void> updateData() async {
    database!.update(
        'Test',
        {
          "id": "1",
          "name": "xyz",
          "age": "30",
        },
        where: 'name=?',whereArgs: ["xyz"]);
  }
  Future<void> deleteData() async {
    database!.delete(
        'Test',
        where: 'name=?',whereArgs: ["xyz"]);
  }

  @override
  initState() {
    createDB();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                insertData();
              },
              child: const Text('INSERT'),
            ),
            ElevatedButton(
              onPressed: () {
                getData();
              },
              child: const Text('GET DATA'),
            ),
            ElevatedButton(
              onPressed: () {
                updateData();
              },
              child: const Text('UPDATE DATA'),
            ),
            ElevatedButton(
              onPressed: () {
                deleteData();
              },
              child: const Text('DELETE DATA'),
            ),
          ],
        ),
      ),
    );
  }
}
