import 'package:shared_preferences/shared_preferences.dart';

class CacheController {
  static const String _keySubjects = 'subjects';

  List<int> subjects = [];

  Future<void> loadSubjects() async {
    subjects = await getSubjects();
  }

  void updateSubjects() {
    postSubjects(subjects);
  }

  Future<List<int>> getSubjects() async {
    final prefs = await SharedPreferences.getInstance();
    final subjectsStringList = prefs.getStringList(_keySubjects);
    if (subjectsStringList != null) {
      return subjectsStringList.map((item) => int.parse(item)).toList();
    } else {
      return [];
    }
  }

  Future<void> postSubjects(List<int> subjectsLocal) async {
    print(subjectsLocal);
    final prefs = await SharedPreferences.getInstance();
    final subjectsStringList =
        subjectsLocal.map((item) => item.toString()).toList();
    await prefs.setStringList(_keySubjects, subjectsStringList);
  }
}
