// 비교연산자 java와 동일(==, !=, >=, <=...)
void main() {
  var num =1;
  print(num is int);  // num은 int 인가?
  print(num is String);

  // !(not)
  print(num is! int);

  //삼항연산자
  10 < 30 ? print('10이 더 작다') : print('10이 더 크다');
}