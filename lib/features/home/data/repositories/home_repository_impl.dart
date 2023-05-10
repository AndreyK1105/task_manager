// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:task_manager/features/home/data/services/local_home_service.dart';
import 'package:task_manager/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  LocalHomeService localHomeService;
  HomeRepositoryImpl({
    required this.localHomeService,
  });
  @override
  getDays() {
    localHomeService.getDays();
  }
}
//final HomeRepositoryImpl homeRepositoryImpl=HomeRepositoryImpl(localHomeService: localHomeService)
