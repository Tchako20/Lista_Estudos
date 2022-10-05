import 'package:flutter/material.dart';
import 'package:testes/model/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Task> taskList = [
    Task('Aprender Dart', 'assets/images/dart.png', 3),
    Task('Aprender Flutter', 'assets/images/dash.png', 4),
    Task('Java', 'assets/images/java.png', 3),
    Task('JavaScript', 'assets/images/javascript.png', 4),
    Task('MySQL', 'assets/images/mysql.png', 5),
  ];

  void newTask(String name, String photo,int difficulty){
    taskList.add(Task(name, photo, difficulty));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
