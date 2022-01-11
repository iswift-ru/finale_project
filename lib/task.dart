import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:finale_project/themes/global_theme.dart';

import 'package:finale_project/user_app.dart';

Future<List> fetchTask(int idUser) async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/todos?userId=$idUser'));

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
  bool _checked = false;

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
                     bool _checked = snapshot.data![index].completed;
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      padding: EdgeInsets.all(1.0),
                      decoration: BoxDecoration(
                        color: Color(0xffdddddd),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 5),
                          ListTile(
                            title: Text(" ${ snapshot.data![index].title}", style: const TextStyle(fontWeight: FontWeight.bold)),
                              trailing: Checkbox(
                              value: _checked,
                              onChanged: (val) {
                                setState(() {
                                  _checked = val!;
                                  // Хотел сделать чтоб менялось состояние галочки
                                });
                              }
                              ),
                          ),
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