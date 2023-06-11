import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/shared/domain/entities/todo/task.dart';

dialogNewTask(BuildContext context, Task task) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        DateTime dateNow = DateTime.fromMillisecondsSinceEpoch(task.date);
        TimeOfDay timeStart = TimeOfDay(
            hour: DateTime.fromMillisecondsSinceEpoch(task.timeStart).hour,
            minute: DateTime.fromMillisecondsSinceEpoch(task.timeStart).minute);
        TimeOfDay timeEnd = TimeOfDay(
            hour: DateTime.fromMillisecondsSinceEpoch(task.timeEnd).hour,
            minute: DateTime.fromMillisecondsSinceEpoch(task.timeEnd).minute);
        String description = '';

        TextEditingController textEditingController =
            TextEditingController(text: task.description);
        // Task task =Task(date: DateTime(dateNow.year, dateNow.month, dateNow.day)
        //                 .millisecondsSinceEpoch, color: 0, timeStart: DateTime(dateNow.year, dateNow.month,
        //                     dateNow.day, timeStart.hour, timeStart.minute)
        //                 .millisecondsSinceEpoch, //  timeStart.hour,
        //             timeEnd: timeEnd.hour,description: '', reminder: 0,);
        return AlertDialog(
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  // Task task = Task(
                  //   color: 1,
                  //   description: description,
                  //   date: DateTime(dateNow.year, dateNow.month, dateNow.day)
                  //       .millisecondsSinceEpoch,
                  //   timeStart: DateTime(dateNow.year, dateNow.month,
                  //           dateNow.day, timeStart.hour, timeStart.minute)
                  //       .millisecondsSinceEpoch, //  timeStart.hour,
                  //   timeEnd: timeEnd.hour,
                  //   reminder: 1,
                  // );

                  Navigator.pop(context, task);
                },
                child: const Text('OK'),
              ),
            ],
            content: StatefulBuilder(builder: (context, setState) {
              return Column(
                children: [
                  //Text('data ${dateNow.toString().substring(0, 10)}'),
                  OutlinedButton(
                      onPressed: () async {
                        DateTime? dateTime = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2021),
                          lastDate: DateTime(2024),
                        );

                        if (dateTime != null) {
                          setState(() =>
                              task.date = dateTime.millisecondsSinceEpoch);
                        }
                      },
                      child:
                          Text('data ${dateNow.toString().substring(0, 10)}')),
                  Row(
                    children: [
                      InkWell(
                          onTap: () async {
                            TimeOfDay? timePicker = await showTimePicker(
                              initialTime: timeStart,
                              context: context,
                            );
                            if (timePicker != null) {
                              DateTime dateTime =
                                  DateTime.fromMillisecondsSinceEpoch(
                                      task.date);
                              setState(() {
                                timeStart = timePicker;
                                task.timeStart = DateTime(
                                        dateTime.year,
                                        dateTime.month,
                                        dateTime.day,
                                        timeStart.hour,
                                        timeStart.minute)
                                    .millisecondsSinceEpoch;
                                //  timeStart.hour, timePicker;
                                timeEnd = TimeOfDay(
                                    hour: timeStart.hour == 23
                                        ? 0
                                        : timeStart.hour + 1,
                                    minute: timeStart.minute);
                                task.timeEnd = DateTime(
                                        dateTime.year,
                                        dateTime.month,
                                        dateTime.day,
                                        timeEnd.hour,
                                        timeEnd.minute)
                                    .millisecondsSinceEpoch;
                              });
                            }
                          },
                          child: Text(
                              'Start-${timeStart.toString().substring(10, 15)}')),
                      const Expanded(
                        child: SizedBox(
                          width: 10,
                        ),
                      ),
                      InkWell(
                          onTap: () async {
                            TimeOfDay? time = await showTimePicker(
                              initialTime: timeEnd,
                              context: context,
                            );
                            if (time != null) {
                              setState(() {
                                DateTime dateTime =
                                    DateTime.fromMillisecondsSinceEpoch(
                                        task.date);
                                if (time.hour < timeStart.hour) {
                                  if (timeStart.minute < 59) {
                                    timeEnd = TimeOfDay(
                                        hour: timeStart.hour,
                                        minute: timeStart.minute + 1);
                                  } else {
                                    timeEnd = TimeOfDay(
                                        hour: timeStart.hour == 23
                                            ? 0
                                            : timeStart.hour + 1,
                                        minute: 0);
                                  }
                                } else {
                                  timeEnd = time;
                                }
                                task.timeEnd = DateTime(
                                        dateTime.year,
                                        dateTime.month,
                                        dateTime.day,
                                        timeEnd.hour,
                                        timeEnd.minute)
                                    .millisecondsSinceEpoch;
                                // timeEnd = TimeOfDay(
                                //     hour: timeEnd.hour == 23 ? 0 : timeEnd.hour + 1,
                                //     minute: timeEnd.minute);
                              });
                            }
                          },
                          child: Text(
                              'End-${timeEnd.toString().substring(10, 15)}'))
                    ],
                  ),
                  TextField(
                    minLines: 1,
                    maxLines: 3,
                    controller: textEditingController,
                    onChanged: (value) => task.description = value,
                  ),
                ],
              );
            }));
      });
}
/*


*/