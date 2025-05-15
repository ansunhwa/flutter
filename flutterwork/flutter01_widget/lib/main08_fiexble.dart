import 'package:flutter/material.dart';
/*
  Fiexible() : flex와 비슷
    : 전체에서 ?% 자리차지 같은 것을 사용할 때 편리
    (Row(), Column() 과 같이 사용)

  * Expanded() : Fiexible과 유사
    : 나머지 부분들을 다 자리차지
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
        appBar: AppBar(
            //leading: Icon(Icons.list),   //왼쪽은 leading
            title: Text('강남역'),        //중간은 title
            actions: [Icon(Icons.search),Icon(Icons.list),Icon(Icons.favorite)], // 오른쪽은 actions
            backgroundColor: Color(0xFFf3edf7)
        ),
      /*  body: Column(
          children: [
            Flexible(child: Container(color: Colors.grey,), flex: 1,),  //상대적인 숫자
            Flexible(child: Container(color: Colors.orangeAccent,), flex: 2,),
            Flexible(child: Container(color: Colors.greenAccent,), flex: 3,)
          ],
        )*/
        body: Row(
          children: [
            Container(width: 100, color: Colors.pinkAccent,),  // 얘가 기준
            Expanded(child: Container(color: Colors.blueGrey)) //나머지 자리차지
            
          ],
        ),

      ),
    );
  }
}



