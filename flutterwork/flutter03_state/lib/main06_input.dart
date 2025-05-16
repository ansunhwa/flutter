import 'package:flutter/material.dart';
/*
  * input
    : TextField()는 저장되지 않음. 별도의 변수에 저장
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
  var total = 3;
  var name=['박나나', '홍길동', '김파랑'];

  addFriend() {
    setState(() {
      total++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(  //위치하단끝고정
          child: Text('dialog'),
          onPressed: (){
            showDialog(
                context: context,
                builder: (context){
                  return showdialog(frendState : addFriend);
                }
            );
          }
      ),
      appBar: AppBar(backgroundColor: Color(0xFFf3edf7),
        leading: Icon(Icons.list),
        title: Text(total.toString()),
        actions: [Icon(Icons.search),Icon(Icons.share)],
      ),

      //builder
      body: ListView.builder(
        itemBuilder: (c, i){    //context(부모정보), index(반복)
          return ListTile(
            leading: Image.asset('assets/img/icon${i+1}.png',width: 100,),
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
  showdialog({super.key, this.frendState});
  final frendState;    // 등록하기
  var inputDate = TextEditingController();   // <- 여기
  var inputDate2 = '';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox( //컨테이너도 가능
        width: 300,
        height: 300,
        child: Column(
          children: [
            // 사용시 (controller : 변수명) : controller는 입력값을 관리하는 역할
            //TextField(controller: inputDate),
            TextField(onChanged: (text){inputDate2 = text;},),
            ElevatedButton(
                onPressed: (){
              frendState(); // 함수 호출시 괄호 붙여준다
              print(inputDate);
              //Navigator.pop(context);
            }, child: Text('완료')),
            ElevatedButton(onPressed: (){Navigator.pop(context);}, child: Text('취소')), //현재페이지 뒤로
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




