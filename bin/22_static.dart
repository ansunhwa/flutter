//  static : 호출 시 반드시 클래스명.변수(함수)  로 호출

void main() {
  Employee hong = Employee('길동');
  Employee kim = Employee('사랑');

  hong.name = '바꿈';
  hong.printNameBuilding();

  Employee.building = '한국빌딩';
  hong.printNameBuilding();

  //static이 붙은건 클래스 이름으로 호출해줘야 한다
  //hong.printBuilding()
  Employee.printBuilding();
}

class Employee {
  static String ? building;
  String name;

  Employee(this.name);

  static printBuilding() {
    print('$building 건물에서 수업중입니다');
  }

  printNameBuilding() {
    print('이름은 $name입니다. $building 건물에서 수업중입니다');
  }

}