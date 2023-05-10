// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:isar/isar.dart';

part 'task.g.dart';

@collection
class Task {
  Id id = Isar.autoIncrement;
  String description;
  int date;
  int timeStart;
  int timeEnd;
  int reminder;
  int color;
  bool done = false;
  Task({
    //required this.id,
    required this.description,
    required this.date,
    required this.timeStart,
    required this.timeEnd,
    required this.reminder,
    required this.color,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'description': description,
      'date': date,
      'timeStart': timeStart,
      'timeEnd': timeEnd,
      'reminder': reminder,
      'color': color,
      'done': done,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      //id: map['id'] as Map<String, dynamic>,
      description: map['description'] as String,
      date: map['date'] as int,
      timeStart: map['timeStart'] as int,
      timeEnd: map['timeEnd'] as int,
      reminder: map['reminder'] as int,
      color: map['color'] as int,
      //done: map['done'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) =>
      Task.fromMap(json.decode(source) as Map<String, dynamic>);
}
