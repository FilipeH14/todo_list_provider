import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/modules/tasks/tasks_create_controller.dart';

class TasksCreatePage extends StatelessWidget {
  TasksCreateController _controller;

  TasksCreatePage({
    required TasksCreateController controller,
    Key? key,
  })  : _controller = controller,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
