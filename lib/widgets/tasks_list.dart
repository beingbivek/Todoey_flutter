import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/widgets/task_tile.dart';
import 'package:toast/toast.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Consumer widget is needed to simplify the provider.of<..>(context).data
    return Consumer<TaskData>(
      //builder has context, var = Provider.of<TaskData>(context), a child to return
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: (checkboxState) {
                taskData.updateTask(task);
              },
              longPressCallback: () {
                if (task.isDone) {
                  taskData.deleteTask(task);
                  Toast.show("${task.name} Deleted", context,
                      duration: Toast.LENGTH_SHORT,
                      gravity: Toast.BOTTOM,
                      textColor: Colors.white,
                      backgroundColor: Colors.redAccent);
                }
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
