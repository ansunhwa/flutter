import 'package:flutter/material.dart';
/*
  * 박스의 margin, padding, 정렬위젯(Align())
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
        appBar: AppBar(title: Text('예제'),backgroundColor: Color(0xFFf3edf7)),
        /*body: Container(
          width: 100, height: 100, color: Colors.blueGrey,
          margin: EdgeInsets.all(20),
          //padding: EdgeInsets.all(20),
          padding: EdgeInsets.fromLTRB(20, 10, 0, 0),  //margin도 동일(상하좌우따로)
          child: Text('본문내용 입니다'),
        ),*/

       /* body: Center(   //alt+enter  //가운대로
          child: Container(
            width: 100, height: 100,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            child: Text('본문내용'),
      ),
    ),*/
    body: Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: double.infinity,
        color: Colors.blueGrey,
        child: Text('본문 박스', style: TextStyle(color: Colors.yellow),),
        padding: EdgeInsets.all(20),
      ),
    ),
          bottomNavigationBar: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.monitor_heart),
              Icon(Icons.shopping_bag),
              Icon(Icons.ac_unit)
            ],
          ),
      ),
    );
  }
}



