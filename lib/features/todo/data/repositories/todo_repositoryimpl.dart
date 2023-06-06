// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:task_manager/features/todo/domain/repositories/todo_repository.dart';

import '../../../../shared/domain/entities/todo/day.dart';
import '../../../../shared/domain/entities/todo/task.dart';
import '../datasources/local_datasource.dart';

class TodoRepopsitoryImpl implements TodoRepository {
  TodoDataSource todoDatasource;
  TodoRepopsitoryImpl({
    required this.todoDatasource,
  });
  @override
  Future<List<Day>> getDays() {
    return todoDatasource.getDays();
  }

  @override
  Future newTask(Task task) {
    return todoDatasource.newTask(task);
  }

  @override
  Future<void> deleteTask(Task task) {
    return todoDatasource.updateTask(task);
  }
}
