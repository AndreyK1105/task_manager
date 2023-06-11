import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/domain/entities/todo/task.dart';
import '../providers/state/todo_state.dart';
import '../providers/todo_state_provider.dart';

class TodoDays extends ConsumerWidget {
  TodoDays({Key? key}) : super(key: key);
  // late ScrollController controller;

  ///ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var controller = ref.watch(todoDaysScrollController);
    final Size size = MediaQuery.of(context).size;

    //TodoState state = ref.watch(todoNotiferProvider);
    final width = 50.0;
    //MediaQuery.of(context).size.width;
    final days = ref.watch(todoNotiferProvider).days;
    int curentIndex = ref.watch(todoNotiferProvider).curentIndex;
    //final days = state.days;
    final itemCount = days.isEmpty ? 1 : days.length;
    return SizedBox(
      height: 22,
      child: ListView.builder(
          controller: controller,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: itemCount,
          itemBuilder: ((context, index) {
            //  print('scrollController.hashCode====${controller.hashCode}');
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {
                    ref
                        .watch(todoNotiferProvider.notifier)
                        .setIndex(ref, index);
                    // ref.watch(todoNotiferProvider.notifier).setTodayIndex(ref);

                    // final contentSize = controller.position.viewportDimension +
                    //     controller.position.maxScrollExtent;
                    // final target = contentSize * 3 / itemCount;
                    // print('widht==$width');
                    // controller.position.animateTo(target,
                    //     duration: const Duration(milliseconds: 1500),
                    //     curve: Curves.linear);
                  },
                  style: OutlinedButton.styleFrom(
                      backgroundColor: index == curentIndex
                          ? Colors.amberAccent
                          : Color.fromARGB(255, 155, 187, 243),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  child: Text(
                    days.isEmpty
                        ? 'Today'
                        : '${(DateTime.fromMillisecondsSinceEpoch(days[index].data)).toString().substring(0, 10)} task${days[index].tasks.length + days[index].tasksComplited.length}',
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                      width: 30,
                      child: Divider(
                        thickness: 3,
                      )),
                ),
                // Container(
                //   width: 30,
                //   color: Colors.amber,
                // )
              ],
            );
          })),
    );
  }
}
