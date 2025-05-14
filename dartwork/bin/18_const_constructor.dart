/*
  - 객체 선언시 const가 없을 때 : 객체가 별도로 만들어짐.
  - 객체 선언 시 const가 붙으면 : 하나만 객체가 만들어짐.
 */
void main() {
  Idol idol1 = const Idol('블랙핑크', ['리사', '로제', '제니', '지수']);
  Idol idol2 = const Idol('bts', ['정국', '지민', '뷔', '진', 'RM', '제이홉']);
  Idol idol3 = const Idol('블랙핑크', ['리사', '로제', '제니', '지수']);

  print(idol1 == idol2);
  print(idol1 == idol3);

  Idol idol4 =  Idol('블랙핑크', ['리사', '로제', '제니', '지수']);
  Idol idol5 =  Idol('블랙핑크', ['리사', '로제', '제니', '지수']);
  print(idol4 == idol5);

  //const가 붙고 내용이 같으면 같다고 나옴
  //const가 안붙혀 있고 내용이 같으면 다르다고 나옴
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