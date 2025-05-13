/*
  - where()함수 : 결과가 true 인것만 가져옴(filter와 동일)
 */
void main() {
  List<Map<String, String>> people = [
    {'name' : '로제', 'group' : '블랙핑크'},
    {'name' : '지수', 'group' : '블랙핑크'},
    {'name' : '뷔', 'group' : '방탄'},
    {'name' : '지민', 'group' : '방탄'}
  ];
  print(people);

  final blackPink = people.where((x) => x['group'] == '블랙핑크'); // 참인 것만 리턴
  final bts = people.where((x) => x['group'] == '방탄');
  print(blackPink);
  print(bts);

}