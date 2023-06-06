// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:task_manager/features/todo/data/local_service_todo/local_service_todo.dart';

import '../../../../shared/data/local_service/isar_service.dart';
import '../../../../shared/data/local_service/local_service.dart';
import '../../../../shared/domain/entities/todo/day.dart';
import '../../../../shared/domain/entities/todo/task.dart';

abstract class TodoDataSource {
  Future<List<Day>> getDays();
  Future<void> newTask(Task task);
  Future<void> updateTask(Task task);
}

class TodoLocalDatasource extends TodoDataSource {
  LocalService localService;
  TodoLocalDatasource(
    this.localService,
  );

  @override
  Future<List<Day>> getDays() async {
    //List<Day> list = await
    return localService.getDays();

    //list;
  }

  @override
  Future<void> newTask(Task task) async {
    return localService.newTask(task);
  }

  @override
  Future<void> updateTask(Task task) {
    return localService.deleteTask(task);
  }
}
