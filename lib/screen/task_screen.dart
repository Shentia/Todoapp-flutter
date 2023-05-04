import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/models/task.dart';
import 'package:todoapp/models/task_data.dart';
import 'package:todoapp/widgets/tasks_list.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget addTaskSheet(BuildContext context) {
    String? newTaskTitle;
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: const Color(0xff757575),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Add Task",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 30.0,
                  ),
                ),
                TextField(
                  autofocus: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    newTaskTitle = value;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () {
                    Provider.of<TaskData>(context, listen: false)
                        .addTask(newTaskTitle!);

                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.lightBlueAccent),
                  ),
                  child: const Text(
                    "Add Now",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: addTaskSheet,
              isScrollControlled: true);
        },
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(Icons.add),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: const EdgeInsets.only(
            top: 60.0,
            left: 30.0,
            right: 30.0,
            bottom: 30.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30.0,
                child: Icon(
                  Icons.list,
                  size: 30.0,
                  color: Colors.lightBlueAccent,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                'Todo App',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                '${Provider.of<TaskData>(context).taskCount} Tasks',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: TasksList(),
          ),
        ),
      ]),
    );
  }
}
