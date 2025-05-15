import 'package:flutter/material.dart';
/*
  * ListView() 위젯
    : 같은 위젯이 반복적으로 들어갈 때
    - 스크롤바가 생김
    - 스크롤바의 위치 감시 기능
    - 메모리 절약 기능 : 스크롤을 아래로 내리면 위쪽에 가려지는 부분은 메모리에서 삭제하여 메모리 관리
    * ListTile
    * ListView.builder
 */

void main() {
  runApp(const MyApp());
}

/*
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(backgroundColor: Color(0xFFf3edf7),),
        body: ListView(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Image.asset('assets/img/icon1.png', width: 100,),
                    SizedBox(width: 10,),
                    Text('박나나',style: TextStyle(fontSize: 20))
                  ],
                ),
                Row(
                  children: [
                    Image.asset('assets/img/icon2.png',width: 100,),
                    SizedBox(width: 10,),
                    Text('홍길동', style: TextStyle(fontSize: 20),)
                  ],
                ),
                Row(
                  children: [
                    Image.asset('assets/img/icon3.png',width: 100,),
                    SizedBox(width: 10,),
                    Text('김파랑',style: TextStyle(fontSize: 20))
                  ],
                ),
                Row(
                  children: [
                    Image.asset('assets/img/icon4.png',width: 100,),
                    SizedBox(width: 10,),
                    Text('이안녕', style: TextStyle(fontSize: 20))
                  ],
                ),
              ],
              
            ),
          ],
        ),
        ),
      );
  }
}*/

//ListView에서 ListTile() : 같은 layout을 여러개 생성할 때
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(backgroundColor: Color(0xFFf3edf7),),
        /* body: ListView(
          children: [
            ListTile(
              leading: Image.asset('assets/img/icon1.png'),
              title: Text('박나나'),
            ),
            ListTile(
              leading: Image.asset('assets/img/icon2.png'),
              title: Text('홍길동'),
            ),
          ],
        )*/
        //builder
        body: ListView.builder(
          itemBuilder: (context, index){    //context(부모정보), index(반복)
            return Text('반복됨 $index');  // 반복될 내용
          },
          itemCount: 3,   //반복될 숫자
        ),
      ),
    );
  }
}





