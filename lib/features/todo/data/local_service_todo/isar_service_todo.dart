import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:task_manager/shared/domain/entities/check/check_list.dart';
import 'package:task_manager/shared/services/tasksToDays.dart';

import '../../../../shared/data/local_service/local_service.dart';
import '../../../../shared/domain/entities/todo/day.dart';
import '../../../../shared/domain/entities/todo/task.dart';
import 'local_service_todo.dart';

class IsarService extends LocalService {
  // Isar isar;
  // IsarService({

  // });

  Future<Isar> initialize() async {
    Isar isar;
    if (Isar.getInstance() == null) {
      final dir = await getApplicationDocumentsDirectory();
      isar = await Isar.open(
        [TaskSchema, CheckListSchema],
        directory: dir.path,
      );
    } else {
      isar = Isar.getInstance()!;
    }
    return isar;
  }

  @override
  Future<List<Day>> getDays() async {
    Isar isar = await initialize();
    return await isar.writeTxn(() async {
      final tasks = await isar.tasks.where().anyDate().findAll();
      return taskToDays(tasks);
      // List<Day> days = [];
      // List<Task> taskDay = [];
      // Day day = Day(tasks: [], data: 0);
      // for (int i = 0; i < tasks.length; i++) {
      //   if (i == 0) {
      //     taskDay.add(tasks[i]);
      //     day.tasks.addAll(taskDay);
      //     day.data = tasks[i].date;
      //     days.add(day);
      //   } else {
      //     if (i > 0 && tasks[i].date == tasks[i - 1].date) {
      //       days.last.tasks.add(tasks[i]);
      //     } else {
      //       taskDay.clear();
      //       Day day = Day(tasks: [], data: 0);
      //       taskDay.add(tasks[i]);

      //       day.tasks.addAll(taskDay);
      //       day.data = tasks[i].date;
      //       // print('isar_serv_todo  lengh days======${days.last.tasks.length}');
      //       days.add(day);
      //     }
      //   }
      // }

      // return days;
    });
  }

  @override
  Future<void> newTask(Task task) async {
    print('isar_serv_todo---${task.description}');
    Isar isar = await initialize();
    return await isar.writeTxn(() {
      return isar.tasks.put(task);
    });
  }

  @override
  Future<void> deleteTask(Task task) async {
    Isar isar = await initialize();
    return await isar.writeTxn(() {
      return isar.tasks.delete(task.id);
    });
  }
}
