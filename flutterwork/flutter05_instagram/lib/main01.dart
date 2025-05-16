import 'package:flutter/material.dart';
/*
  * ThemeData() : 스타일을 모아놓음
    : 파일에서 사용하거나 별도의 파일로 만들어서 사용
 */

void main() {   // 원하는 감싸는게 안뜨면 widget으로 감싸고 바꿔주면 됨
  runApp(
      MaterialApp(
          theme: ThemeData(// 스타일 넣어주면 됨
              iconTheme: IconThemeData(color: Colors.blue),
              appBarTheme: AppBarTheme(
                  color: Colors.lightGreen,
                  actionsIconTheme: IconThemeData(color: Colors.red)),
              textTheme: TextTheme(
                  bodyMedium: TextStyle(color: Colors.indigo)
              )
          ),
          home: const MyApp()
      )
  );
}

var textColor = TextStyle(fontSize: 20, color: Colors.pinkAccent);


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [Icon(Icons.heart_broken)],),
      body: Column(
        children: [
          Icon(Icons.favorite),
          Text('안녕'),
          Text('별도의 스타일 : 변수에 저장', style: textColor)  //변수로 만들어서 넣어줌
        ],
      ),
    );
  }
}
