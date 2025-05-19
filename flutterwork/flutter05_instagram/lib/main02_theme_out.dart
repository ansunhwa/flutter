import 'package:flutter/material.dart';
import 'package:flutter05_instagram/style.dart';
/*
  * ThemeData() : 스타일을 모아놓음
    : 파일에서 사용하거나 별도의 파일로 만들어서 사용
 */

void main() {   // 원하는 감싸는게 안뜨면 widget으로 감싸고 바꿔주면 됨
  runApp(
      MaterialApp(
        theme: theme,
          home: const MyApp()
      )
  );
} 

var textColor = TextStyle(fontSize: 20, color: Colors.pinkAccent);


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('instagram'),
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.add))],
      ),
      body: Column(
        children: [
          TextButton(onPressed: (){}, child: Text('text버튼')),
          ElevatedButton(onPressed: (){}, child: Text('Elevated버튼')),
          Text('더조은 풀스택', style: Theme.of(context).textTheme.bodyMedium, ),
          Text('다른 글씨 색', style: Theme.of(context).textTheme.bodyLarge,)
        ],
      ),
    );
  }
}
