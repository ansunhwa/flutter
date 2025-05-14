void main() {
  List<String> blackPink= ['로제', '지수', '리사', '제니'];
  print(blackPink.runtimeType);
  print('List : $blackPink');

  //list -> Map 으로 변환
  print(blackPink.asMap());

  //list -> Set 으로 변환
  print(blackPink.toSet());

  Map blackPinkMap = blackPink.asMap();
  print(blackPinkMap.keys);

  // List로 변형 (Map -> List)
  print(blackPinkMap.keys.toList());   // 키만 리스트로
  print(blackPinkMap.values.toList()); // 값만 리스트로

  //List -> set
  Set blackPinkSet = blackPink.toSet();

  //set -> List
  print(blackPinkSet.toList());

}