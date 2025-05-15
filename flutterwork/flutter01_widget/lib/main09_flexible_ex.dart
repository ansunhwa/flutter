import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            //leading: Icon(Icons.list),   //왼쪽은 leading
              title: Text('강남역'),        //중간은 title
              actions: [Icon(Icons.search),Icon(Icons.list),Icon(Icons.favorite)], // 오른쪽은 actions
              backgroundColor: Color(0xFFf3edf7)
          ),
          /*
          //Expanded
          body: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/img/유니콘.png',width: 150,fit: BoxFit.contain,),
                SizedBox(width: 30,),
                Expanded(
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 9,
                      children: [
                        Text('유니콘집사구함', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        Text('착한유니콘, 해맑음'),
                        Text('책임분양', style: TextStyle(fontWeight: FontWeight.bold),),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.favorite_border),
                              SizedBox(width: 5,),
                              Text('9'),
                              SizedBox(width: 5,)
                            ],
                          ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )*/
          // flexible
          body: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(child: Image.asset('assets/img/유니콘.png',width: 150,fit: BoxFit.contain,),flex: 6,),
                SizedBox(width: 30,),
                Flexible(
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 9,
                        children: [
                          Text('유니콘집사구함', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          Text('착한유니콘, 해맑음'),
                          Text('책임분양', style: TextStyle(fontWeight: FontWeight.bold),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.favorite_border),
                              SizedBox(width: 5,),
                              Text('9'),
                              SizedBox(width: 5,)
                            ],
                          ),
                        ],
                      ),
                    ), flex: 4,
                  ),
              ],
            ),
          )
      ),
    );
  }
}



