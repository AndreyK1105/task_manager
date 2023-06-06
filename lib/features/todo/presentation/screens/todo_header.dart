import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../../../../config/providers.dart';
import '../../../../shared/domain/entities/todo/task.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../../domain/providers/todo_providers.dart';
import '../providers/todo_state_provider.dart';
import 'new_task_dialog.dart';

class TodoHeader extends ConsumerWidget {
  const TodoHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverPersistentHeader(
        pinned: true,
        floating: false,
        delegate: HeaderDelegat(
          maxExtent: 60,
          minExtent: 50,
          child: Row(
            children: [
              const Text('Todo List'),
              const Expanded(
                flex: 2,
                child: SizedBox(width: 10),
              ),
              FilledButton(
                  onPressed: () {
                    ref.read(todoNotiferProvider.notifier).setTodayIndex(ref);
                    //  ref.watch(todoDaysScrollController).animateTo(100,
                    // duration: const Duration(milliseconds: 1500),
                    // curve: Curves.linear);
                  },
                  child: Text('Today')),
              const Expanded(
                flex: 1,
                child: SizedBox(width: 10),
              ),
              OutlinedButton(
                onPressed: () async {
                  DateTime dateNow = DateTime.now();
                  TimeOfDay timeStart = const TimeOfDay(hour: 7, minute: 0);
                  TimeOfDay timeEnd = const TimeOfDay(hour: 8, minute: 0);
                  // String description = '';
                  Task task = Task(
                    date: DateTime(dateNow.year, dateNow.month, dateNow.day)
                        .millisecondsSinceEpoch,
                    color: 0,
                    timeStart: DateTime(dateNow.year, dateNow.month,
                            dateNow.day, timeStart.hour, timeStart.minute)
                        .millisecondsSinceEpoch, //  timeStart.hour,
                    timeEnd: timeEnd.hour, description: '', reminder: 0,
                  );

                  var resp = await dialogNewTask(context, ref, task);
                  if (resp.runtimeType == Task) {
                    Task task = resp;
                    print(
                        'todo header task description=====${task.description}');

                    ref.read(todoNotiferProvider.notifier).newTask(task);
                    ref.read(todoNotiferProvider.notifier).getDays();
                  } else {
                    print('todo header task cancel');
                  }
                },
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: const Text('New task'),
              ),
              SizedBox(width: 10),

              // FilledButton(onPressed: () {}, child: const Text('Elevated')),
            ],
          ),
        ));
  }
}
