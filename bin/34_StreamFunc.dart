/*
void main() {
  //print(calculate(3));
}

calculate(int num) {
  for(int i=0; i<5; i++) {
    return i*num;
  }
}
*/

//stream - async*  return -> yield
//
/*
void main() {
  calculate(2).listen((val){
    print('calculate(2) : $val');
  });
}

calculate(int num) async*{
  for(int i=0; i<5; i++) {
    yield i*num;
  }
}
*/

//1초마다 호출
/*
void main() {
  calculate(2).listen((val){
    print('calculate(2) : $val');
  });

}

calculate(int num) async*{
  for(int i=0; i<5; i++) {
    yield i*num;

    await Future.delayed(Duration(seconds: 1));
  }
}
*/

//동시에 2개 호출
/*
void main() {
  calculate(2).listen((val){
    print('calculate(2) : $val');
  });

  calculate(3).listen((val){
    print('calculate(3) : $val');
  });

}

calculate(int num) async*{
  for(int i=0; i<5; i++) {
    yield i*num;

    await Future.delayed(Duration(seconds: 1));
  }
}
*/

//1r개가 끝나고 2번째 것 실행되게
void main() {

  playAllStream().listen((val){
    print(val);
  });
}

playAllStream() async* {
  yield* calculate(1);   // yield가 다 끝난 후 값 가져와라 yield*
  yield* calculate(50);
}

calculate(int num) async*{
  for(int i=0; i<5; i++) {
    yield i*num;

    await Future.delayed(Duration(seconds: 1));
  }
}