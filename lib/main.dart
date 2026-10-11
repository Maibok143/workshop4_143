import 'package:flutter/material.dart';
import 'screen/item.dart';

void main() {
  runApp(const MyApp());
}

// ข้อ 4 (ใบงานที่ 3) / ข้อ 11: MyApp คือหน้าแสดงรายการอาหาร
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("รายการอาหาร"),
          backgroundColor: Colors.orange,
          centerTitle: true,
        ),
        body: const Item(),
      ),
    );
  }
}