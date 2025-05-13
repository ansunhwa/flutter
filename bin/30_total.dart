void main() {
  List<Map<String, String>> people = [
    {'name': '로제', 'group': '블랙핑크'},
    {'name': '지수', 'group': '블랙핑크'},
    {'name': '뷔', 'group': '방탄'},
    {'name': '지민', 'group': '방탄'}
  ];
  print(people);

  print('-------------');
  final pasePeople = people.map((x) => Person(name: x['name'], group: x['group'])).toList();
  print(pasePeople);

  //final bts = people.where((x) => x['group'] == '방탄');
  final bts = pasePeople.where((x) => x.group == '방탄');
  print(bts);

  // 위 두개를 한꺼번에
  final result = people.map((x) => Person(name: x['name'], group: x['group']))
                        .where((x) => x.group == '방탄');
  print('------------');
  print(result);

}

class Person {
  final name;
  final group;

  Person({required this.name, required this.group}); // 순서상관X

@override
  String toString() {
    return 'Person(name: $name, group: $group)';
  }
}