import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/features/todo/presentation/providers/todo_state_provider.dart';
import 'package:task_manager/features/todo/presentation/screens/new_task_dialog.dart';

import '../../../../shared/domain/entities/todo/task.dart';

class TodoTaskDay extends ConsumerWidget {
  const TodoTaskDay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;

    if (ref.watch(todoNotiferProvider).days.isEmpty) {
      return SizedBox();
    } else {
      final int currentIndex = ref.watch(todoNotiferProvider).curentIndex;
      //print('todo task day curent index=${currentIndex}');
      final day = ref.watch(todoNotiferProvider).days[currentIndex];
      final int itemCount = day.tasks.length;

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
        child: Container(
          //height: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color.fromARGB(255, 128, 149, 185)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                      maxHeight: size.height / 3, minHeight: 100),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: day.tasks.isEmpty
                            ? SizedBox()
                            : ListView.builder(
                                shrinkWrap: true,
                                itemCount: itemCount,
                                itemBuilder: ((context, index) {
                                  return Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: InkWell(
                                          onTap: () async {
                                            var resp = await dialogNewTask(
                                                context, ref, day.tasks[index]);
                                            if (resp.runtimeType == Task) {
                                              Task task = resp;
                                              ref
                                                  .read(todoNotiferProvider
                                                      .notifier)
                                                  .newTask(task);
                                              ref
                                                  .read(todoNotiferProvider
                                                      .notifier)
                                                  .getDays();
                                            }
                                          },
                                          child: Text(
                                              style: TextStyle(),
                                              'task= ${day.tasks[index].description}'),
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            ref
                                                .watch(todoNotiferProvider
                                                    .notifier)
                                                .deleteTask(day.tasks[index]);
                                          },
                                          icon: const Icon(
                                              Icons.delete_forever_outlined))
                                    ],
                                  );
                                })),
                      ),
                      Text('${itemCount}'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
