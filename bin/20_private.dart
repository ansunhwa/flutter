/*
  - private : _(언더바)를 붙이면 private
 */
void main() {
  _Idol idol1 = _Idol('블랙핑크', ['리사', '로제', '제니', '지수']);  //기본생성자 호출
  idol1._sayHello();

  print(idol1.firstMember);
  print(idol1.members);

}

//class 앞에 _를 붙이면 현재파일에서만 사용 가능(같은파일O , 다른파일 X)
class _Idol {
   String name;
   List<String> members;

   _Idol(this.name, this.members);


  _sayHello() {
    print('안녕하세요 $name 입니다.');
  }

  _introduce() {
    print('저희 멤버는 $members 입니다!');
  }

  //getter  -> get 이름 (변수처럼 사용_
  String get firstMember {
    return members[0];
  }

  //setter -> 무조건 하나의 매개변수만 받을 수 있음
  set firstmember(String name) {
    this.members[0] = name;
  }


}