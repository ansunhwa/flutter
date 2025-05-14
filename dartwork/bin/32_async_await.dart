
//비동기를 동기로 사용하려면
//함수에 async를 넣고 Future앞에 await키워드를 넣는다

// 전체를 addNumbers(1,2)모두 끝내고 난 후에 addNumbers(5,2)를 실행하려면
// main에 async넣어주고 함수앞에 await키워드를 넣는다
void main() async{
  Future<String> name = Future.value('더조은');  //미래에 들어올 값
  Future<int> num = Future.value(1);
  Future<bool> isTrue = Future.value(true);

  await addNumbers(1, 2);
  await addNumbers(5, 2);


}

addNumbers(int num1, int num2) async {
  print('계산시작 : $num1 + $num2'); // 문자열

  await Future.delayed(Duration(seconds: 2), () {
    print('계산완료 : $num1 + $num2= ${num1+num2}');
  });

  print('함수 끝');
}