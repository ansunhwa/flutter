/*
  - const 생성자 : 생성자 앞에 const붙임. 나중에 값을 변경할 수 없음
 */
void main() {
  Idol idol1 = Idol('블랙핑크', ['리사', '로제', '제니', '지수']);  //기본생성자 호출
  print(idol1.name);
  idol1.introduce();

  //idol1.name = '더조은'; ->const여서 오류 남 / 바꿀 수 없음

  Idol idol2 = Idol.list2([['정국', '지민', '뷔', '진','RM','제이홉'], 'BTS']); //named 생성자 호출
  print(idol2.members);
  idol2.sayHello();
}

class Idol {
  final String name;
  final List<String> members;

  // const가 객체생성 될 때 final값이 들어와야 하기 때문에 final
  //final -> 한번 만든거 고칠 수 없음 const여서 붙혀줌
  const Idol(this.name, this.members);  //

  //named 생성자 -> 이름은맘대로 해도 됨!
  Idol.list2(List values)    // 배열형태에서 members:배열, name:string
      : this.members = values[0],
        this.name = values[1];

  // 이름만 다르면 여러개 생성할 수 있음!!

  sayHello() {
    print('안녕하세요 $name 입니다.');
  }

  introduce() {
    print('저희 멤버는 $members 입니다!');
  }
}