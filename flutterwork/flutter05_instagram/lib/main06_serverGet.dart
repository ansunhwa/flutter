import 'package:flutter/material.dart';
import 'package:flutter05_instagram/style.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
/*
    서버(DB)에서 데이터요청하여 얻어오기
    - get 요청

    * package설치 필요 : http
    * 안드로이드 인터넷사용 권한 설정
    * import 하기

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
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var result = await http.get(Uri.parse('https://jioneproferssor.store/flutter/data/data.json'));
    print(result.body);

    // json을 List로 변환 [{Map},{},{}]
    print(jsonDecode(result.body));

    var feedItems = jsonDecode(result.body);
    print(feedItems[0]['id']);

  }

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
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network('https://jioneproferssor.store/flutter/img/profile${index}.jpg'),
            //Image.asset('assets/img/img1.jpg', width: 500, height: 320),
            Container(
              child: Column(
                children: [
                  Text('글쓴이',style: TextStyle(fontSize: 15)),
                  Text('글쓴이',style: TextStyle(fontSize: 15)),
                  Text('글내용',style: TextStyle(fontSize: 15)),
                ]
            )
            )
          ],
        );
      },
    );
  }
}

