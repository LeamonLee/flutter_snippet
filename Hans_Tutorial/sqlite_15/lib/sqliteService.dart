import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';


class SqliteHelper{

  final strSqlFileName = "mydb.sql";
  final strTableName = "posts";

  Database mySqliteDB;

  openDB() async {
    String strPath = "${await getDatabasesPath()} / $strSqlFileName";

    if(mySqliteDB == null){
      mySqliteDB = await openDatabase(strPath, version:1, onCreate: (db, ver) async {
        await db.execute('''
        Create Table posts(
          id integer primary key,
          userId integer,
          title text,
          body text
        );
        ''');
      });
    }
  }

  insertData(Map<String, dynamic> m) async {
    await mySqliteDB.insert(strTableName, m);
  }

  queryAll() async {
    return await mySqliteDB.query(strTableName, columns:null);    // columns 如果等於null則預設取回所有column
  }

  delete(int id) async {
    return await mySqliteDB.delete(strTableName, where: "id = $id");
  }

}