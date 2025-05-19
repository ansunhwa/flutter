import 'package:flutter/material.dart';
import 'package:flutter05_instagram/style.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
/*
     * 서버(DB)에서 데이터 요청하여 얻어오기
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
  var feedItems = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    await Future.delayed(Duration(seconds: 3));  // 딜레이를 넣음
    var result = await http.get(Uri.parse('https://jioneproferssor.store/flutter/data/data.json'));
    if(result.statusCode == 200) {
    // json을 List로 변환 [{Map},{},{}]
    var result2 = jsonDecode(result.body);
    setState(() {   //넣어야 재 랜더링
      feedItems = result2;
    });
    } else {
      throw Exception('get server 실패');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('instagram'),
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.add))],
      ),
      body: [homepage(feedItems: feedItems,), Text('shop page')][tab],
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
  const homepage({super.key, this.feedItems});
  final feedItems;

  @override
  Widget build(BuildContext context) {
   if(feedItems.isNotEmpty) {
     return ListView.builder(
       itemCount: 3,
       itemBuilder: (c, index) {
         return Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Image.network('https://jioneproferssor.store/flutter/img/profile${index}.jpg'), //Image.network(feedItems[i]['image']
             //Image.asset('assets/img/img1.jpg', width: 500, height: 320),
             Container(
                 padding: EdgeInsets.all(20),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text('좋아요 ${feedItems[index]['likes']}'),
                       Text('글쓴이 ${feedItems[index]['user']}'),
                       Text('내용 ${feedItems[index]['content']}'),
                     ]
                 )
             )
           ],
         );
       }
     );
   } else {
     //return Text('로딩중');
     return Center(child: CircularProgressIndicator(),);
   }
  }
}

