import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

Future<List> fetchTask(int idUser) async {
  final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos?userId=$idUser'));

  if (response.statusCode == 200) {
    Iterable list = json.decode(response.body);
    var tasksList = list.map((model) => Task.fromJson(model)).toList();

    return tasksList;
  } else {
    throw Exception('Failed to load Task');
  }
}

class Task {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Task({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }
}

class TaskApp extends StatefulWidget {
  final int userId;
  const TaskApp({Key? key, required this.userId}) : super(key: key);

  @override
  _TaskAppState createState() => _TaskAppState();
}

class _TaskAppState extends State<TaskApp> {
  late Future<List> futureTask;

  @override
  void initState() {
    super.initState();
    futureTask = fetchTask(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: futureTask,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                padding: const EdgeInsets.all(1.0),
                decoration: BoxDecoration(
                  color: const Color(0xffdddddd),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 5),
                    ToDoTaskList(task: snapshot.data![index]),
                  ],
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Center(
              child: CircularProgressIndicator(),
            ),
          ],
        );
      },
    );
  }
}

class ToDoTaskList extends StatefulWidget {
  const ToDoTaskList({Key? key, required this.task,}) : super(key: key);

  final Task task;

  @override
  State<ToDoTaskList> createState() => _ToDoTaskListState();
}

class _ToDoTaskListState extends State<ToDoTaskList> {
  bool _checked = false;

  @override
  void initState() {
    _checked = widget.task.completed;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(" ${widget.task.title}",
          style: const TextStyle(fontWeight: FontWeight.bold)),
      trailing: Checkbox(
          value: _checked,
          onChanged: (val) {
            setState(() {
              _checked = !_checked;
            });
          }),
    );
  }
}