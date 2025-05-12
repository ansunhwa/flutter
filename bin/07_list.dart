/*
  - 집합 자료형 : List, Set, Map

  *List type(java와 동일)
  list 배열 [대괄호]
 */
void main() {
  List<String> name = ['홍길동', '김파랑','제니'];  //list를 스트링 타입으로 배열
  List<int> numbers = [1,2,3,4,5];
  print(name);
  print(numbers[2]);  //인덱스번호로 불러오기 가능
  print('list길이 : ${name.length}');    // .ㅇㅇ 가 쓰이면 {중괄호 안에}

  //추가
  name.add('더조은');
  print(name);

  //삭제
  name.remove('김파랑');
  print(name);

  // 제니의 인덱스 번호를 가져오기
  print(name.indexOf('제니'));



}