/*
  * 자료형
    1. bool(boolean이 아님) &&, ||(and, or)
    2. int  (다른언어와 다른점 :   int / int = double)
    3. double(float 없음)
    4. String : "", '' 모두 다 가능
    5. Null : null을 넣을 수 있음

    * print(같은 자료형만 넣을 수 있음)
 */

void main(List<String> arguments) {
  //var은 처음 넣은 값의 자료형이 변수의 자료형이 됨
  var name = 'kim';  //String
  var num = 5;        //int
  //runtimeType : 자료형 출력
  print(name.runtimeType);
  print(num.runtimeType);

  print(name);
  print(name + '안녕'); // 같은 자료형은 가능 /  다른자료형은X
  // 다른자료형을 넣을 땐 따옴표로 감싸줘야 함
  print(name + '${num}');
  print('${name} ${num}' );

  // 중괄호생략가능 문서에서도 권장!
  print('$name $num');
  print('$name' + '$num');

  // 중괄호를 생략하면 .runtimeType은 문자열로 인식
  print('$num.runtimeType $num');
  print('${num.runtimeType} $num');




}
