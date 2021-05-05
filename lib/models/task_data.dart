import 'package:flutter/foundation.dart';
import 'task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: 'Buy Milk'),
    Task(name: 'Buy Goods'),
    Task(name: 'Go Read')
  ];

  int get taskCount {
    return tasks.length;
  }
}
