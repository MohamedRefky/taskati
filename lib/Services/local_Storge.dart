import 'package:hive/hive.dart';
import 'package:taskati/data/task_model.dart';
class AppLocalStorage {
  static late Box box;
  static late Box<TaskModel> taskBox;
  init() {
    box = Hive.box('user');
    taskBox = Hive.box('task');
  }

  static cacheData(key, value) {
    box.put(key, value);
  }

  static getCachedData(key) {
    return box.get(key);
  }

  static void cacheTask(dynamic key, TaskModel value) {
    taskBox.put(key, value);
  }

  static TaskModel? getTask(dynamic key) {
    return taskBox.get(key);
  }
}