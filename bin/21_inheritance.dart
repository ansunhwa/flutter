void main() {
  BoyGroup bts = BoyGroup(name: 'BTS', memberCount: 6);
  bts.sayName();
  bts.sayMemberCount();
  bts.sayMale();
 print(bts.calulate());  //오버라이딩 자식꺼 먼저 호출!!

 print("------------");
  GirlGroup blackpink = GirlGroup('블랙핑크', 4);  // 순서 지켜줘야 함. 이름 안써도 됨
  blackpink.sayName();
  blackpink.sayMemberCount();
  blackpink.sayFemale();

  print('-------------------');
  print(bts is Idol); //bts는 idol타입인지
  print(bts is BoyGroup); //bts는 boygroup으로 만들어져있는지

}

class Idol {
  String name;
  int memberCount;

  Idol({required this.name, required this.memberCount}); //순서X

  sayName() {
    print('저는 $name 입니다');
  }

  sayMemberCount(){
    print ('$name 은 $memberCount 명 으로 구성되어 있습니다');
  }

  int calulate() {
    return memberCount * 2;
  }

}
//상속받는 클래스
class BoyGroup extends Idol {

   /*BoyGroup(String name, int memberCount)  // 받아서 부모에 넣으세요
      : super(name: name, memberCount: memberCount);*/

  BoyGroup({required super.name, required super.memberCount});  //부모생성자(super)
      // 변수 이름을 넣었기 때문에 순서 안지켜도 됨

//함수선언
sayMale() {
  print('저희는 남자 아이돌 입니다');
}

  @override
  int calulate() {
    return memberCount * 4;
  }

}

class GirlGroup extends Idol {
    GirlGroup(String name, int memberCount)  // 값을 받아서 부모에 넣으세요
      : super(name: name, memberCount: memberCount); // 순서 지켜줘야 함!!

 // GirlGroup({required super.name, required super.memberCount});

  //함수선언
  sayFemale() {
    print('저희는 여자 아이돌 입니다');
  }
}