// map = { 키 : 값 }  {중괄호 안에 넣어 줌}
void main() {
  Map<String, String> students = {
    '20250001' : '홍길동',
    '20250002' : '더조은',
    '20250003' : '김파랑'
  };

  print(students);
  print(students['20250002']);  // 하나만 가져오기

  // 맨 뒤에 추가
  students.addAll({'20250004' : '박강남'});
  print(students);

  // 값 변경
  students['20250003'] = 'ABC';  // 키에 해당하는 값 변경
  print(students);

  // 키 가져오기
  print('keys : ${students.keys}');

  // 값 가져오기
  print('values : ${students.values}');

}