import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/core/modules/todo_list_modules.dart';
import 'package:todo_list_provider/app/modules/tasks/tasks_create_controller.dart';
import 'package:todo_list_provider/app/modules/tasks/tasks_create_page.dart';

class TasksModule extends TodoListModules {
  TasksModule()
      : super(
          bindings: [
            ChangeNotifierProvider(
                create: (context) => TasksCreateController()),
          ],
          routers: {
            '/tasks/create': (context) => TasksCreatePage(
                  controller: context.read(),
                ),
          },
        );
}
