import 'package:flutter/material.dart';
import 'package:flutter05_instagram/style.dart';
/*
  * 탭 만들기
    순서
    1. state에 tab의 현재 상태 저장
    2. state에 따라 tab이 어떻게 보일지 작성
    3. 유저가 쉽게 state 조작할 수 있는 조작기능
 */

void main() {   // 원하는 감싸는게 안뜨면 widget으로 감싸고 바꿔주면 됨
  runApp(
      MaterialApp(
        theme: theme,
          home: const MyApp()
      )
  );
} 

var textColor = TextStyle(fontSize: 20, color: Colors.pinkAccent);


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // state변수
  var tab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('instagram'),
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.add))],
      ),
      body: [Text('Home page'), Text('shop page')][tab],  //tap하면 어떻게 보여줄 지
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (i) {  // (index), {함수}
            setState(() {  //움직이려면 setState()
              tab = i;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: 'home'),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'shop')
          ]
      )
    );
  }
}
