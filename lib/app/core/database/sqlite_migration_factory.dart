import 'package:todo_list_provider/app/core/database/migrations/migration.dart';
import 'package:todo_list_provider/app/core/database/migrations/migrationV1.dart';
import 'package:todo_list_provider/app/core/database/migrations/migrationV2.dart';
import 'package:todo_list_provider/app/core/database/migrations/migrationV3.dart';

class SqliteMigrationFactory {
  List<Migration> getCreateMigration() => [
    MigrationV1(),
    MigrationV2(),
    MigrationV3(),
  ];

  List<Migration> getUpgradeMigration(int version) {
    final migrations = <Migration>[];

    if(version == 1) {
      migrations.add(MigrationV2());
      migrations.add(MigrationV3());
    }

    if(version == 2) {
      migrations.add(MigrationV3());
    }

    return migrations;
  }
}
