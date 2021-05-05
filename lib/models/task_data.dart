import 'package:flutter/foundation.dart';
import 'dart:collection';
import 'task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Buy Milk'),
    Task(name: 'Buy Goods'),
    Task(name: 'Go Read')
  ];
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
    //always add notifyListeners so that will update every Provider.of<..>(context)
    notifyListeners();
  }

//for toggling that task
  void updateTask(Task task) {
    task.toogleDone();
    notifyListeners();
  }

//for deleting the task from the super list
  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
