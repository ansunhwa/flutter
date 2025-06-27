import 'dart:math';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:http/http.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => ShopState();
}
final firestore = FirebaseFirestore.instance;

class ShopState extends State<Shop> {
  var persons = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async{
    var result = await firestore.collection('person').get();

    setState(() {
      persons = result.docs.map((doc) => doc.data()).toList();  //하나씩 돌면서 list 반환
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(isLoading) return Center(child: CircularProgressIndicator());

    return ListView.builder(
      itemCount: persons.length,
        itemBuilder: (context, index){  //반드시 들어가야 하는 값
           final person = persons[index];
           return ListTile(
             title: Text('${person['name']} (${person['age']}세 )'),
             subtitle: Text('도시 : ${person['city']} / 취미 : ${person['hobbies']?.join(', ')?? ''}') //null이면 X아니면 실행,
           );
        }
    );
  }
}
