import 'package:flutter/material.dart';

var theme = ThemeData(// 스타일 넣어주면 됨
    appBarTheme: AppBarTheme(
    color: Color(0xFFf3edf7),
    elevation: 1,    // 이거나, 컬러 둘중 하나 넣어주면 티가 남
    titleTextStyle: TextStyle(fontSize: 20, color: Colors.black)
  ),
);