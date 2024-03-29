import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/core/ui/theme_extensions.dart';
import 'package:todo_list_provider/app/models/tasks_filter_enum.dart';
import 'package:todo_list_provider/app/models/total_tasks_model.dart';
import 'package:todo_list_provider/app/modules/home/home_controller.dart';
import 'package:todo_list_provider/app/modules/home/widgets/todo_card_filter.dart';

class HomeFilters extends StatelessWidget {
  const HomeFilters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'FILTROS',
          style: context.titleStyle,
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              TodoCardFilter(
                label: 'HOJE',
                taskFilter: TasksFilterEnum.today,
                totalTasksModel: TotalTasksModel(
                  totalTasks: 8,
                  totalTasksFinish: 5,
                ),
                selected: context.select<HomeController, TasksFilterEnum>(
                        (value) => value.filterSelected) ==
                    TasksFilterEnum.today,
              ),
              TodoCardFilter(
                label: 'AMANHÂ',
                taskFilter: TasksFilterEnum.tomorrow,
                selected: context.select<HomeController, TasksFilterEnum>(
                        (value) => value.filterSelected) ==
                    TasksFilterEnum.tomorrow,
              ),
              TodoCardFilter(
                label: 'SEMANA',
                taskFilter: TasksFilterEnum.week,
                selected: context.select<HomeController, TasksFilterEnum>(
                        (value) => value.filterSelected) ==
                    TasksFilterEnum.week,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
