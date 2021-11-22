// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable, prefer_const_literals_to_create_immutables, override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:organize_io/components/clickable_icon.dart';
import 'package:organize_io/components/task_card.dart';
import 'package:organize_io/screens/task_form.dart';
import 'package:theme_provider/theme_provider.dart';

class TaskList extends StatefulWidget {
  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  final snackBar = SnackBar(content: Text('As tarefas foram apagadas'));
  List tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
        title: Text('Lista de tarefas'),
        gradient: LinearGradient(
          colors: [ThemeProvider.themeOf(context).data.colorScheme.primary, ThemeProvider.themeOf(context).data.colorScheme.secondary]
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClickableIcon(
              Icons.remove_circle_outline,
              () {
                tasks = [];
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                setState(() {});
              }
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: ThemeProvider.themeOf(context).data.colorScheme.primary,
        child: Icon(Icons.add),
        onPressed: () {
          final Future future = Navigator.of(context).push(MaterialPageRoute(builder: (context) => TaskForm()));
          future.then((newTask) {
            tasks.add(newTask);
            setState(() {});
          });
        }
      ),

      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return InkWell(
            child: TaskCard(
              title: tasks[index].title,
              time: tasks[index].time,
            ),

            onLongPress: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Deseja marcar esta tarefa como pronta?'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Não'),
                      child: Text('Não'),
                    ),

                    TextButton(
                      onPressed: () {
                        tasks.remove(tasks[index].title);
                        setState(() {});
                        Navigator.pop(context, 'Sim');
                      },

                      child: Text('Sim'),
                    ),
                  ],
                );
              }
            ),
          );
        },
      )
    );
  }
}
