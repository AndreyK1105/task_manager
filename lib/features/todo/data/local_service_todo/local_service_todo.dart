import 'package:task_manager/shared/domain/entities/todo/day.dart';

import '../../../../shared/domain/entities/todo/task.dart';

abstract class LocalService {
  Future<List<Day>> getDays();
  Future<void> newTask(Task task);
  Future<void> deleteTask(Task task);
}
