import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFFf3edf7),
            leading: Icon(Icons.list),  // 왼쪽
            title: Text('MyApp'),
            actions: [Icon(Icons.search), Icon(Icons.favorite)],  // 오른쪽
          ),
          body: Text('본문')
      ),
    );
  }
}



