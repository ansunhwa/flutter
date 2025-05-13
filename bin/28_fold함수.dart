/*
  - fold() : feduce() 함수와 동일
    다른점
    1. 초기값을 줄 수 있음
    2. 결과 타입이 안맞아도 됨
 */
void main() {
  List<int> number = [1,3,5,7,9];
  final result = number.fold<int>(0, (prev, next) {
    print('previous : $prev');
    print('next : $next');
    print('total : '
        '${prev + next}');
    print('-------------------');
    return prev + next;
  });

  print(result);
}