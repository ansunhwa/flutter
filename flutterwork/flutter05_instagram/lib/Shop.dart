import 'dart:math';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final firestore = FirebaseFirestore.instance;
final auth = FirebaseAuth.instance;

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => ShopState();
}

class ShopState extends State<Shop> {
  @override
  void initState() {
    super.initState();
    //authCreate();
    login();
  }

  authCreate() async{
   /* try{
      var result = await auth.createUserWithEmailAndPassword(   //사용자 만듬
          email: 'kim@naver.com', password: '123456');   //입력받을 때 조건 설정 가능(기본6자리)

    } catch(e) {
      print(e);
    }*/

    //이메일과 패스워드 제외 이름 넣기
   /* try{
      var result = await auth.createUserWithEmailAndPassword(   //사용자 만듬
          email: 'kim@naver.com', password: '123456');   //입력받을 때 조건 설정 가능(기본6자리)
      result.user?.updateDisplayName('박나나');   // 이 3가지는 무조건 이렇게 넣어야함 나머지는 상관X
    } catch(e) {
      print(e);
    }*/

    // 이메일과 패스워드 외 기타정보들 넣기
    try{
      var result = await auth.createUserWithEmailAndPassword(   //사용자 만듬
          email: 'park@naver.com', password: '123456');   //입력받을 때 조건 설정 가능(기본6자리)
      
      User? user = result.user; // 정보를 가져와서 user에 담음
      await user?.updateDisplayName('박나나');  //이름은 꼭 이렇게 담아야 함
      
      await firestore.collection('users').doc(user?.uid).set({  //데이터베이스에 생성됨 users로
        'name':'박나나',
        'address' : '서울시 강남구',
        'phone' : '010-1234-5678',
        'email' : user?.email,
        'createAt' : Timestamp.now()
      });
      print('회원가입 및 정보 저장 완료');
    } catch(e) {
      print(e);
    }
  }

  login() async{
    try{
      await auth.signInWithEmailAndPassword(email: 'park@nave.com', password: '123456');
    }catch(e){
      print(e);
    }

    if(auth.currentUser?.uid == null){
      print('로그인이 안된 상태');
    } else {
      print('로그인이 되었습니다.');
      userInfo();   //로그인이 되었으면 호출
    }
  }

  userInfo() async{
    try{
      var user = auth.currentUser;   // user-> 이메일, 패스워드, 이름만 들어있음

      final uid = user?.uid;       //null일 경우가 있을수도 있어서
      //final name = user?.displayName;
      //final email = user?.email;

      final doc = await firestore.collection('users').doc(uid).get(); //에 해당하는 정보 가져오시요
      if(doc.exists){
        final data = doc.data() as Map<String, dynamic>;
        print('주소 : ${data['adress']}');
        print('전화 : ${data['phone']}');
      }else{
        print('정보가 없습니다');
      }
    }catch(e){
      print(e);
    }
    logout();
  }

  logout() async{
    await auth.signOut();   //사인아웃 하면 바로 로그아웃 됨
    print('로그아웃 : ${auth.currentUser?.email}');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('shop page'),
    );
  }
}
