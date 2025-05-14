import 'package:flutter/material.dart';
/*
  widget
  Meterial widget(구글) 과 Cupertino widget(ios)
   : 위젯을 사용하려면 반드시 2개 중 하나를 사용해야 그 안에 있는 디자인을 기반으로 위젯이 만들어 짐
     (미리 만들어 놓은 위젯들을 가져다 사용함)
     정상작동하려면 둘 중 하나로 감싸져 있어야 함(둘다사용가능)
     1. Meterial widget(구글) :  안드로이드용 위젯 MaterialApp()
     2. Cupertino widget(ios) : 아이폰용 위젯

     * widget의 종류
       1. Text() : 글씨 위젯 -> Text('출력하려고하는글씨')
       2. Image() : 이미지 위젯 -> Image.asset('이미지 url')
       3. Icon() : 아이콘 위젯 -> Icon(Icons.??) 이미지가 뜬다고 함
       4. Container() : 박스 위젯
 */

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( //ctrl+스페이스바
      //home: Text('글씨'),
      //home: Icon(Icons.star),
      //home: Image.asset('유니콘.png'),  //web브라우저에서 볼 때
      //home: Image.asset('assets/img/유니콘.png'),
    /*  home: Center(
        child: Container(
          color: Colors.lightBlue ,
          width: 50,
          height: 50,
        ),
      ),*/
      home: Container(
        child: Text('글씨 넣기'),
      ),

    );
  }
}
