import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:task_manager/config/providers.dart';
import 'package:task_manager/shared/data/local_service/isar_service.dart';

final isarServiceProvider = FutureProvider(
  (ref) async {
    Isar isar = await ref.read(isarProvider.future);
    return IsarService(isar: isar);
  },
);
