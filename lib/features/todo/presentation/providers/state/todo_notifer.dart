import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/features/home/presentation/bloc/todo_cubit/todo_state_cubit.dart';
import 'package:task_manager/features/todo/presentation/providers/state/todo_state.dart';
import 'package:task_manager/shared/domain/entities/todo/task.dart';

import '../../../../../shared/domain/entities/todo/day.dart';
import '../../../domain/repositories/todo_repository.dart';

class TodoNotifer extends StateNotifier<TodoState> {
  TodoRepository todoRepository;
  TodoNotifer({
    required this.todoRepository,
  }) : super(TodoState.initial());

  void setTodayIndex() {
    DateTime now = DateTime.now();
    int todayData =
        DateTime(now.year, now.month, now.day).millisecondsSinceEpoch;
  }

  Future<void> getDays() async {
    state = state.copyWith(state: TodoConreteState.loading);
    List<Day> days = await todoRepository.getDays();
    state = state.copyWith(days: days, state: TodoConreteState.loaded);
  }

  Future<void> newTask(Task task) async {
    print('TodoNotifer');
    await todoRepository.newTask(task);

    getDays();
  }
}
