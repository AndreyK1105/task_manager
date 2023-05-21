import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:task_manager/shared/domain/entities/check/check_list.dart';

import '../shared/domain/entities/todo/task.dart';

final isarProviderTask = FutureProvider((ref) async {
  final dir = await getApplicationDocumentsDirectory();
  return await Isar.open([TaskSchema, CheckListSchema], directory: dir.path);
});
final isarProviderCheck = FutureProvider((ref) async {
  final dir = await getApplicationDocumentsDirectory();
  return await Isar.open([CheckListSchema], directory: dir.path);
});
