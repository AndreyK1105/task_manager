import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/features/todo/presentation/providers/state/todo_notifer.dart';
import 'package:task_manager/features/todo/presentation/providers/state/todo_state.dart';

import '../../domain/providers/todo_providers.dart';

// final todoNotifer=FutureProvider<TodoNotifer>((ref) async{
//  final repository=ref.watch(todoRepositoryProvider.future);
//   return   TodoNotifer(todoRepository:await  repository);
// });

final todoNotiferProvider =StateNotifierProvider<TodoNotifer, TodoState> ((ref)  {

  final repository=ref.watch(todoRepositoryProvider.future);


  return TodoNotifer(todoRepository:  repository); ..getDays();
} ,);