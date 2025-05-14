import 'package:flutter/material.dart';
/*
  * Scaffold() : 화면을 top, body, bottom으로 나누어줌

  *배치
    - Row() : 위젯들을 가로로 배치
    - Column() : 위젯들을 세로로 배치
 */

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('앱제목')),   //top
        body: Text('본문내용'),  //body : 필수
        bottomNavigationBar:BottomAppBar(child: Text('하단바'))  // bottom
      ),
    );
  }
}





