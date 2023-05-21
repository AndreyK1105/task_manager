import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:task_manager/features/todo/data/local_service_todo/isar_service_todo.dart';
import 'package:task_manager/features/todo/data/local_service_todo/local_service_todo.dart';
import 'package:task_manager/features/todo/domain/repositories/todo_repository.dart';
import 'package:task_manager/features/todo/presentation/providers/state/todo_state.dart';

import '../../../../config/providers.dart';
import '../../../../shared/data/local_service/isar_service.dart';
import '../../../../shared/data/local_service/local_service.dart';
import '../../data/datasources/local_datasource.dart';
import '../../data/repositories/todo_repositoryimpl.dart';

final isarServiceProviderTodo = FutureProvider(
  (ref) async {
    // Isar isar = await ref.read(isarProviderTask.future);
    return IsarService();
  },
);

final todoDatasourceProvider =
    Provider.family<TodoLocalDatasource, LocalService>(
        (_, localService) => TodoLocalDatasource(localService));

final todoRepositoryProvider = Provider<TodoRepository>(
  (ref) {
    // print('todo providers');
    //final localService = ref.watch(IsarService());
    final datasource = ref.watch(todoDatasourceProvider(IsarService()));
    final repository = TodoRepopsitoryImpl(todoDatasource: datasource);

    return repository;
  },
);
