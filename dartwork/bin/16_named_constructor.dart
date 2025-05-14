void main() {
  Idol idol1 = Idol('블랙핑크', ['리사', '로제', '제니', '지수']);  //기본생성자 호출
  print(idol1.name);
  idol1.introduce();

  //idol1.name = '더조은';

  Idol idol2 = Idol.list2([['정국', '지민', '뷔', '진','RM','제이홉'], 'BTS']); //named 생성자 호출
  print(idol2.members);
  idol2.sayHello();
}

class Idol {
  String name;
  List<String> members;

  Idol(this.name, this.members);  //일반생성자

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