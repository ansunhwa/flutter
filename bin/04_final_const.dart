/*
  final, const
  같은 점 : 상수, 자료형을 생략할 수 있다
  다른 점 : final 은 build time을 몰라도 됨 -> (build하는 순간 값을 몰라도 됨 ex)사용자에게 값을 받음)
           const 는 build time에 미리 값을 알아야 함
 */
void main() {
  final String name = 'nana';
  const String name2 = 'blue';

  final name3 = 'hello';
  const name4 = 'world';

  // 다른점
  DateTime now1 = DateTime.now();
  print(now1);

  final DateTime now2 = DateTime.now();
  print(now2);

  // 오류 : build time에 현재 시간을 알 수 없음. (확실히 값이 들어와 있는지!)
/*  const DateTime now3 = DateTime.now();
  print(now2);*/

}