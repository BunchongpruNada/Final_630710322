import 'package:flutter/material.dart';

import 'package:final_630710322/home/homepage.dart'; // นี่คือชื่อไฟล์ที่มีโค้ดฟอร์มของเรา

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Web Report App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ReportForm(),
    );
  }
}
