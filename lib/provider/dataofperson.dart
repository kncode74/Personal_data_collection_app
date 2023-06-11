import 'package:flutter/foundation.dart';
import 'package:store/models/person.dart';

class DataOfPerson with ChangeNotifier {
  List<DataPeople> inform = [];

  List<DataPeople> getDatapeople() {
    return inform;
  }

  void addDataPeople(DataPeople statement) {
    inform.add(statement);
    //แจ้งเตือน consumer
    notifyListeners();
  }
}
