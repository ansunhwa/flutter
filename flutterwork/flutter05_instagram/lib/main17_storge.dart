import 'package:flutter/material.dart';
import 'package:flutter05_instagram/style.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/rendering.dart';

import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_android/shared_preferences_android.dart';
/*
    * 로컬 저장 공간
      : sharedPreferences
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

  saveData() async{   //dart -> json으로 바꿔서 넣어줘야 한다  =넣는데이터
    final storage = await SharedPreferences.getInstance();
    List<String> stringList = feedItems.map((item) => jsonEncode(item)).toList();
    await storage.setStringList('items', stringList);
  }

  loadData() async{
    final storage = await SharedPreferences.getInstance();
    // 하나씩 피드 아이템에 넣어주면 됨
    List<String>? stringlist = storage.getStringList('items');

    if(stringlist != null) {
      List<Map<String, dynamic>> restorage =

      stringlist.map((item) => jsonDecode(item) as Map<String, dynamic>).toList();
      setState(() {
        feedItems = restorage;    //
      });
    }
  }

  setuserContent(newContent) {
    setState(() {
      userContent = newContent;
    });
  }

  addMyDate() {
    var now = DateTime.now();
    var formatter = DateFormat('mm dd');
    String formattedDate = formatter.format(now);
    //String formattedDate = DateFormat('mmm dd').format(DateTime.now());

    var myData = {
      "id": feedItems.length,
      "image": userImage ,
      "likes": 0,
      "date": "May 20",
      "content": setuserContent,
      "liked": false,
      "user": "John john"
    };
    setState(() {
      feedItems.insert(0, myData);
    });
    saveData();
  }

  @override
  void initState() {
    super.initState();
    saveData();
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
                        builder: (context) =>
                            Upload(userImage : userImage,
                                setuserContent : setuserContent))
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
                ?Image.network(widget.feedItems[i]['image'])
                :Image.network(widget.feedItems[i]['image']),
                Container(
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('좋아요  ${widget.feedItems[i]['likes']}'),
                        Text('글쓴이  ${widget.feedItems[i]['user']}'),
                        Text('내용  ${widget.feedItems[i]['content']}')
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

class Upload extends StatelessWidget {
  const Upload({super.key, this.userImage, this.setuserContent, this.addMyData });
  final userImage;
  final setuserContent;
  final addMyData;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            addMyData();
            Navigator.pop(context);
          }, icon: Icon(Icons.send))
        ],
      ),
      body: Column(
        children: [
          Text('이미지 업로드 화면'),
          Image.file(userImage),
          TextField(onChanged: (text){
            setuserContent(text);},),
          IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Icons.close)
          ),
        ],
      ),
    );
  }
}