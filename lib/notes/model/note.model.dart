import 'package:brick_offline_first_with_rest/offline_first_with_rest.dart';

@ConnectOfflineFirstWithRest()
class Note extends OfflineFirstWithRestModel {
  Note({
    this.id,
    required this.text,
  });

  @Sqlite(unique: true)
  final String? id;

  final String text;
}
