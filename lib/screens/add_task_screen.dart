import 'dart:ui';

import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  final Function addTaskCallback;
  AddTaskScreen(this.addTaskCallback);
  @override
  Widget build(BuildContext context) {
    String newTask;
    return SingleChildScrollView(
      child: Container(
        color: Color(0xFF757575),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  addTaskCallback(newTask);
                  // Navigator.pop(context, newTask);
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
      ),
    );
  }
}
