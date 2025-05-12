void main() {
  Set<String> names = {
    'java',
    'oracle',
    'html',
    'flutter',
    'oracle'
  };
  print(names);  // 중복 값 안나옴

  // 값 넣기
  names.add('aws');
  print(names);

  // 삭제
  names.remove('html');
  print(names);

  // 값이 존재하는지 검사  (대소문자 가림)
  print(names.contains('java'));
  print(names.contains('spring'));

  // 조건문, 반복문에서 한줄이어도 중괄호를 넣어주는 것이 권장사항
  int num = 6;
  if(num % 2 == 0){
    print('짝수입니다');
  }


}