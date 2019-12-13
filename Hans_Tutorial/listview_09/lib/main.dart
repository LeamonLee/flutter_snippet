import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage2(),
    ));

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              title: Text("ListViewDemo"),
            ),
            body:ListView(                              // ListView 適合已知數量大小
              children: List.generate(10, (idx){
                return Card(
                  child: Container(
                    height: 150,
                    color: Colors.greenAccent,
                    child: Text('$idx'),
                  )
                );
              }),
            )
    );
  }
}

class MyHomePage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              title: Text("ListViewDemo"),
            ),
            body:ListView.builder(      // ListView.builder 適合未知數量大小
              // itemCount: 10,   // 可以指定大小, 若不指定就無限多
              itemBuilder: (context, idx){
                return Card(
                  child: Container(
                    height: 150,
                    color: Colors.pinkAccent,
                    child: Text('$idx'),
                  )
                );
            })
    );
  }
}
