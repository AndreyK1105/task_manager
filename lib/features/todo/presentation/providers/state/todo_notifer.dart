import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/features/home/presentation/bloc/todo_cubit/todo_state_cubit.dart';
import 'package:task_manager/features/todo/presentation/providers/state/todo_state.dart';
import 'package:task_manager/shared/domain/entities/todo/task.dart';
//import 'dart:math';

import '../../../../../shared/domain/entities/todo/day.dart';
import '../../../domain/repositories/todo_repository.dart';
import '../todo_state_provider.dart';

class TodoNotifer extends StateNotifier<TodoState> {
  TodoRepository todoRepository;
  TodoNotifer({
    required this.todoRepository,
  }) : super(const TodoState.initial());

  void setIndex(WidgetRef ref, int index) {
    state = state.copyWith(curentIndex: index);
  }

  void setTodayIndex(WidgetRef ref) {
    int todayScrollIndex = 0;
    int todayIndex = -1;
    DateTime now = DateTime.now();
    int todayData =
        DateTime(now.year, now.month, now.day).millisecondsSinceEpoch;
    List<Day> days = state.days;

    for (int i = 0; i < days.length - 1; i++) {}

    int start = 0;
    int end = days.length - 1;

    while (start <= end) {
      int middle = ((start + end) / 2).round();

      if (days[middle].data == todayData) {
        // found the key
        todayIndex = middle;
        break;
      } else if (days[middle].data < todayData) {
        // continue searching to the right
        start = middle + 1;
      } else {
        // search searching to the left
        end = middle - 1;
      }
    }
    if (todayIndex == -1) {
      days.insert(start, Day(tasks: [], data: todayData));
      state = state.copyWith(days: days, curentIndex: start);
      todayScrollIndex = start;
    } else {
      state = state.copyWith(curentIndex: todayIndex);
      todayScrollIndex = todayIndex;
    }

    // ScrollController controller = state.scrollController;
    // controller.
    // if (state.scrollController.hasClients) {
    //   final contentSize = state.scrollController.position.viewportDimension +
    //       state.scrollController.position.maxScrollExtent;
    //   final target = contentSize * 3 / state.days.length;
    //   // print('widht==$width');
    //   //controller
    //  ref.read(todoDaysScrollController) .position.animateTo(500,
    //       duration: const Duration(milliseconds: 1500), curve: Curves.linear);
    // }
    final contentSize =
        ref.read(todoDaysScrollController).position.viewportDimension +
            ref.read(todoDaysScrollController).position.maxScrollExtent;
    final target = contentSize * todayScrollIndex / state.days.length;
    // print('widht==$width');
    //controller
    ref.read(todoDaysScrollController).animateTo(target,
        duration: const Duration(milliseconds: 1500), curve: Curves.linear);
  }

  Future<void> getDays() async {
    state = state.copyWith(state: TodoConreteState.loading);
    List<Day> days = await todoRepository.getDays();
    state = state.copyWith(days: days, state: TodoConreteState.loaded);
  }

  Future<void> newTask(Task task) async {
    // print('TodoNotifer');
    await todoRepository.newTask(task);

    getDays();
  }

  Future<void> deleteTask(Task task) async {
    // print('TodoNotifer');
    await todoRepository.deleteTask(task);

    getDays();
  }
}
