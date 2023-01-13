import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/core/notifier/default_change_notifier.dart';
import 'package:todo_list_provider/app/models/tasks_filter_enum.dart';

class HomeController extends DefaultChangeNotifier {
  var filterSelected = TasksFilterEnum.tomorrow;
}
