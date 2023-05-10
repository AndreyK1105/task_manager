//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../../../../config/providers.dart';
import '../../../../shared/domain/entities/check/check_list.dart';
import '../../../../shared/domain/entities/todo/task.dart';
import '../widgets/check_header.dart';
import '../widgets/check_list.dart';
import '../widgets/note_header.dart';
import '../widgets/note_list.dart';
import '../widgets/todo_days.dart';
import '../widgets/todo_header.dart';
import '../widgets/todo_task_day.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    final bool pinned = true;
    final bool floating = false;
    List<Widget> sliverList1 = [];
    // sliverList1.addAll(sliverList(size));
    //sliverList1.add(Todo());
    return Scaffold(
        appBar: AppBar(
          // elevation: 100,
          // scrolledUnderElevation: 700,
          title: Text('Appbar to do list'),
        ),
        body: Center(
          child: CustomScrollView(
            slivers:
                // sliverList1,
                <Widget>[
              //sliverList(size),
              const TodoHeader(),
              SliverList(
                  delegate: SliverChildListDelegate(<Widget>[
                const TodoDays(),
                const TodoTaskDay(),
              ])),
              const CheckHeader(),
              SliverList(
                  delegate: SliverChildListDelegate(<Widget>[
                const CheckListWidget(),
              ])),
              NoteHeader(),
              SliverList(
                  delegate: SliverChildListDelegate(<Widget>[
                NoteList(),
              ]))
            ],
          ),
        ));
  }
}

class HeaderDelegat extends SliverPersistentHeaderDelegate {
  final double minExtent;
  final double maxExtent;
  final Widget child;

  HeaderDelegat(
      {required this.maxExtent, required this.minExtent, required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
        child:
            Container(color: Color.fromARGB(255, 117, 163, 194), child: child));

    // Row(
    //   children: [
    //     const Text('Todo List'),
    //     const Expanded(
    //       flex: 2,
    //       child: SizedBox(width: 10),
    //     ),
    //     FilledButton(onPressed: () {}, child: Text('Today')),
    //     const Expanded(
    //       flex: 1,
    //       child: SizedBox(width: 10),
    //     ),
    //     OutlinedButton(
    //       onPressed: () {},
    //       style: OutlinedButton.styleFrom(
    //           shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(20))),
    //       child: const Text('New task'),
    //     ),
    //     SizedBox(width: 10),

    //     // FilledButton(onPressed: () {}, child: const Text('Elevated')),
    //   ],
    // );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return maxExtent != oldDelegate.maxExtent ||
        minExtent != oldDelegate.minExtent; //||
    // child != oldDelegate. child;
  }
}
