import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
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
  배열 중 하나라도 포함    arrayContainsAny :
 */

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}
final firestore = FirebaseFirestore.instance;

class _ShopState extends State<Shop> {
  @override
  void initState() {
    super.initState();
    //setData();
    getData();
  }
  
  getData() async {
    /*//문서 1개 가져오기
    var result = await firestore.collection(
        'product') //.get(); //product에 있는 모든 문서를 다 가지고 옴
        .doc('Edf98fL2EvrIYIGYi59W') // 하나만 가져 올 경우 아이디만 가져오기
        .get();
    print('결과 : $result');
    print(result['price']);

    //모든문서가져오기
    var result2 = await firestore.collection('product').get(); //for문
    //서버가 안되거나, 비어있거나 이런 경우를 대비하여 if 혹은 try/catch
    if (result2.docs.isNotEmpty) {
    for (var doc in result2.docs) {
      print(doc['name']);
     }
    }*/

    // 조건에 맞는거 가지고 오기
    try{
      var result3 = await firestore.collection('product')
                            .where('price', isGreaterThan:22000).get();
      for (var doc in result3.docs) {
        print(doc['name']);
      }

    } catch(e) {
      print('서버오류');
    }

  }

  /*setData() async {   //값추가
    await firestore.collection('product')
            .add({'name' : '티셔츠', 'price' : 21000});
  }*/

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('shop page')
    );
  }
}

