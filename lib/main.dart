import 'dart:io';
import 'package:my_study_project/home_page.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:flutter/material.dart';

void main(){ 
  if (Platform.isWindows || Platform.isLinux) {
    // Initialize FFI
    // aşağıdaki fonksiyon sistemle uyumlu ffi bulur ve sisteme entegre eder
    sqfliteFfiInit();
  }
  // Mevcut FFi uyumlu olan ile değştirir.
  databaseFactory = databaseFactoryFfi;





runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: MyWidget()));}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage(),
    );
  }
}