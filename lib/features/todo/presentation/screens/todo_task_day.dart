import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/features/todo/presentation/providers/todo_state_provider.dart';
import 'package:task_manager/features/todo/presentation/screens/new_task_dialog.dart';

import '../../../../shared/domain/entities/todo/day.dart';
import '../../../../shared/domain/entities/todo/task.dart';

class TodoTaskDay extends ConsumerWidget {
  const TodoTaskDay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;

    if (ref.watch(todoNotiferProvider).days.isEmpty) {
      return const SizedBox();
    } else {
      final int currentIndex = ref.watch(todoNotiferProvider).curentIndex;
      //print('todo task day curent index=${currentIndex}');
      final day = ref.watch(todoNotiferProvider).days[currentIndex];
      // final int itemCount = day.tasks.length;
      //   final int itemCountComplited = day.tasksComplited.length;
      List<dynamic> dayBuild = [];
      if (day.tasks.isNotEmpty || day.tasksComplited.isNotEmpty) {
        if (day.tasks.isNotEmpty) {
          dayBuild.addAll(day.tasks);
        } else {
          dayBuild.add('Complited');
        }
        dayBuild.add(true);
        if (day.tasksComplited.isNotEmpty) {
          dayBuild.addAll(day.tasksComplited);
        }
      } else {
        dayBuild.add('Creat new task');
      }

      final int itemCount = dayBuild.length;
      print('todo task day countAll = $itemCount');
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
        child: Container(
          //height: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromARGB(255, 128, 149, 185)),
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
                        child: Column(
                          children: [
                            /////////////////////

                            Expanded(
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: itemCount,
                                  itemBuilder: ((context, index) {
                                    if (dayBuild[index].runtimeType == Task) {
                                      bool isChecked = dayBuild[index].done;

                                      return Row(
                                        children: [
                                          Checkbox(
                                              value: isChecked,
                                              onChanged: (value) {
                                                ref
                                                    .watch(todoNotiferProvider
                                                        .notifier)
                                                    .changeComplited(
                                                        dayBuild[index]);
                                              }),
                                          Expanded(
                                            flex: 2,
                                            child: InkWell(
                                              onTap: () async {
                                                var resp = await dialogNewTask(
                                                    context, dayBuild[index]);
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
                                                  'task= ${dayBuild[index].description}'),
                                            ),
                                          ),
                                          IconButton(
                                              onPressed: () => showDialog(
                                                    context: context,
                                                    builder: (BuildContext
                                                            context) =>
                                                        AlertDialog(
                                                            title:
                                                                Text('Delete'),
                                                            actions: <Widget>[
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    context),
                                                            child: const Text(
                                                                'Cancel'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () {
                                                              ref
                                                                  .watch(todoNotiferProvider
                                                                      .notifier)
                                                                  .deleteTask(
                                                                      dayBuild[
                                                                          index]);
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: const Text(
                                                                'OK'),
                                                          ),
                                                        ]),
                                                  ),
                                              icon: const Icon(Icons
                                                  .delete_forever_outlined)),
                                        ],
                                      );
                                    } else {
                                      if (dayBuild[index].runtimeType ==
                                          String) {
                                        return Text(dayBuild[index]);
                                      } else {
                                        if (dayBuild[index].runtimeType ==
                                            bool) {
                                          return Divider();
                                        }
                                      }
                                    }
                                  })),
                            ),
////////////

                            // day.tasks.isEmpty
                            //     ? Text('All tasks complited')
                            //     : Expanded(
                            //         child: ListView.builder(
                            //             shrinkWrap: true,
                            //             itemCount: itemCount,
                            //             itemBuilder: ((context, index) {
                            //               bool isChecked =
                            //                   day.tasks[index].done;
                            //               return Row(
                            //                 children: [
                            //                   Checkbox(
                            //                       value: isChecked,
                            //                       onChanged: (value) {
                            //                         ref
                            //                             .watch(
                            //                                 todoNotiferProvider
                            //                                     .notifier)
                            //                             .changeComplited(
                            //                                 day.tasks[index]);
                            //                       }),
                            //                   Expanded(
                            //                     flex: 2,
                            //                     child: InkWell(
                            //                       onTap: () async {
                            //                         var resp =
                            //                             await dialogNewTask(
                            //                                 context,
                            //                                 day.tasks[index]);
                            //                         if (resp.runtimeType ==
                            //                             Task) {
                            //                           Task task = resp;
                            //                           ref
                            //                               .read(
                            //                                   todoNotiferProvider
                            //                                       .notifier)
                            //                               .newTask(task);
                            //                           ref
                            //                               .read(
                            //                                   todoNotiferProvider
                            //                                       .notifier)
                            //                               .getDays();
                            //                         }
                            //                       },
                            //                       child: Text(
                            //                           style: TextStyle(),
                            //                           'task= ${day.tasks[index].description}'),
                            //                     ),
                            //                   ),
                            //                   IconButton(
                            //                       onPressed: () => showDialog(
                            //                             context: context,
                            //                             builder: (BuildContext
                            //                                     context) =>
                            //                                 AlertDialog(
                            //                                     title: Text(
                            //                                         'Delete'),
                            //                                     actions: <Widget>[
                            //                                   TextButton(
                            //                                     onPressed: () =>
                            //                                         Navigator.pop(
                            //                                             context),
                            //                                     child: const Text(
                            //                                         'Cancel'),
                            //                                   ),
                            //                                   TextButton(
                            //                                     onPressed: () {
                            //                                       ref
                            //                                           .watch(todoNotiferProvider
                            //                                               .notifier)
                            //                                           .deleteTask(
                            //                                               day.tasks[
                            //                                                   index]);
                            //                                       Navigator.pop(
                            //                                           context);
                            //                                     },
                            //                                     child:
                            //                                         const Text(
                            //                                             'OK'),
                            //                                   ),
                            //                                 ]),
                            //                           ),
                            //                       icon: const Icon(Icons
                            //                           .delete_forever_outlined)),
                            //                 ],
                            //               );
                            //             })),
                            //       ),
                            // Divider(),
                            // Expanded(
                            //   child: ListView.builder(
                            //       shrinkWrap: true,
                            //       itemCount: itemCountComplited,
                            //       itemBuilder: ((context, index) {
                            //         bool isChecked =
                            //             day.tasksComplited[index].done;
                            //         return Row(
                            //           children: [
                            //             Checkbox(
                            //                 value: isChecked,
                            //                 onChanged: (value) {
                            //                   ref
                            //                       .watch(todoNotiferProvider
                            //                           .notifier)
                            //                       .changeComplited(day
                            //                           .tasksComplited[index]);
                            //                 }),
                            //             Expanded(
                            //               flex: 2,
                            //               child: InkWell(
                            //                 onTap: () async {
                            //                   var resp = await dialogNewTask(
                            //                       context,
                            //                       day.tasksComplited[index]);
                            //                   if (resp.runtimeType == Task) {
                            //                     Task task = resp;
                            //                     ref
                            //                         .read(todoNotiferProvider
                            //                             .notifier)
                            //                         .newTask(task);
                            //                     ref
                            //                         .read(todoNotiferProvider
                            //                             .notifier)
                            //                         .getDays();
                            //                   }
                            //                 },
                            //                 child: Text(
                            //                     style: TextStyle(),
                            //                     'task= ${day.tasksComplited[index].description}'),
                            //               ),
                            //             ),
                            //             IconButton(
                            //                 onPressed: () => showDialog(
                            //                       context: context,
                            //                       builder: (BuildContext
                            //                               context) =>
                            //                           AlertDialog(
                            //                               title: Text('Delete'),
                            //                               actions: <Widget>[
                            //                             TextButton(
                            //                               onPressed: () =>
                            //                                   Navigator.pop(
                            //                                       context),
                            //                               child: const Text(
                            //                                   'Cancel'),
                            //                             ),
                            //                             TextButton(
                            //                               onPressed: () {
                            //                                 ref
                            //                                     .watch(
                            //                                         todoNotiferProvider
                            //                                             .notifier)
                            //                                     .deleteTask(
                            //                                         day.tasksComplited[
                            //                                             index]);
                            //                                 Navigator.pop(
                            //                                     context);
                            //                               },
                            //                               child:
                            //                                   const Text('OK'),
                            //                             ),
                            //                           ]),
                            //                     ),
                            //                 icon: const Icon(
                            //                     Icons.delete_forever_outlined)),
                            //           ],
                            //         );
                            //       })),
                            // ),
                          ],
                        ),
                      ),
                      Text('${itemCount - 2}'),
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
