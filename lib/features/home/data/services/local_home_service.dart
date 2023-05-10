abstract class LocalHomeService {
  Future getDays();
  Future getTask();
}

class IsarHomeService extends LocalHomeService {
  @override
  Future getDays() {
    // TODO: implement getDays
    throw UnimplementedError();
  }

  @override
  Future getTask() {
    // TODO: implement getTask
    throw UnimplementedError();
  }
}
