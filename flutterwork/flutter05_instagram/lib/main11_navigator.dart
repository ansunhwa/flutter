import 'package:flutter/material.dart';
import 'package:flutter05_instagram/style.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/rendering.dart';  //스크롤에 관련된 함수 모음
/*
    Navigator : 화면간의 이동을 관리하는 스택구조의 네비게이션 시스템
     - Navigator.push(context, route) : 새로운 화면을 스택위에 추가
     - Navigator.pop(context) : 현재 화면을 스택에서 제거
     - Navigator.pushNamed(context, routeName) : 이름으로 등록된 경로로 이동
     - Navigator.pushReplacement(context, route) : 현재 화면을 새화면으로 교체
     - Navigator.pupUntil(context, predicate) : 특정 조건을 만족할 대까지 뒤로 감(삭제)
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

  addData(item) {  //값 하나 추가해주는 함수
    setState(() {
      feedItems.addAll(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('instagram'),
        actions: [IconButton(onPressed: (){
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => upload()));
        }, icon: Icon(Icons.add))],
      ),
      //future : feedItems -> future 객체를 넣는다. Future는 함수
      body: [homepage(feedItems: feedItems, addData:addData), Text('shop page')][tab],
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
class homepage extends StatefulWidget {
  const homepage({super.key, this.feedItems, this.addData});
  final feedItems;
  final addData;

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  //스크롤바의 위치를 기록해주는 함수
  var scroll = ScrollController();

  @override
  void initState() {
    super.initState();
    // 스크롤 이벤트리스너를 한번 등록
    scroll.addListener((){
      //print('스크롤 위치 변함');
     // print(scroll.position.pixels);  //스크롤이 위에서 부터 얼마나 내려왔는지 높이
      //print(scroll.position.maxScrollExtent); // 스크롤바를 최대 내릴 수 있는 높이
      //print(scroll.position.userScrollDirection); //스크롤 되는 방향
      if(scroll.position.pixels == scroll.position.maxScrollExtent) {
        //print('더이상 스크롤이 없습니다');
        getMore();   //바닥에 닿으면 호출
      }
    });  // addListener() : 리스너 스크롤 될 때마다 호출
  }

  getMore() async {
    var result = await http.get(Uri.parse('https://jioneproferssor.store/flutter/data/data.json'));
    if(result.statusCode == 200) {
      var result2 = jsonDecode(result.body);
      for(var item in result2) {
        widget.addData(item);   //생성자여서 widget  [{},{}] 이렇게 되어있음

        //widget.addData(result2);  {  }로만 되어있으면
      }
    } else {
      throw Exception('get server 실패');
    }

  }

  @override
  Widget build(BuildContext context) {
   if(widget.feedItems.isNotEmpty) {
     return ListView.builder(
       controller: scroll,
       itemCount: widget.feedItems.length,
       itemBuilder: (c, index) {
         return Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Image.network(widget.feedItems[index]['image']),
             //Image.asset('assets/img/img1.jpg', width: 500, height: 320),
             Container(
                 padding: EdgeInsets.all(20),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text('좋아요 ${widget.feedItems[index]['likes']}'),
                       Text('글쓴이 ${widget.feedItems[index]['user']}'),
                       Text('내용 ${widget.feedItems[index]['content']}'),
                     ]
                 )
             )
           ],
         );
       }
     );
   } else {
     return Center(child: CircularProgressIndicator(),);
   }
  }
}

class upload extends StatelessWidget {
  const upload({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text('이미지업로드'),
          IconButton(onPressed: (){
            Navigator.pop(context); //현재 창 닫기
          }, icon: Icon(Icons.favorite))
        ],
      )
    );
  }
}


