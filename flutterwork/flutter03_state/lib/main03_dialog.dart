import 'package:flutter/material.dart';
/*
  * dialog 창 만들기

  - 매개변수로 context를 받아 사용하는 위젯들
    showDialog()
    Navigator()
    Theme.of()
    Scaffole.of()
    * MaterialApp이 MyApp을 감싸고 있어야 하는 경우 그래야 context값이 들어옴
 */

void main() {
  runApp(
    MaterialApp(
      home: MyApp()
    )
  );
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
    return Scaffold(
        floatingActionButton: FloatingActionButton(  //위치하단끝고정
          child: Text('dialog'),
            onPressed: (){
              showDialog(
                  context: context,
                  builder: (context){
                    return showdialog();
                  }
                );
              }
            ),
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
            );
          },
          itemCount: 3,   //반복될 숫자
        ),

        bottomNavigationBar: CustomBottom(),
      );
  }
}

class showdialog extends StatelessWidget {
  const showdialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox( //컨테이너도 가능
        width: 300,
        height: 300,
        child: Column(
          children: [
            TextField(),
            ElevatedButton(onPressed: (){}, child: Text('완료')),
            ElevatedButton(onPressed: (){Navigator.pop(context);}, child: Text('취소')) //현재페이지 뒤로
          ],
        ),
        
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




