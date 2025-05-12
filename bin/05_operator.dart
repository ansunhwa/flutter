/*
    연산
     - 몫 : ~/
     - 나머지는 java와 같음 : +=, -=, %=, ++, -- ....

    * 나눗셈 : int / int = double

    * ??= : 만약 값이 null이면 오른쪽에 있는 값을 넣고 그렇지 않으면 바꾸지 않음
 */

void main() {
  var result = 4 / 2 ;
  print(result);
  print(result.runtimeType);

  print('몫 : ${10 ~/ 3}');

  int? num = 2;  //  null허용
  print(num);
  num = null;
  print(num);

  num ??= 5;  //num에 null이들어있으면 5를, 값이 들어있으면 원래 값을
  print('num = $num');

  num ??= 10;
  print('num = $num'); //  이미 5가 들어있는 상태기 때문에 안바뀜

  /*
    ? : 자료형에 붙혀줌 -> null을 허용
    ??= : 변수에 붙혀줌 -> 변수에 값을 넣어줌(null이면 오른쪽 값, 그렇지 않으면 원래값(왼쪽))
    ?? : 변수에 붙혀줌 -> 변수의 값이 변하지 않음
   */

  num = null;
  num ?? 5;
  print(num);


}