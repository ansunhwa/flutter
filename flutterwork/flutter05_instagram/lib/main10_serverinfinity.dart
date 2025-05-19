import 'package:flutter/material.dart';
import 'package:flutter05_instagram/style.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/rendering.dart';  //스크롤에 관련된 함수 모음
/*
  * 무한스크롤
      스크롤이 바닥에 닿으면 데이터를 얻어와서 보여주기
    *
    1. import하기
    2. 스크롤의 상태를 파악하기 위해 Home을 stateful로 변경
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
      feedItems.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('instagram'),
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.add))],
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

