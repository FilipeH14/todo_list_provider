import 'package:todo_list_provider/app/core/modules/todo_list_modules.dart';
import 'package:todo_list_provider/app/modules/home/home_page.dart';

class HomeModule extends TodoListModules {
  HomeModule()
      : super(
          bindings: [],
          routers: {
            '/home': (context) => const HomePage(),
          },
        );
}
