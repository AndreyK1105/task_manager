import '../../../../shared/domain/entities/check/check_list.dart';

abstract class CheckListRepository {
  putCheckList(CheckList checkList);
  List<CheckList> getCheckList(int date);
  List<CheckList> getAllCheckList();
  saveCheckList(String id);
  removeCheckList(String id);
}
