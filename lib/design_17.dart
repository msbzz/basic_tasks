import 'package:flutter/material.dart';

const String imageFlutter='assets/images/flutter.gif';
const String  imageReact='assets/images/react.jpg';
const String  imageCsharp='assets/images/csharp.png';
const String  imageBali='assets/images/surfbali.png';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: Container(),
          //pode se colocar um icone. No nosso caso vai apenas ocupar espaço
          backgroundColor: Colors.blueAccent,
          title: Text(
            'Tarefas',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ListView(
          children: [
            Task('Aprender Flutter',imageFlutter,3),
            Task('Estudar React',imageReact,1),
            Task('Estudar C#',imageCsharp,4),
            Task('Ir a Bali, Surfar muito,Beber muita cerveja,Farrear com os amigos',imageBali,5),
          ],
        ),
      ),
    );
  }
}

class Task extends StatefulWidget {
  final String nomeTarefa;
  final String urlFoto;
  final int dificuldadeTarefa;
  const Task(this.nomeTarefa,this.urlFoto,this.dificuldadeTarefa ,{super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int _nivel = 0;

  @override
  Widget build(BuildContext context) {

    // Calcula o valor do progresso

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        //color:Colors.teal,
        child: Stack(
          children: [
            Container(
              color: Colors.blue,
              height: 140,
            ),
            Column(
              children: [
                Container(
                  color: Colors.white,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.black26,
                        width: 72,
                        height: 100,
                        child: widget.urlFoto.isNotEmpty
                            ? Image.asset(widget.urlFoto, fit: BoxFit.cover)
                            : Container(), // Ou algum outro widget como um ícone

                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            child: Text(
                              widget.nomeTarefa,
                              style: TextStyle(
                                  fontSize: 24, overflow: TextOverflow.ellipsis),
                            ),
                          ),
                          /*
                          Row(
                            children: [
                              Icon(Icons.star, size: 15,color:Colors.blue),
                              Icon(Icons.star, size: 15,color:Colors.blue),
                              Icon(Icons.star, size: 15,color:Colors.blue),
                              Icon(Icons.star, size: 15,color:Colors.blue[100]),
                              Icon(Icons.star, size: 15,color:Colors.blue[100]),

                            ],
                          ),
                          */
                          Row(
                            children: buildStars(widget.dificuldadeTarefa), // Passa o número desejado de estrelas azuis
                          )

                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 80, // Largura do botão
                          height: 60, // Altura do botão

                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _nivel++;
                              });
                              print(_nivel);
                            },

                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue, // Cor de fundo do botão
                              foregroundColor: Colors.white, // Cor do texto e ícones no botão
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),

                            child: FittedBox(

                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.arrow_drop_up, size: 24),
                                  SizedBox(height: 4), // Espaço entre ícone e texto
                                  Text(
                                    'Up',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                      ),
                      child: Container(
                        width: 200,
                        child: LinearProgressIndicator(
                            color: Colors.white,
                            value: (widget.dificuldadeTarefa>0)
                            ? (_nivel/widget.dificuldadeTarefa) / 10
                            :1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Nivel $_nivel',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildStars(int starCount) {
    List<Widget> stars = [];
    for (int i = 0; i < 5; i++) {
      stars.add(
        Icon(
          Icons.star,
          size: 15,
          color: i < starCount ? Colors.blue : Colors.blue[100],
        ),
      );
    }
    return stars;
  }

}
