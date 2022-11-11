import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/core/database/sqlite_adm_connection.dart';
import 'package:todo_list_provider/app/modules/auth/login/login_controller.dart';
import 'package:todo_list_provider/app/modules/auth/login/login_page.dart';
import 'package:todo_list_provider/app/modules/splash/splash_page.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final sqliteAdmConnection = SqliteAdmConnection();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(sqliteAdmConnection);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.addObserver(sqliteAdmConnection);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'todo list provider',
      routes: {
        '/login': (_) => MultiProvider(
              providers: [
                Provider(create: (_) => 'Repository'),
                Provider(create: (_) => 'Service'),
                ChangeNotifierProvider(create: (_) => LoginController()),
              ],
              child: const LoginPage(),
            ),
        '/register': (_) => MultiProvider(
              providers: [
                Provider(create: (_) => 'Repository'),
                Provider(create: (_) => 'Service'),
                ChangeNotifierProvider(create: (_) => LoginController()),
              ],
              child: const LoginPage(),
            ),
      },
      home: SplashPage(),
    );
  }
}
