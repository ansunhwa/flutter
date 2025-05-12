/*
  parameter (argment) : 순서와 갯수가 동일해야 함(넘겨주는값과 받는값)
  optional parameter : 순서가 맞아야 함. 파라미터의 갯수가 미지수 일 때
 */
void main() {
  function1();
  addNumbers(10, 23, 38);  // parameter(argment)
  addNumbers2(1,2,3);
  addNumbers2(1);
}

function1() {
  print('function1 실행');
}

// 3개의 숫자를 더해서 짝수인지 홀수 인지 알려주는 함수
// 순서와 갯수가 동일해야 함
addNumbers(int x, int y, int z) {
/*  int x = 10;
  int y = 24;
  int z = 38;*/

  int sum = x + y + z;
  print('x : $x');
  print('y : $y');
  print('z : $z');

  if(sum%2 == 0) {
    print('x : ${x}, y : ${y}, z : ${z} , 짝수입니다');
  } else {
    print('x : ${x}, y : ${y}, z : ${z} , 홀수입니다');
  }
}


// 파라미터가 미지수 일 때 대괄호로 묶어준다
// 기본값을 넣어주면 값이 있으면 원래 값으로, 값이 없으면 기본값으로 넣어 줌!
// 값이 들어오면 들어온 값으로, 안들어 오면 기본값으로
// 순서는 맞아야 한다 [대괄호]로 묶어준다
addNumbers2(int x, [int y = 23, int z = 30]) {   // [] 값이 들어올지 안들어올지
  int sum = x + y + z;
  if(sum%2 == 0) {
    print('$x + $y + $z = 짝수입니다');
  } else {
    print('$x + $y + $z = 홀수입니다');
  }
  print(sum);
}


//  addNumbers3(int x, [int? y, int? z]) {
//    int sum = x + y + z; // 오류 -> 숫자 + null이기 때문
//  }
//
// addNumbers4(int x, [int y, int z]) {  //파라미터가 안들어올 경우 null이 되므로 오류
//   int sum = x + y + z; // 오류 -> 숫자 + null이기 때문
// }