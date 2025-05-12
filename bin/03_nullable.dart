/*
  - Null safety타입 : 2.12 버전부터 도입
    null 값에 대한 안정성을 보장하기 위해 모든 변수는 nullable과 non-nullable로 구분

    1. Nullable Type : null을 허용하는 타입
       변수 뒤에 ?(물음표)를 붙여 확용 - 자료형에 붙혀줌
    2. Non-nullable Type : null을 허용하지 않음
       아무것도 붙이지 않는다
 */

void main() {
  String name = 'hong';
  print(name);
  //name = 'null';  오류 null허용하지 않음

  String? name2 = 'gil';
  name2 = null;  // null값 허용 ?가 들어갔기 때문
  print(name2);

  String? name3;
  print(name3);

  //int 도 가능 / 모든 자료형에 ? 넣어 줄 수있음
  int? num = 2;
  num = null;
  print(num);

  // !(느낌표) : nullable type으로 선언을 했을 때 변수 뒤에 !를 붙여 null인 경우 오류를 발생하도록 만듬
  //            변수명에 !를 붙이면, Non-nullable의 타입
  String? name4 = 'dong';
  print(name4!);  //name4에 null이 들어가면 오류가 남

  name4 = null;
  print(name4);   // null 이어도 오류가 안남(?)
     //print(name4!);  //  값이 null이면 오류가 나게함(!)

  int? num1;      //null허용
  int num2 = 3;   //null X
    //print(num1 + num2);  // 오류 -> 허용하는 타입과 허용하지 않는 타입 같이X
    //print(num1! + num2);  // build에서는 오류가 안뜨지만 실행 시 오류

  // ?? : null일 때 대체값을 넣어 줄 수 있음
  //(num1 ?? 5);  //  num1의 값이 null이면 5를,  null이 아니면 num1값을 그대로 사용
  print(num1 ?? 5 + num2);
  print((num1 ?? 5) + num2);  // 괄호를 넣어주는게 좋긴 함

  String? name5 = 'john';
  if(name5 != null) {   //name5가 null이 아니면
    print(name5.isNotEmpty);  // 여긴 값이 들어 있기 때문에 true
  }else {
    print('값이 없습니다');
  }


  name5 = null;  // null도 자료형으로 봄
  print(name5?.isEmpty);
  print(name5?.isNotEmpty);
  //여기선 둘다 값이 없기 때문에 null이나옴/ 값이 있어야 true가 나옴


}