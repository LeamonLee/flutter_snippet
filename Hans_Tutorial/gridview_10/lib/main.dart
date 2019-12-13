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
      home: MyHomePage3(),
    ));


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("gridview_Demo")
      ),
      body:GridView.count(
        //scrollDirection: ,
        crossAxisCount: 2,
        childAspectRatio: 2/3,
        children: List.generate(100, (idx){
          return Card(
            child: Container(
              width:500,
              height:500,
              color: Colors.lightGreenAccent,
              child: Text("Index: $idx")
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
        title:Text("gridview_Demo")
      ),
      body:GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2/3,
        ),
        itemBuilder: (content, idx){
          return Card(
            child: Container(
              width:500,
              height:500,
              color: Colors.lime,
              child: Text("Index: $idx")
            )
          );
        },
        
      )
    );
  }
}


class MyHomePage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("gridview_Demo")
      ),
      body:GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 100,
          childAspectRatio: 2/3,
        ),
        itemBuilder: (content, idx){
          return Card(
            child: Container(
              width:500,
              height:500,
              color: Colors.blueAccent,
              child: Text("Index: $idx")
            )
          );
        },
        
      )
    );
  }
}
