/*
  - getter / setter
    변수처럼 사용
    : 단순한 값을 넣거나 가져올 때 사용
 */
void main() {
  Idol idol1 = Idol('블랙핑크', ['리사', '로제', '제니', '지수']);  //기본생성자 호출

  print(idol1.firstMember);
  //idol1.firstmember('나나'); 함수가 아니라서 이렇게 사용 안함
  idol1.firstmember = '나나';
  print(idol1.members);

}

class Idol {
  final String name;
  final List<String> members;

  // const가 객체생성 될 때 final값이 들어와야 하기 때문에 final
  //final -> 한번 만든거 고칠 수 없음 const여서 붙혀줌
  const Idol(this.name, this.members);  //

  sayHello() {
    print('안녕하세요 $name 입니다.');
  }

  introduce() {
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