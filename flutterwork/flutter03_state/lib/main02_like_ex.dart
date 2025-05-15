import 'package:flutter/material.dart';
/*
  * state(변수)
    : 일반변수와 다른점은 변경이 되면 재랜더링을 해줌
    > state변수를 사용하려면 StatefulWidget 안에서 사용
 */

void main() {
  runApp( MyApp());
}


class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var num = 1;
  var like = [0,0,0];
  var name=['박나나', '홍길동', '김파랑','나여주'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(  //위치하단끝고정
          child: Text(num.toString()),
            onPressed: (){
              print('지역변수 num = $num');
              setState(() {
                num++; 
              });
            }),
        appBar: AppBar(backgroundColor: Color(0xFFf3edf7),
          leading: Icon(Icons.list),
          title: Text('주소록'),
          actions: [Icon(Icons.search),Icon(Icons.share)],
        ),
        //builder
        body: ListView.builder(
          itemBuilder: (c, i){    //context(부모정보), index(반복)
            return ListTile(
              leading: Text(like[i].toString(),style: TextStyle(fontSize: 15),),
              title: Text(name[i]),
              trailing: ElevatedButton(onPressed: (){
                setState(() {  //요기 안에 넣어야 재랜더링이 됨
                  like[i]++;
                });
              },
                  child: Text('좋아요')),
            );
          },
          itemCount: 3,   //반복될 숫자
        ),
        bottomNavigationBar: CustomBottom(),
      ),
    );
  }
}

class CustomBottom extends StatelessWidget {
  const CustomBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.call),
          Icon(Icons.article),
          Icon(Icons.account_box)
        ],
      ),
    );
  }
}




