import 'package:flutter/material.dart';

import 'presentation/pages/devices_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
