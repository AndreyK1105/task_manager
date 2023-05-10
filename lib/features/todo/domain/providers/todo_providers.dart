import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:task_manager/features/todo/domain/repositories/todo_repository.dart';
import 'package:task_manager/features/todo/presentation/providers/state/todo_state.dart';

import '../../../../shared/data/local_service/isar_service.dart';
import '../../../../shared/domain/providers/isar_local_service_provider.dart';
import '../../data/datasources/local_datasource.dart';
import '../../data/repositories/todo_repositoryimpl.dart';

final todoDatasourceProvider =
    FutureProvider.family<TodoLocalDatasource, IsarService>(
        (_, isarservice) => TodoLocalDatasource(isarservice));

final todoRepositoryProvider = FutureProvider<TodoRepository>(
  (ref) async {
    final isarService = ref.watch(isarServiceProvider.future);
    final datasource =
        ref.watch(todoDatasourceProvider(await isarService).future);
    final repository =
        TodoRepopsitoryImpl(todoLocalDatasource: await datasource);

    return repository;
  },
);
