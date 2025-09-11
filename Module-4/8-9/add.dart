import 'package:flutter/material.dart';
import 'package:sqfliteex/db.dart';
import 'package:sqfliteex/main.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  MyDB db = MyDB();

  TextEditingController fName = TextEditingController();
  TextEditingController lName = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    db.open();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Screen"),),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                controller: fName,
                decoration: InputDecoration(
                  hintText: "Enter First Name"
                ),
              ),
              SizedBox(height: 15,),
              TextFormField(
                controller: lName,
                decoration: InputDecoration(
                    hintText: "Enter Last Name"
                ),
              ),
              SizedBox(height: 15,),
              TextFormField(
                controller: email,
                decoration: InputDecoration(
                    hintText: "Enter Email"
                ),
              ),
              SizedBox(height: 15,),
              ElevatedButton(
                onPressed: () {
                  String f = fName.text.toString();
                  String l = lName.text.toString();
                  String e = email.text.toString();

                  db.db.rawInsert("insert into students1 (fName,lName,email) values (?,?,?)", [f,l,e]);

                  fName.clear();
                  lName.clear();
                  email.clear();
                  
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyApp()));
                },
                child: Text("Insert")
              )
            ],
          ),
        ),
      ),
    );
  }
}
