import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';

import '../../../../config/providers.dart';
import '../../../../main.dart';
import '../../../../shared/domain/entities/todo/task.dart';
import '../widgets/calendar_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Calendar extends ConsumerStatefulWidget {
  const Calendar({super.key});

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends ConsumerState<Calendar> {
  //CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  ScrollController controller = ScrollController();
  bool controllerJumping = false;
  // late ServiceDb serviceDb;
  late final isar;
  @override
  void initState() {
    // TODO: implement initState
    // initIsar();

    ref.read(isarProviderTask);
  }

  // void initIsar() async {
  //   isar = await Isar.open([TaskSchema]);
  //   serviceDb = ServiceDb(isar: isar);
  // }
  Future<Task> getTask() async {
    Isar isar = await ref.read(isarProviderTask.future);
    final task = isar.tasks.get(-9223372036854775808) as Task;
//task.then((value) => )
    return task;
  }

  @override
  Widget build(BuildContext context) {
    // print('date= ${DateFormat.M().format(DateTime(2023, 1, 366))}');
    // print(' date= ${(DateTime(2023, 1, 364))}');
    // print(' date= ${(DateTime.parse('2023-01-01'))}');
    Task task1 = Task(
        description: 'description',
        date: 0,
        timeStart: 0,
        timeEnd: 0,
        reminder: 0,
        color: 1);
    final task = getTask();
    task.then((value) {
      task1 = value;
    });

    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          //Theme.of(context).colorScheme.copyWith().primary.red;
          Theme.of(context).switchTheme;
          ThemeMode themeMode = ThemeMode.dark;
          // final tasks = await serviceDb.getTask(DateTime(2023, 2, 13));
          // print('task${tasks.last.id}');
          // print('task${tasks.last.name}');
          // print('task${tasks.last.note}');
          // print('task${tasks.last.time}');
          // Task task1 = Task(
          //     time: DateTime(2023, 5, 13, 14, 30),
          //     name: 'task1 13.5.2023 14:30');
          // Task task2 = Task(
          //     time: DateTime(2023, 1, 13, 1, 0), name: 'task1 13.1.2023 1:00');
          // //  List<Task> tasks = [task1, task2];
          // String defaultName = 'defaultName';
          // // TasksDay tasksDay =
          // //     TasksDay( tasks: tasks);
          // await isar.writeTxn(() async {
          //   await isar.tasks.put(task1);
          // });
          // await isar.writeTxn(() async {
          //   Id i = await isar.tasks.put(task2);
          //   print(i);
          //  });
        }),
        appBar: AppBar(
          title:
              Text('TableCalendar - Basics ${task1 != null ? task1.date : ""}'),
        ),
        body: Row(
          children: [
            Expanded(
              child: PageView.builder(
                  // controller: PageController(viewportFraction: 1),
                  // padEnds: false,
                  scrollDirection: Axis.vertical,
                  itemCount: 12,
                  itemBuilder: (BuildContext context, index) {
                    int previosMonthLastDay =
                        (DateTime(2023, index + 1, 0)).day;
                    // print((DateTime(2023, 1, 2)).millisecondsSinceEpoch);
                    int firstMonthDay = (DateTime(
                      2023,
                      index + 1,
                    )).weekday;

                    int amountDays = (DateTime(2023, index + 2, 0)).day;
                    String mounth = DateFormat.MMMM().format(DateTime(
                      2023,
                      index + 1,
                    ));
                    return Column(
                      children: [
                        // myBox(),
                        month(previosMonthLastDay, firstMonthDay, amountDays,
                            mounth),
                      ],
                    );
                  }),
            ),
            const Text('data'),
          ],
        )
        /*
      TableCalendar(
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: _focusedDay,
        calendarFormat: _calendarFormat,
        selectedDayPredicate: (day) {
          // Use `selectedDayPredicate` to determine which day is currently selected.
          // If this returns true, then `day` will be marked as selected.

          // Using `isSameDay` is recommended to disregard
          // the time-part of compared DateTime objects.
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(_selectedDay, selectedDay)) {
            // Call `setState()` when updating the selected day
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          }
        },
        onFormatChanged: (format) {
          if (_calendarFormat != format) {
            // Call `setState()` when updating calendar format
            setState(() {
              _calendarFormat = format;
            });
          }
        },
        onPageChanged: (focusedDay) {
          // No need to call `setState()` here
          _focusedDay = focusedDay;
        },
      ),
      */
        );
  }
}
