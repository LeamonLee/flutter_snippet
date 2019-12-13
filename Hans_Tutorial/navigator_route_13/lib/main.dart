import 'dart:ffi';

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
      initialRoute: '/',
      routes:{
        '/': (context){
          return MyHomePage();
        },
        '/page2':(context){
          return Page2();
        },
      },
      // home: MyHomePage(),
    )
);

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page1"),
      ),
      body: Container(color: Colors.pinkAccent,),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          // Navigator.pushNamed(context, '/page2');
          Navigator.of(context).push(MaterialPageRoute(         // push 回傳的是一個Future,所以要用then來接收結果
            builder: (context){
              return Page2(strData: "abcde");
            }
          )).then((value){
            print("value: $value");
          });                  // 如果要從Page1傳資料到Page2 要用push
        },
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  final String strData;
  Page2({Key key, @required this.strData}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page2"),
      ),
      body: SizedBox.expand(
        child:Container(
          color: Colors.lightBlueAccent,
          child:Text("$strData"),
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pop(context, "Data from Page2");
        },
      ),
    );
  }
}


