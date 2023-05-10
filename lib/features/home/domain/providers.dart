import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/features/home/domain/repositories/home_repository.dart';

import '../data/providers.dart';
import '../data/repositories/home_repository_impl.dart';

final repoProvider = Provider<HomeRepository>((ref) =>
    HomeRepositoryImpl(localHomeService: ref.watch(serviceHomeProvider)));
