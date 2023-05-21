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
  final int todayIndex;
  TodoState(
    this.days,
    this.state,
    this.todayIndex,
  );
  TodoState.initial({
    this.days = const [],
    this.state = TodoConreteState.initial,
    this.todayIndex = 0,
  });

  TodoState copyWith({
    List<Day>? days,
    TodoConreteState? state,
    int? todayIndex,
  }) {
    return TodoState(
        days ?? this.days, state ?? this.state, todayIndex ?? this.todayIndex);
  }
}
