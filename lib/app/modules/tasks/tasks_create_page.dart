import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/core/notifier/default_listener_notifier.dart';
import 'package:todo_list_provider/app/core/ui/theme_extensions.dart';
import 'package:todo_list_provider/app/core/widget/todo_list_field.dart';
import 'package:todo_list_provider/app/modules/tasks/tasks_create_controller.dart';
import 'package:todo_list_provider/app/modules/tasks/widget/calendar_button.dart';
import 'package:validatorless/validatorless.dart';

class TasksCreatePage extends StatefulWidget {
  final TasksCreateController _controller;

  TasksCreatePage({
    required TasksCreateController controller,
    Key? key,
  })  : _controller = controller,
        super(key: key);

  @override
  State<TasksCreatePage> createState() => _TasksCreatePageState();
}

class _TasksCreatePageState extends State<TasksCreatePage> {
  @override
  void initState() {
    DefaultListenerNotifier(
      changeNotifier: widget._controller,
    ).listener(
        context: context,
        successCallback: (notifier, listenerInstance) {
          listenerInstance.dispose();
          Navigator.pop(context);
        });
    super.initState();
  }

  @override
  void dispose() {
    _descriptionEc.dispose();
    super.dispose();
  }

  final _descriptionEc = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.black,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Criar atividade',
                  style: context.titleStyle.copyWith(fontSize: 20),
                ),
              ),
              const SizedBox(height: 30),
              TodoListField(
                label: '',
                controller: _descriptionEc,
                validator: Validatorless.required('Descrição é obrigatória'),
              ),
              const SizedBox(height: 20),
              CalendarButton(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: context.primaryColor,
        label: const Text(
          'Salvar Task',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          final formValid = _formKey.currentState?.validate() ?? false;

          if (formValid) {
            widget._controller.save(_descriptionEc.text);
          }
        },
      ),
    );
  }
}
