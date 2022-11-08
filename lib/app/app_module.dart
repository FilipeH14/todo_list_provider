import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_list_provider/app/app_widget.dart';
import 'package:todo_list_provider/app/core/database/sqlite_migration_factory.dart';

class AppModule extends StatelessWidget {
  const AppModule({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => SqliteMigrationFactory(),
          lazy: false,
        ),
      ],
      child: const AppWidget(),
    );
  }
}
