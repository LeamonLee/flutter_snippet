import 'dart:convert';

import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'dart:convert';
import 'sqliteService.dart';

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
    )
);


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final String strUrl = "https://jsonplaceholder.typicode.com/posts";
  final sqlHelper = SqliteHelper();

  getAllPosts() async {
    await sqlHelper.openDB();
    return await sqlHelper.queryAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Sqlite in Flutter"),
      ),
      body: FutureBuilder(
        future: getAllPosts(),
        builder:(context, snap){
          if(snap.hasData){

            List lstData = snap.data;
            return ListView.builder(
              itemCount:lstData.length,
              itemBuilder: (context, idx){
                return InkWell(
                  onTap: () async {
                    await sqlHelper.delete(lstData[idx]['id']);
                    setState(() {
                      
                    });
                  },
                  child: ListTile(
                    title: Text(lstData[idx]["title"]),
                  ),
                  );
              },
            );
          }

          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        child:Icon(Icons.http),
        onPressed: () async {

          await sqlHelper.openDB();
          var res = await http.get(strUrl);
          List lstRes = jsonDecode(res.body);

          lstRes.forEach((e) async {
            return await sqlHelper.insertData(e);
          });

          setState(() {
            
          });
        },
      ),
    );
  }
}

