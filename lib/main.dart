import 'package:flutter/material.dart';
import 'package:test_project/pages/devices_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Devices Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DevicesPage(),
    );
  }
}
