// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:todo_mock/ui/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SQLite + API Mock',
      theme: ThemeData(
          primarySwatch: Colors.indigo, canvasColor: Colors.transparent),
      //Our only screen/page we have
      home: const HomePage(title: 'SQLite + API Mock'),
    );
  }
}
