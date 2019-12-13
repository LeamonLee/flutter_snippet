import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'models/post.dart';

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

  final String strUrl = "https://jsonplaceholder.typicode.com/posts";
  List lstDatas;

  getAPIData() async {
    // http.get(strUrl).then((response){
    //  print(response);
    //  jsonDecode(response.body);
    // });
    var response = await http.get(strUrl);
    
    setState(() {
      lstDatas = jsonDecode(response.body);  
    });
  }

  getAPIData2(){
    return http.get(strUrl);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getAPIData();
    return Scaffold(
      appBar: AppBar(
        title: Text("Http + FutureBuilder"),
      ),
      // body: ListView.builder(

      //   itemCount: lstDatas.length,
      //   itemBuilder: (context, idx){
      //     var data = lstDatas[idx];
      //     return ListTile(
      //       title: Text(data["title"]),
      //       subtitle: Text(data["body"]),
      //     );
      // })

      body: FutureBuilder(
        future: getAPIData2(),
        builder: (context, snap){
          if(!snap.hasData){
            return Container();
          }

          lstDatas = jsonDecode(snap.data.body);      // 回傳回來是一個List裡面包含很多Map物件

          return ListView.builder(
          itemCount: lstDatas.length,
          itemBuilder: (context, idx){
            Post data = Post.fromMap(lstDatas[idx]);
            return ListTile(
              title: Text(data.title),
              subtitle: Text(data.body),
            );
          });
        }
      ),
      

    );
  }
}
