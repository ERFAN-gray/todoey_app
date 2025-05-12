import 'package:flutter/material.dart';
import 'package:todoey_app/Widgets/tasks_list.dart';
import 'add_task_screen.dart';
import 'package:todoey_app/models/task.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task> tasks = [
    Task(name: "buy milk"),
    Task(name: "buy bread"),
    Task(name: "somthing"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton.extended(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder:
                (context) => AddTaskScreen(
                  addTaskCallback: (newTaskTitle) {
                    setState(() {
                      tasks.add(Task(name: newTaskTitle));
                    });
                    Navigator.pop(context);
                  },
                ),
          );
        },
        backgroundColor: Colors.lightBlueAccent,
        icon: Icon(Icons.add, size: 41, color: Colors.white),
        label: Text(
          "Add Task",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 35,
                  child: Icon(
                    Icons.list,
                    size: 48,
                    color: Colors.lightBlueAccent,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Todoey",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 55,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "${tasks.length} Tasks",
                  style: TextStyle(color: Colors.white, fontSize: 23),
                ),
              ],
            ),
          ),

          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: TasksList(tasks: tasks),
            ),
          ),
        ],
      ),
    );
  }
}
