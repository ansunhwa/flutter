
void main() {
  BoyGroup bts = BoyGroup('BTS');

  GirlGroup ive = GirlGroup('IVE');

  bts.sayName();
  ive.sayName();

  print(bts is IdolInterface);  //bts는 인터페이스로 만들어져 있는가
  print(ive is GirlGroup);  //ive는 걸그룹클래스로 만들어져 있는가
}

// interface할 때는 abstract 붙여주기
abstract class IdolInterface {
  String name;
  IdolInterface(this.name);
  sayName();

}

class BoyGroup implements IdolInterface {
  String name;
  BoyGroup(this.name);

  @override
  sayName() {
    print('이름은 $name 입니다');
  }
}

class GirlGroup implements IdolInterface {
  String name;
  GirlGroup(this.name);

  @override
  sayName() {
    print('이름은 $name 입니다');
  }
}