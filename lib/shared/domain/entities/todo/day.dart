// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:task_manager/shared/domain/entities/todo/task.dart';

class Day {
  List<Task> tasks;
  int data;
  Day({
    required this.tasks,
    required this.data,
  });

  Day copyWith({
    List<Task>? tasks,
    int? data,
  }) {
    return Day(
      tasks: tasks ?? this.tasks,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tasks': tasks.map((x) => x.toMap()).toList(),
      'data': data,
    };
  }

  factory Day.fromMap(Map<String, dynamic> map) {
    return Day(
      tasks: List<Task>.from(
        (map['tasks'] as List<int>).map<Task>(
          (x) => Task.fromMap(x as Map<String, dynamic>),
        ),
      ),
      data: map['data'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Day.fromJson(String source) =>
      Day.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Day(tasks: $tasks, data: $data)';

  @override
  bool operator ==(covariant Day other) {
    if (identical(this, other)) return true;

    return listEquals(other.tasks, tasks) && other.data == data;
  }

  @override
  int get hashCode => tasks.hashCode ^ data.hashCode;
}
