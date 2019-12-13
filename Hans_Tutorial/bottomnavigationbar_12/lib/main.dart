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
      home: MyHomePage(),
    ));


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int index = 0;

  List<Widget> lstPages = [
    Container(color: Colors.red),
    Container(color: Colors.blue),
    Container(color: Colors.green),
    Container(color: Colors.orange),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BottomNavigationBar"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type:BottomNavigationBarType.fixed,       // Default is BottomNavigationBarType.shifting
        currentIndex: index,
        onTap: (int idx){
          setState((){
            index = idx;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.add, color: Colors.black87), title: Text("Add", style: TextStyle(color: Colors.black87),)),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle, color: Colors.black87), title: Text("Acount", style: TextStyle(color: Colors.black87),)),
          BottomNavigationBarItem(icon: Icon(Icons.close, color: Colors.black87), title: Text("Close", style: TextStyle(color: Colors.black87),)),
          BottomNavigationBarItem(icon: Icon(Icons.build, color: Colors.black87), title: Text("Build", style: TextStyle(color: Colors.black87),)),
        ],
      ),
      body: lstPages[index]
    );
  }
}


