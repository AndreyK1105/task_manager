// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/domain/entities/todo/day.dart';
import '../../../../../shared/domain/entities/todo/task.dart';

enum TodoConreteState {
  initial,
  loading,
  loaded,
}

class TodoState {
  final List<Day> days;
  final TodoConreteState state;
  final int curentIndex;
  //final ScrollController scrollController;
  TodoState(
    this.days,
    this.state,
    this.curentIndex,
    //this.scrollController,
  );
  const TodoState.initial({
    this.days = const [],
    this.state = TodoConreteState.initial,
    this.curentIndex = 0,
    // this.scrollController =  ScrollController(),
  });
  TodoState copyWith({
    List<Day>? days,
    TodoConreteState? state,
    int? curentIndex,
    //  ScrollController? scrollController,
  }) {
    // print('todo state copyWith');
    return TodoState(
      days ?? this.days,
      state ?? this.state,
      curentIndex ?? this.curentIndex,
//      scrollController ?? this.scrollController,
    );
  }
}
