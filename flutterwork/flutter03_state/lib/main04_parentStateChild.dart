import 'package:flutter/material.dart';
/*
  * 자식이 부모의 변수의 값을 사용하려면
    1. 부모가 자식에게 보내기
    2. 자식은 등록
    3. 자식이 사용
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
  var num = 5;
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
                  //1. 자식에게 보내기. 매개변수에 넣기(이름: 변수명(값))
                  return showdialog(num : num);

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
  //2. 자식은 등록하기  매개변수 넣고, this.이름(변수명)
  const showdialog({super.key, this.num});
  final num;    // 등록하기

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox( //컨테이너도 가능
        width: 300,
        height: 300,
        child: Column(
          children: [
            TextField(),
            // 3. 사용하기
            ElevatedButton(onPressed: (){}, child: Text(num.toString())),
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




