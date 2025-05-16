import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //var name = ['홍길동', '더조은', '빛나리'];
  //var name = [];  //그냥은 type이 안맞음  toString() ㄴㄴ....
  List<Contact> name = []; // 맞는 타입으로 바꿔줌

  getPermission() async {
    var status = await Permission.contacts.status;

    if (status.isGranted) {
      print('허락함');
      List<Contact> contacts = await FlutterContacts.getContacts();
      setState(() {
        name = contacts;  //이름이 바뀌면 재랜더링을 해야 하기 때문
      });

    } else if (status.isDenied) {
      print('거절됨');
      Permission.contacts.request();
    }
  }
  // 앱이 실행되면 바로 실행함
  @override
  void initState() {
    super.initState();
    getPermission();
  }

  addName(inputName) {
    var contacts = FlutterContacts.getContacts(withProperties: true);
    setState(() {
      name.add(contacts as Contact);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Text('dialog'),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return CustomDialog(addName: addName);
            },
          );
        },
      ),
      appBar: AppBar(
        backgroundColor: Color(0xFFf3edf7),
        leading: Icon(Icons.list),
        title: Text('주소록'),
        actions: [IconButton(onPressed: (){getPermission();},icon:(Icon(Icons.add)),), Icon(Icons.share)],
      ),
      body: ListView.builder(
        itemBuilder: (context, i) {
          return ListTile(
            leading: Image.asset('assets/img/icon${i+1}.png'),
            title: Text(name[i].displayName ?? '이름없음'),
          );
        },
        itemCount: name.length,
      ),
      bottomNavigationBar: CustomBottom(),
    );
  }
}

class CustomDialog extends StatelessWidget {
  CustomDialog({super.key, this.addName});

  final addName;
  var inputData = '';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 300,
        height: 300,
        child: Column(
          children: [
            TextField(
              onChanged: (text) {
                inputData = text;
              },
            ),
            TextButton(
              onPressed: () async {
                var newContact = Contact();
                newContact.name.first = inputData;
                //newContact.name.last = 'Smith' ;
                await newContact.insert();
                await addName(newContact);
                Navigator.pop(context);
              },
              child: Text('완료'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('취소'),
            ),
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
          Icon(Icons.phone),
          Icon(Icons.article_outlined),
          Icon(Icons.contacts),
        ],
      ),
    );
  }
}
