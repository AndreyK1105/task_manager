import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../../../../config/providers.dart';
import '../../../../shared/domain/entities/todo/task.dart';
import '../../../home/presentation/screens/home_screen.dart';

class TodoHeader extends ConsumerWidget {
  const TodoHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverPersistentHeader(
        pinned: true,
        floating: false,
        delegate: HeaderDelegat(
          maxExtent: 50,
          minExtent: 30,
          child: Row(
            children: [
              const Text('Todo List'),
              const Expanded(
                flex: 2,
                child: SizedBox(width: 10),
              ),
              FilledButton(onPressed: () {}, child: Text('Today')),
              const Expanded(
                flex: 1,
                child: SizedBox(width: 10),
              ),
              OutlinedButton(
                onPressed: () async {
                  final Task task = Task(
                      description: 'description',
                      date: DateTime.now().millisecondsSinceEpoch,
                      timeStart: 0,
                      timeEnd: 0,
                      reminder: 0,
                      color: 2);
                  print('task.Id====${task.id}');
                  Isar isar = await ref.read(isarProvider.future);
                  await isar.writeTxn(() async {
                    await isar.tasks.put(task);
                  });
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
