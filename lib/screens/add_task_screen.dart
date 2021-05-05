import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTask;
    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: ListView(
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlueAccent,
              ),
            ),
            TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(),
              autofocus: true,
              onChanged: (value) {
                newTask = value;
              },
            ),
            MaterialButton(
              onPressed: () {
                //to call a function in a changenotifier class the new update needs to add listen to false
                Provider.of<TaskData>(context, listen: false).addTask(newTask);
                Navigator.pop(context);
              },
              child: Hero(
                tag: 'bubble',
                child: Text(
                  'Add',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              color: Colors.lightBlueAccent,
            )
          ],
        ),
      ),
    );
  }
}
