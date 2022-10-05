import 'package:flutter/material.dart';
import 'package:testes/data/task_inherited.dart';
import 'package:testes/screens/form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: Container(),
        title: const Center(child: Text('Lista De Estudos')),
      ),
      body: ListView(
        children: TaskInherited.of(context).taskList,
        padding: EdgeInsets.only(top: 10,bottom: 70),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(taskContext: context,),
            ),
          );
        },
        child: const Icon(Icons.add_task)
      ),
    );
  }
}





// class InitialScreen extends StatefulWidget {
//   const InitialScreen({Key? key}) : super(key: key);

//   @override
//   State<InitialScreen> createState() => _InitialScreenState();
// }

// class _InitialScreenState extends State<InitialScreen> {
//   @override
//   Widget build(BuildContext context) {
//     // bool opacidade = true;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Flutter: Primeiros Passos'),
//         leading: Icon(Icons.add_task),
//       ),
//       body: Container(
//         color: Color.fromARGB(255, 12, 168, 25),
//         child: ListView(
//           children: TaskInherited.of(context).taskList,
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (contextNew) => FormScreen(taskContext: context,)),
//             );
//           });
//         },
//         backgroundColor: Colors.blue[700],
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
