import 'package:flutter/material.dart';
import 'package:latihan_login_api_rest/note_list.dart';
import 'package:get_it/get_it.dart';
import 'package:latihan_login_api_rest/note_service.dart';

void setupLocator() {
  GetIt.I.registerLazySingleton(() => NoteService());
}

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fluttter latihan api',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: NoteList(),
    );
  }
}
