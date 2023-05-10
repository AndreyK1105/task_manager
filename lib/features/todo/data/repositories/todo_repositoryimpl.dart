// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:task_manager/features/todo/domain/repositories/todo_repository.dart';

import '../datasources/local_datasource.dart';

class TodoRepopsitoryImpl implements TodoRepository {
  TodoLocalDatasource todoLocalDatasource;
  TodoRepopsitoryImpl({
    required this.todoLocalDatasource,
  });
  @override
  Future getDays() {
    // TODO: implement getDays
    throw UnimplementedError();
  }
}
