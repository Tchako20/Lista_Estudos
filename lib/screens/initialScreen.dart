import 'package:flutter/material.dart';
import 'package:testes/data/task_dao.dart';
import 'package:testes/data/task_inherited.dart';
import 'package:testes/screens/form_screen.dart';

import '../model/task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        centerTitle: true,
        leading: Container(),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: Icon(Icons.refresh)),
        ],
        title: Text("Lista De Estudos"),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10, bottom: 70),
        child: FutureBuilder<List<Task>>(
            future: TaskDao().findAll(),
            builder: (context, snapshot) {
              List<Task>? items = snapshot.data;
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Center(
                    child: Column(children: [
                      CircularProgressIndicator(),
                      Text("carregando"),
                    ]),
                  );
                  break;
                case ConnectionState.waiting:
                  return Center(
                    child: Column(children: [
                      CircularProgressIndicator(),
                      Text("carregando")
                    ]),
                  );
                  break;
                case ConnectionState.active:
                  return Center(
                    child: Column(children: [
                      CircularProgressIndicator(),
                      Text("carregando"),
                    ]),
                  );
                  break;
                case ConnectionState.done:
                  if (snapshot.hasData && items != null) {
                    if (items.isNotEmpty) {
                      return ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (BuildContext context, int index) {
                            final Task tarefa = items[index];
                            return tarefa;
                          });
                    }
                    return Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.error_outline,
                            size: 128,
                          ),
                          Text(
                            "não ha nenhuma Tarefa",
                            style: TextStyle(fontSize: 32),
                          ),
                        ],
                      ),
                    );
                  }
                  return Text("Erro ao carregar tarefas");
                  break;
              }
              return Text("Error desconhecido");
            }),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (contextNew) => FormScreen(
                  taskContext: context,
                ),
              ),
            ).then((value) => setState(() {
                  print("Recarregando a tela");
                }));
          },
          child: const Icon(Icons.add_task)),
    );
  }
}
