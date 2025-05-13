/*
  - Default Constructors(기본생성자): 생성자를 선언하지 않으면 제공되는 빈 생성자
  - Named Constructors : 개발자가 생성한 생성자. 클래스에 대한 여러 생성자를 구현하거나,
                                추가적인 클래스의 명확성을 제공
  - Redirection Constructors : 목적이 동일한 생성자로 전달하기 위한 생성자.
                              생성자의 본문이 비어 있지만, 전달된 생성자에 초기값등을 구현할 때
                              (java의 생성자 오버라이딩과 유사)
  - Const Constructors : 상수 생성자(내부 필드가 모두 상수로 바뀌지 않음)
  - Factory Constructors : 매번 새로운 객체를 만들지 않는 생성자를 활용할 때 사용.
                  이미 존재하는 객체를 반환하거나, 단순한 초기값을 부여가 아니라 연산이 필요한 객체 생성시 사용
 */

void main() {
  Idol blackPink = Idol('블랙핑크', ['리사', '로제', '제니', '지수']);
  print(blackPink.name);
}

class Idol {
  String name;
  List<String> members;

  /*
//생성자
Idol(String name, List<String> members)
    : this.name = name,
      this.members = members;
*/

//위의 생성자를 간단하게
  Idol(this.name, this.members);

  sayHello() {
    print('안녕하세요 ${this.name} 입니다.');
  }

  introduce() {
    print('저희 멤버는 ${this.members} 입니다!');
  }
}


