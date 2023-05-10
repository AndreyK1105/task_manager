import 'package:isar/isar.dart';
part 'check_list.g.dart';

@collection
class CheckList {
  Id id = Isar.autoIncrement;
  String title;
  List<String> checkName;
  List<bool> check;
  int date;
  int color;
  List<String> image = [];
  String note = '';
  CheckList({
    required this.id,
    required this.title,
    required this.checkName,
    required this.check,
    required this.date,
    required this.color,
  });
}
