import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_app/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text(
              "New Task",
              style: TextStyle(color: Colors.lightBlueAccent, fontSize: 30),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            autofocus: true,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.lightBlueAccent,
                  width: 1.7,
                ),
              ),
              label: Text(
                "Task Field",
                style: TextStyle(color: Colors.lightBlue),
              ),
              hintText: "Enter your task here",
              hintStyle: TextStyle(color: Colors.black38),
            ),
            onChanged: (newText) {
              newTaskTitle = newText;
            },
          ),
          SizedBox(height: 20),
          TextButton(
            onPressed: () {
              Provider.of<TaskData>(
                context,
                listen: false,
              ).addTask(newTaskTitle!);
              Navigator.pop(context);
            },
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.lightBlueAccent),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            child: Text(
              "Add Task",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
