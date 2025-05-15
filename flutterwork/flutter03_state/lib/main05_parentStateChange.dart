import 'package:flutter/material.dart';
/*
  * 부모의 state를 자식이 변경하기
    1. 부모에서 수정 함수 만들기
    2. 자식은 state에 보내기(보내고, 등록하고, 사용)
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
  var like = [0,0,0];
  var name=['박나나', '홍길동', '김파랑'];

  //1. 수정함수 만들기
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
                  //2. 자식에게 보내기. 매개변수에 넣기(이름: 변수명(값))
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
  //3. 자식은 등록하기  매개변수 넣고, this.이름(변수명)
  const showdialog({super.key, this.frendState});
  final frendState;    // 등록하기

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox( //컨테이너도 가능
        width: 300,
        height: 300,
        child: Column(
          children: [
            TextField(),
            // 4. 사용하기
            ElevatedButton(onPressed: (){
              frendState(); // 함수 호출시 괄호 붙여준다
              Navigator.pop(context);
            }, child: Text('완료')),
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




