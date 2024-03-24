import 'package:hive_flutter/hive_flutter.dart';
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

  static cacheTask(key, TaskModel value) {
    taskBox.put(key, value);
  }

  static TaskModel? getTask(key) {
    return taskBox.get(key);
  }
}

class AppLocal {
  static String Image_Key = "Image_Key";
  static String Name_Key = "Name_Key";
  static String Is_Upload = "Is_Upload";

  static cacheData(String key, dynamic value) async {
    var box = Hive.box('user');
    await box.put(key, value);
  }

  static Future<dynamic> getData(String key) async {
    var box = Hive.box('user');
    return await box.get(key);
  }

  static deleteData(String key) async {
    var box = Hive.box('user');
    return await box.delete(key);
  }
}
