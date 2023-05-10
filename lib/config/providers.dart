import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../shared/domain/entities/todo/task.dart';

final isarProvider = FutureProvider((ref) async {
  final dir = await getApplicationDocumentsDirectory();
  return await Isar.open([TaskSchema], directory: dir.path);
});
