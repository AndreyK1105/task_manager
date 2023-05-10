// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

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

  TodoState(
    this.days,
    this.state,
  );
  TodoState.initial({
    this.days = const [],
    this.state = TodoConreteState.initial,
  });

  TodoState copyWith({
    List<Day>? days,
    TodoConreteState? state,
  }) {
    return TodoState(
      days ?? this.days,
      state ?? this.state,
    );
  }
}
