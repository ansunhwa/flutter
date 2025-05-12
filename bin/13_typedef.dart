/*
  - typedef : 함수 타입을 정의하기 위해 typedef를 사용할 수 있다
    함수의 타입을 명확하게 표현할 수 있어 가독성이 높아짐.
    특정 타입을 가진 함수를 많이 사용할 경우 간결한 코드를 작성할 수 있음.

    * 사용법
    typedef 유형이름 = 함수타입;
 */

/*
void main() {
  Operation op = add;
  int result = op(1,2,3);
  print(result);

  op = subtract;
  int result2 = op(30,5,3);
  print(result2);
}

typedef Operation = int Function(int x, int y, int z);
// 1. function위치에 add, sutract가 들어감
int add(int x, int y , int z) => x+y+z;
int subtract(int x, int y , int z) => x-y-z;
*/


// 많이 사용하는 방법
void main() {
  int result = calulate(10, 20, 30, add);
  print(result);

  print(calulate(50, 10, 30, subtract));

}

typedef Operation = int Function(int x, int y, int z);

int add(int x, int y , int z) => x+y+z;
int subtract(int x, int y , int z) => x-y-z;
//-- 이런 내용이 많을 때 좀 더 간단하게 넣기

/*int calulate(int x, int y, int z, Operation op){
  return op(x,y,z);
}*/
int calulate(int x, int y, int z, Operation op) => op(x,y,z);
