/*
  named parameter : 이름이 있는 파라미터. 순서가 필요 없음
 */
void main() {
  addNumbers(x: 10, y: 5, z: 20); //x,y,z의 순서 바뀌어도 가능(자동완성)
  addNumbers2(x: 10, y: 5);
  addNumbers2(x: 10, y: 5, z:20);

  //int result = addNumbers3(x: 10, y: 5);
  print(addNumber3(x: 5, y: 2));

  print('--------------------------');
  //x는 필수 y, z안넣어 주면 기본값, z,y 바뀌어도 됨
  addNumber4(20, y: 60, z: 30);
  print('--------------------------');
  addNumber4(20, y: 60);
  print('--------------------------');
  addNumber4(20, z: 60, y: 30);

}

//파라미터 넣는 곳을 {중괄호}로 묶고, required 키워드를 붙혀준다
// 순서가 필요 없다
addNumbers({ required int x, required int y, required int z}) {
  int sum = x + y + z;
  print('x : $x');
  print('y : $y');
  print('z : $z');
  print(sum);
  //print('$x + $y + $z = $sum');
}

addNumbers2({
  required int x,
  required int y,
  int z = 50 // required를 빼고 기본값을 넣어주면 optioanl이 됨(값 있어도 되고 없어도 되고)
}) {
  int sum = x + y + z;
  print('x : $x');
  print('y : $y');
  print('z : $z');
  print(sum);
  //print('$x + $y + $z = $sum');
}
//반환값이 없어도 void안써줘도 됨


// -> return이 있는 함수
int addNumber3({
  required int x,
  required int y,
  int z = 50 // required를 빼고 기본값을 넣어주면 optioanl이 됨(값 있어도 되고 없어도 되고)
}) {
  int sum = x + y + z;
  print('x : $x');
  print('y : $y');
  print('z : $z');
  return sum;
}

// 섞어서 x는 필수, y는 맘대로(넣어야함) z는 맘대로 or기본값(안넣어도 됨)
 int addNumber4(int x, { required int y, int z = 50}) {
  int sum = x + y + z;
  print('x : $x');
  print('y : $y');
  print('z : $z');
  return sum;
}

// 화살표 함수
int addNumber5(int x, { required int y, int z = 50}) {
  int sum = x + y + z;
  return sum;
}

// addNumber5 를 화살표 함수로
int addNumber6(int x, { required int y, int z = 50}) => x + y + z;




