import 'package:flutter/material.dart';
import 'package:form/data/moor_database.dart';
import 'package:form/screen/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => AppDatabase(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.orangeAccent,
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
