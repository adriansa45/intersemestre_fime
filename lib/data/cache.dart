import 'package:hive_flutter/hive_flutter.dart';

class CacheController {
  List<int> subjects = [];

  final _box = Hive.box('subjects');

  void loadSubjects() {
    subjects = _box.get("SUBJECTS");
  }

  void updateSubjects() {
    _box.put("SUBJECTS", subjects);
  }
}
