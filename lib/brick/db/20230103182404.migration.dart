// GENERATED CODE EDIT WITH CAUTION
// THIS FILE **WILL NOT** BE REGENERATED
// This file should be version controlled and can be manually edited.
part of 'schema.g.dart';

// While migrations are intelligently created, the difference between some commands, such as
// DropTable vs. RenameTable, cannot be determined. For this reason, please review migrations after
// they are created to ensure the correct inference was made.

// The migration version must **always** mirror the file name

const List<MigrationCommand> _migration_20230103182404_up = [
  InsertTable('Note'),
  InsertColumn('id', Column.varchar, onTable: 'Note', unique: true),
  InsertColumn('text', Column.varchar, onTable: 'Note')
];

const List<MigrationCommand> _migration_20230103182404_down = [
  DropTable('Note'),
  DropColumn('id', onTable: 'Note'),
  DropColumn('text', onTable: 'Note')
];

//
// DO NOT EDIT BELOW THIS LINE
//

@Migratable(
  version: '20230103182404',
  up: _migration_20230103182404_up,
  down: _migration_20230103182404_down,
)
class Migration20230103182404 extends Migration {
  const Migration20230103182404()
    : super(
        version: 20230103182404,
        up: _migration_20230103182404_up,
        down: _migration_20230103182404_down,
      );
}
