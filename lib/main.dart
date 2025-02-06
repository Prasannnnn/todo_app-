import 'package:flutter/material.dart';

void main(){
  runApp(MainApp());
}
class MainApp extends StatefulWidget{

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String displaytext = "No Text Data";

  List<String> tasklist = [];

  TextEditingController textcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Todo List App"),
          backgroundColor: Colors.blue,
          centerTitle: false,
        ),
        body: Column(
          children: [

            Row(
              children: [
                Expanded(child: Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: textcontroller,
                decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Enter a Task"),
              ),
            ),
            ),
            ),
            MaterialButton(
              color: Colors.white,
              height: 50,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              onPressed: () {
                setState(() {
                  tasklist.add(textcontroller.text);
                  textcontroller.clear();
                });
              } ,
              child: Text("Enter"),
              ),

              ],
            ),
            

              Flexible(
              child: ListView.builder(
                itemCount: tasklist.length,
                itemBuilder: (context,index){
                  return Row(
                children: [
                  Expanded(child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(tasklist[index]),
                  ),
                  ),             
                  MaterialButton(
                    child: Icon(Icons.delete,color: Colors.red,),
                    onPressed: () {
                        setState(() {
                          tasklist.removeAt(index);
                        });
                    })
                ],
              );
                }),
            )

            
            ],

        ),
      ),
    );
  }
}