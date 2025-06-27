import 'dart:math';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:http/http.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/*
  - where() : 조건

  비교방식                 사용방법
  ----------------------------
  같다                  isEqualTo : value
  크다                  isGreaterThan : value
  크거나 작다            isGreaterThanOrEqualTo : value
  작다                  isLessThan : value
  작거나 같다            isLessThanOrEqualTo : value
  포함(a를포함하고 있는지) arrayContains : value (List항목 상태여야 함)
  여러 값 중 하나         where('field', whereIn : [...])
  여러 값 제외           where('field', whereNotIn : ['a', 'b', 'c'])
  배열 중 하나라도 포함    arrayContainsAny : value     List형태
 */

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => ShopState();
}
final firestore = FirebaseFirestore.instance;

class ShopState extends State<Shop> {
  @override
  void initState() {
    super.initState();
    //setData();
    //getData();
    //updateData();
    deleteData();
  }

  setData() async {
    //값추가
    WriteBatch batch = firestore.batch();
    var rand = Random();
    var names = [
      '김로미', '홍은채', '김지수', '박서준',
      '안효섭', '박지수', '김민준', '박보검', '이지은',
      '이병헌', '정수아', '임시우', '노윤서', '최리정'];
    var citys = [
      '서울', '서울', '인천', '경기',
      '광주', '천안', '경기', '성남', '인천',
      '인천', '수원', '청주', '서울', '경기'];
    var allHobbies = [
      '게임', '음악', '미술', '독서', '운동', '요리', '등산'];

    for (var i = 0; i < 14; i++) {
      DocumentReference id = firestore.collection('person').doc(
          'person${i + 2}'); //id의 타입은 DocumentReference
      int hobbyCount = rand.nextInt(3) + 2; //랜덤으로 2~4의 숫자가 뽑힘(취미)
      var shuffled = List<String>.from(allHobbies)
        ..shuffle();
      var hobbies = shuffled.take(hobbyCount).toList();

      batch.set(id, { //id는 문서 {}는 값
        'name': names[i],
        'age': i + 20,
        'city': citys[i],
        'hobbies': hobbies
      });
    }
    await batch.commit();
  }

  getData() async {
    var persons = await firestore.collection('person').get();

    for (var doc in persons.docs) {
      print(doc['name']);
    }
    print('------------------------------------------');

    //서울에 살고 있는 사람만
    var queryByCity = await firestore.collection('person')
        .where('city', isEqualTo: '서울') //서울에 사는 사람만
        .get();
    for (var doc in queryByCity.docs) {
      print('${doc['name']} - ${doc['city']}'); //이름 - 도시
    }
    print('------------------------------------------');

    //나이가 28세 이상인 사람 검색
    var queryByAge = await firestore.collection('person')
        .where('age', isGreaterThanOrEqualTo: 28)
        .get();
    for (var doc in queryByAge.docs) {
      print('${doc['name']} - ${doc['age']}');
    }
    print('------------------------------------------');

    //나이가 25세 이상 32살 사이인 사람
    var ageUntil = await firestore.collection('person')
        .where('age', isGreaterThanOrEqualTo: 25)
        .where('age', isLessThanOrEqualTo: 32)
        .get();
    for (var doc in ageUntil.docs) {
      print('${doc['name']} - ${doc['age']}');
    }
    print('------------------------------------------');

    // 취미에 운동하고 게임이 하나라도 포함되어 있으면 가져오기
    var queryByHobbies = await firestore.collection('person')
        .where('hobbies', arrayContainsAny: ['운동', '게임'])
        .get();
    for (var doc in queryByHobbies.docs) {
      print('${doc['name']} - ${doc['hobbies']}');
    }
    print('------------------------------------------');

    // 도시 중 서울 이거나 인천이거나 성남 에 사는 사람
    var queryByCitys = await firestore.collection('person')
        .where('city', whereIn: ['서울', '인천', '성남'])
        .get();
    for (var doc in queryByCitys.docs) {
      print('${doc['name']} - ${doc['city']}');
    }
    print('------------------------------------------');

    // 모든 데이터 정렬하여 검색
    var personSort = await firestore.collection('person')
        .orderBy('name', descending: true) //내림차순
        .get();
    for (var doc in personSort.docs) {
      print(doc['name']);
    }
    print('------------------------------------------');

    //나이가 28세 이상인 사람을 나이순으로 가져오기
    var queryByAgeOrder = await firestore.collection('person')
        .where('age', isGreaterThanOrEqualTo: 28)
        .orderBy('age') //오름차순 -> 오름차순은 적지 않아도 된다
        .get();
    for (var doc in queryByAgeOrder.docs) {
      print('${doc['name']} - ${doc['age']}');
    }
    print('------------------------------------------');
  }

  /*
      * update
        - set은 문서의 id가 같으면 update, 문서가 없으면 생성
        - update는 반드시 문서가 있어야 함. 없으면 오류(기존에 있던걸 바꾸려면/ set은 생성됨)
   */
  updateData() async {   //update는 하나만 넣을 수 있음
    /*await firestore.collection('person')
        .doc('person1')
        .update({'hobbies': ['게임', '요리', '운동']});
    var hobbyUpdate = await firestore.collection('person')
        .doc('person1')
        .get();
    print(hobbyUpdate['hobbies']);*/

    //set으로하면 전체를 다 나열해 줘야 함
    await firestore.collection('person')
              .doc('person1')
              .set({'name':'홍길동', 'age' : 28, 'city':'서울', 'hobbies':['요리','게임','운동']});
    print('------------------------------------------');

    //나이가 30세 이상인 데이터를 age+10을 한 값을 update
    //1. 30세 이상인 데이터 검색
    var queryByAgeOrderName = await firestore.collection('person')
                  .where('age', isGreaterThanOrEqualTo: 30)
                  .get();
    //2. 1번데이터의 age의 값을 +10해서 update
    for(var doc in queryByAgeOrderName.docs) {
      int currentAge = doc.data()['age'];  //(30세이상검색한)값을 얻어오기

      await firestore.collection('person')
                  .doc(doc.id)
                  .update({'age': currentAge +10});   //기존 값(30세이상)에다 +10을 한 값을 가져오세요
    }
  }

  deleteData() async{
    await firestore.collection('product')
        .doc('hzh2Ki4rs7vYn9gs3UNx')
        .delete();

    //문서 안의 필드만 삭제하려면
    await firestore.collection('product')
        .doc('gQzt3cNd9w1wZ206StvH')
        .update({'price' : FieldValue.delete()});

    var pants = await firestore.collection('product')
        .where('price', isEqualTo: '바지')
        .get();

  }


  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text('shop page')
    );
  }
}
