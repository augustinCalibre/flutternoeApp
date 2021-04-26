import 'package:challenge_note/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '';


import 'dataBase/moor_database.dart';

 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: null,
      
      builder: (BuildContext context) { AppDatabase(); },
      child:MaterialApp(
      title: 'Material App',
      home: Home())
          );
  }
}