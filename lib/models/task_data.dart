import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:collection';
import 'task.dart';

class TaskData extends ChangeNotifier {
  SharedPreferences sharedPreferences;
  List<Task> _tasks = [];
  TaskData() {
    initSP();
  }

  initSP() async {
    sharedPreferences = await SharedPreferences.getInstance();
    loadData();
  }

  void saveData() {
    List<String> spList =
        _tasks.map((item) => jsonEncode(item.toMap())).toList();
    sharedPreferences.setStringList('list', spList);
  }

  void loadData() {
    List<String> spList = sharedPreferences.getStringList('list');
    if (spList != null) {
      _tasks = spList.map((item) => Task.fromMap(jsonDecode(item))).toList();
    }
    notifyListeners();
  }

//getter to return task length
  int get taskCount {
    return _tasks.length;
  }

// unmodifiable list view allows to push the list not tobe modified or added using a getter
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

// you can only update or change tasks using a method or funtion
  void addTask(String newTaskTitle) {
    _tasks.add(Task(name: newTaskTitle));
    saveData();
    //always add notifyListeners so that will update every Provider.of<..>(context)
    notifyListeners();
  }

//for toggling that task
  void updateTask(Task task) {
    task.toogleDone();
    saveData();
    notifyListeners();
  }

//for deleting the task from the super list
  void deleteTask(Task task) {
    _tasks.remove(task);
    saveData();
    notifyListeners();
  }
}
