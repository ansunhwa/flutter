void main() {
  //사용시 자료형을 넣어줌 
  A a = A();
  Lecture<A> lecture3 = Lecture(a, '이름');

  Lecture<String> lecture1 = Lecture('user01@naver.com', '네이버');
  lecture1.printIdType();

  Lecture<int> lecture2 = Lecture(123, '네이버');
  lecture2.printIdType();
}

class Lecture<T> {
  final T id;
  final String name;

  Lecture(this.id, this.name);  // 생성자

  printIdType() {
    print(id.runtimeType);
  }
}

class A {

}