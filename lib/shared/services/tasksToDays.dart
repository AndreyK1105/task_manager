import '../domain/entities/todo/day.dart';
import '../domain/entities/todo/task.dart';

List<Day> taskToDays(List<Task> tasks) {
  List<Day> days = [];
  List<Task> tasksDay = [];
  List<Task> tasksComplited = [];
  Day day = Day(tasks: [], tasksComplited: [], data: 0);
  if (tasks.isNotEmpty) {
    days.add(day);
    if (tasks[0].done) {
      days.last.tasksComplited.add(tasks[0]);
    } else {
      days.last.tasks.add(tasks[0]);
    }
    days.last.data = tasks[0].date;
    for (int i = 1; i < tasks.length; i++) {
      if (tasks[i].date == tasks[i - 1].date) {
        tasks[i].done
            ? days.last.tasksComplited.add(tasks[i])
            : days.last.tasks.add(tasks[i]);
      } else {
        Day day = Day(tasks: [], tasksComplited: [], data: 0);
        tasks[i].done
            ? day.tasksComplited.add(tasks[i])
            : day.tasks.add(tasks[i]);
        day.data = tasks[i].date;
        days.add(day);
      }
    }
  }

  // for (int i = 0; i < tasks.length; i++) {
  //   if (i == 0) {
  //     if (tasks[i].done) {
  //       tasksComplited.add(tasks[i]);
  //       day.tasksComplited.addAll(tasksComplited);
  //     } else {
  //       tasksDay.add(tasks[i]);
  //       day.tasks.addAll(tasksDay);
  //     }

  //     day.data = tasks[i].date;
  //     days.add(day);
  //   } else {
  //     if (i > 0 && tasks[i].date == tasks[i - 1].date) {
  //       tasks[i].done
  //           ? days.last.tasksComplited.add(tasks[i])
  //           : days.last.tasks.add(tasks[i]);
  //     } else {
  //       tasksDay.clear();
  //       tasksComplited.clear();
  //       Day day1 = Day(tasks: [], tasksComplited: [], data: 0);
  //       tasks[i].done
  //           ? {tasksComplited.add(tasks[i]), day1.tasks.addAll(tasksComplited)}
  //           : {
  //               tasksDay.add(tasks[i]),
  //               day1.tasks.addAll(tasksDay),
  //             };

  //       day1.data = tasks[i].date;
  //       // print('isar_serv_todo  lengh days======${days.last.tasks.length}');
  //       days.add(day1);
  //     }
  //   }
  // }
  // print('tasktoDays ${days.length}');
  // print('tasktoDays ${days.last.tasksComplited.length}');
  // print('tasktoDays ${days.first.tasksComplited.length}');
  return days;
}
