import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter05_instagram/style.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/rendering.dart';

import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:intl/intl.dart';
/*
    이름을 클릭하면 profile 창 띄우기
      - GestureDetector() : 제스처를 감지할 수 있도록 도와주는 위젯
        속성
        -----------------------------------------------
        onTap 한번클릭하면
        onDoubleTap 더블클릭하면
        onLongPress 길게 누르면
        onPauUpdate 드래그 위치감지
        onHorizontalDragStart 가로드래그
        onVerticalDragStart 세로드래그
 */

void main() {
  runApp(
      MaterialApp(
        theme: theme,
        home: const MyApp(),
      )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var tab = 0;
  var feedItems = [];
  var userImage;
  var userContent;

  setUserContent(newContent) {
    setState(() {
      userContent = newContent;
    });
  }

  addMyData() {
    String formattedDate = DateFormat('MMM dd').format(DateTime.now());

    var myData = {
      "id": feedItems.length,
      "image": userImage,
      "likes": 0,
      "date": formattedDate,
      "content": userContent,
      "liked": false,
      "user": "Jennifer"
    };
    setState(() {
      feedItems.insert(0, myData);
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var result = await http.get(Uri.parse('https://jioneproferssor.store/flutter/data/data.json'));
    if(result.statusCode == 200) {
      var result2 = jsonDecode(result.body);
      setState(() {
        feedItems = result2;
      });
    } else {
      throw Exception('get server data 실패');
    }
  }

  addData(item) {
    setState(() {
      feedItems.addAll(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram'),
        actions: [
          IconButton(
              onPressed: () async{
                var picker = ImagePicker();
                var image = await picker.pickImage(source: ImageSource.gallery);
                // ImageSource.camera  -> 카메라로 직접 찍음
                // picker.pickMultiImage() -> 이미지 여러개 선택. 리스트로 들어옴
                if(image != null) {
                  userImage = File(image.path);
                }

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Upload(
                            userImage : userImage,
                            setUserContent : setUserContent,
                            addMyData : addMyData
                        )
                    )
                );
              },
              icon: Icon(Icons.add_box_outlined)
          )
        ],
      ),
      body: [Home(feedItems : feedItems, addData : addData), Text('Shop Page')][tab],
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (i) {
            setState(() {
              tab = i;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: 'Shop')
          ]
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key, this.feedItems, this.addData});
  final feedItems;
  final addData;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var scroll = ScrollController();
  bool isLoading = false;
  bool hasMore = true;
  int page = 1;

  @override
  void initState() {
    super.initState();
    scroll.addListener((){
      if(scroll.position.pixels == scroll.position.maxScrollExtent) {
        getMore();
      }
    });
  }

  getMore() async{
    if(isLoading || !hasMore) {
      return;
    }
    var result = await http.get(Uri.parse('https://jioneproferssor.store/flutter/data/data$page.json'));
    if(result.statusCode == 200) {
      var result2 = jsonDecode(result.body);
      if(result2.isEmpty) {
        hasMore = false;
      } else {
        widget.addData(result2);
        page++;
      }
    } else {
      hasMore = false;
      throw Exception('get server data 실패');
    }
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    if(widget.feedItems.isNotEmpty) {
      return ListView.builder(
          controller: scroll,
          itemCount: widget.feedItems.length,
          itemBuilder: (c, i) {
            return Column(
              children: [
                widget.feedItems[i]['image'].runtimeType == String
                    ? Image.network(widget.feedItems[i]['image'])
                    : Image.file(widget.feedItems[i]['image']),
                Container(
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('좋아요  ${widget.feedItems[i]['likes']}'),
                        GestureDetector(
                            child: Text('글쓴이  ${widget.feedItems[i]['user']}'),
                          onTap: (){
                              Navigator.push(context,
                                // MaterialPageRoute(builder: (context) => Profile())  // 깜빡!
                                //CupertinoPageRoute(builder: (context) => Profile())  //슬라이드

                                 /*PageRouteBuilder( //fadein
                                   pageBuilder: (context, a1, a2) =>
                                     FadeTransition(opacity: a1, child: Profile(),
                                 ),transitionDuration : Duration(microseconds: 1000),
                                 )
                                     //a1 : 0~1사이의 값 -> 새페이지 전환의 진행정도
                                     //a2 : 0~1사이의 값 -> 기존페이지 전환 진행정도*/

                                //slide 애니메이션
                                PageRouteBuilder(
                                  pageBuilder: (context, a1, a2) => Profile(),
                                    transitionsBuilder: (context, a1, a2, child) =>
                                        SlideTransition(position: Tween(
                                          begin: Offset(0.0, -1.0),
                                          end: Offset(0.0, 0.0)
                                        ).animate(a1),
                                          child: child,
                                        ),
                                )
                              );
                          },
                        ),
                        Text('내용  ${widget.feedItems[i]['content']}'),
                        Text('날짜 ${widget.feedItems[i]['date']}')
                      ],
                    )
                ),
              ],
            );
          }
      );
    } else {
      return Center(child: CircularProgressIndicator());
    }
  }
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text('프로필페이지'),
    );
  }
}


class Upload extends StatelessWidget {
  const Upload({super.key, this.userImage, this.setUserContent, this.addMyData});
  final userImage;
  final setUserContent;
  final addMyData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: (){
                addMyData();
                Navigator.pop(context);
              },
              icon: Icon(Icons.send)
          )
        ],
      ),
      body: Column(
        children: [
          Text('이미지 업로드 화면'),
          Image.file(userImage),
          TextField(onChanged: (text) {
            setUserContent(text);
          },),
          IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Icons.close)
          )
        ],
      ),
    );
  }
}

