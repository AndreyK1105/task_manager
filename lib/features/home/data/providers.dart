import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/features/home/data/services/local_home_service.dart';

final serviceHomeProvider =
    Provider<LocalHomeService>((_) => IsarHomeService());
