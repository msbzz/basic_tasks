import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home:Scaffold(
        appBar:AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text('Tarefas'),
        ) ,
        body:Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween ,
          children: [
            Task('Aprender Flutter'),
            Task('Estudar React'),
            Task('Estudar C#'),
          ],
        ),

      ),
    );
  }
}

class Task extends StatelessWidget {

  final String nomeTarefa;

  const Task(this.nomeTarefa,{super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color:Colors.teal,
      child:Stack(
        children: [
          Container(
            color:Colors.blue,
            height: 140,),
          Container(
            color:Colors.white,
            height: 100,
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                Container(
                  color:Colors.black26,
                  width: 72,
                  height: 100,
                ),
                Text(nomeTarefa,style: TextStyle(fontSize: 20),),
                ElevatedButton(onPressed: (){},
                    child: Icon(Icons.arrow_drop_up))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

