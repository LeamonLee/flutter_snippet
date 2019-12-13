import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home:MyHomePage()));

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<String> lstToggleItem = [
    "B",
    "A",
    "I",
    "S"
  ];

  List<bool> lstIsSelected = [
    false,
    false,
    false,
    false
  ];

  String strSelectedText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("toggle Button Demo"),
      ),
      body:Column(
        children: <Widget>[
          ToggleButtons(
            children: List.generate(
              lstToggleItem.length, 
              (index){
                return Text(lstToggleItem[index]);
              }
            ),
            isSelected: lstIsSelected,
            selectedColor: Colors.lightBlueAccent,
            selectedBorderColor: Colors.black87,
            onPressed: (index){
              lstIsSelected[index] = lstIsSelected[index]? false : true;

              strSelectedText = '';
              for(int i = 0; i < lstToggleItem.length; i++){
                if(lstIsSelected[i]){
                  strSelectedText = "$strSelectedText ${lstToggleItem[i]},";
                }
              }

              setState(() {
                
              });
            },
          ),
          SelectableText(strSelectedText),
        ],
      )
    );
    
  }
}