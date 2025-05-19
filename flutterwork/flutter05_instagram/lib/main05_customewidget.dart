import 'package:flutter/material.dart';
import 'package:flutter05_instagram/style.dart';
/*
  * 슬라이드

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
      body: [homepage(), Text('shop page')][tab],
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

// 0번누르면 나오는 homepage화면 만들어보기
class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (c, i) {
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/img/img1.jpg', width: 500, height: 250, fit: BoxFit.cover, ),
          Container(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('좋아요 100'),
              Text('글쓴이'),
              Text('글내용'),
            ],
          ),
          )
        ],
      );
    },
    );
  }
}

