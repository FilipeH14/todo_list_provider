import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/core/auth/auth_provider.dart';
import 'package:todo_list_provider/app/core/ui/theme_extensions.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Selector<AuthProvider, String>(
            selector: (context, authProvider) =>
                authProvider.user?.displayName ?? 'Não informado',
            builder: (_, value, __) => Text(
              'E ai, $value!',
              style: context.textTheme.headline5?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        // Text(
        //   'E ai, Filipe!',
        //   style: context.textTheme.headline5?.copyWith(
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
      ],
    );
  }
}
