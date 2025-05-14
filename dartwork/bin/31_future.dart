/*
  - Future와 Stream 비동기 처리 시 사용 -> 답을 기다리지 않고 처리
    다른점 : Future -> 딱 1번만 받아 옴
            Stream -> 여러번 받아 옴
   - async / await / Future : 1회만 응답을 받을 때(동기처리)
   - async* / yeild / Stream : 지속적으로 응답을 받을 때

   * Future(javascript 의 Promise와 동일)
     싱글스레드(하나만돌아감)환경에서 비동기 처리를 함.
      - 미래에서 완료 될 작업을 나타내는 객체(나중에 결과 받기)
 */

void main() {
  Future<String> name = Future.value('더조은');  //미래에 들어올 값
  Future<int> num = Future.value(1);
  Future<bool> isTrue = Future.value(true);

  addNumbers(1, 2);

  addNumbers(2, 4);

  /*
  print('함수 시작');

  //Future.delayed(지연할 시간(기간), 지연시간이 지난 후 실행할 함수);
  Future.delayed(Duration(seconds: 2),() {
    print('Delay 끝');
  });
  */
}

addNumbers(int num1, int num2) {
  print('계산시작 : $num1 + $num2'); // 문자열

  Future.delayed(Duration(seconds: 2), () {
    print('계산완료 : $num1 + $num2= ${num1+num2}');
  });
  print('함수 끝');
}