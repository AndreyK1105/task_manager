// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../../../shared/usecases/usecase.dart';
import '../../repositories/home_repository.dart';

class GetDaysTask extends UseCase {
  HomeRepository homeRepository;
  GetDaysTask({
    required this.homeRepository,
  });
  @override
  Future call(params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
