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
        body:ListView(

          children: [
            Task('Aprender Flutter'),
            Task('Estudar React'),
            Task('Estudar C#'),
            Task('Ir a Bali, Surfar muito,Beber muita cerveja,Farrear com os amigos'),
          ],
        ),

      ),
    );
  }
}

class Task extends StatefulWidget {

  final String nomeTarefa;

  const Task(this.nomeTarefa,{super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {

  int _nivel=0;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        //color:Colors.teal,
        child:Stack(
          children: [
            Container(
              color:Colors.blue,
              height: 140,),
            Column(
              children: [
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
                      Container(
                           width: 200,
                          child: Text(
                            widget.nomeTarefa,style:
                            TextStyle(
                                fontSize: 24,
                                overflow: TextOverflow.ellipsis
                            ),
                          )
                      ),
                      ElevatedButton(onPressed: (){
                        setState(() {
                          _nivel++;
                        });

                        print(_nivel);
                      },
                          child: Icon(Icons.arrow_drop_up))
                    ],
                  ),
                ),
                Text('Nivel $_nivel',style:TextStyle(color:Colors.white,fontSize:16),)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

