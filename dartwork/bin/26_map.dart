void main() {
  List<String> blackPink = ['로제', '지수', '리사', '제니'];

  /*final newBlackPink = blackPink.map((X) {
    return '블랙핑크 X';
  });*/

  final newBlackPink = blackPink.map((x) => '블랙핑크 $x');
  print(newBlackPink);
  print(newBlackPink.toList());

  // [1.jpg, 3.jpg, 8,jpg..]
  String number = '13829';
  Iterable<String> img = number.split('').map((x) => '$x.jpg');
  Iterable<String> img2 = number.split('').map((x) => '$x.jpg').toList();
  print(img);
  print(img2);

  Map<String, String> herryPotter = {
    'herry': '해리',
    'ron': '론',
    'hermione': '헤르미온느'
  };
  final result = herryPotter.map((key, value) =>
      MapEntry('charcter $key', '캐릭터 $value')
  );
  print(herryPotter);
  print(result);

  List<String> herryKeylist = herryPotter.keys
      .map((x) => 'charcter $x')
      .toList();
  print(herryKeylist);

  Set blackPinkSet = {'로제', '지수', '리사', '제니'};
  final newSet = blackPinkSet.map((x) => '블랙핑크 $x').toList();
  print(newSet);
}