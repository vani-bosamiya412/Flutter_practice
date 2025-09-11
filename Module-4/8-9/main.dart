import 'package:flutter/material.dart';
import 'package:sqfliteex/db.dart';

import 'add.dart';

void main() {
  runApp(MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false,));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MyDB db = MyDB();

  List<Map> sList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initDB();
  }

  Future initDB() async {
    await db.open();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SqfLite App"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: sList.map((s1) {
            return Card(
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text(s1["fName"]),
                subtitle: Text("Surname: ${s1["lName"]}, Email: ${s1["email"]}"),
              ),
            );
          }).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AddScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void getData() {
    Future.delayed(Duration(milliseconds: 500), () async {
      sList = await db.db.rawQuery("select * from students1");
      setState(() {

      });
    });
  }
}
