// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class DayTasks extends StatelessWidget {
  final Color color;
  DayTasks(this.color);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color
      ),

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text(
              'Tarefas do dia:',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white
              )
            ),
            
            DayTasksElement('08:00', 'Escola'),
            DayTasksElement('12:00', 'Almoço'),
            DayTasksElement('15:00', 'Reunião'),
            DayTasksElement('19:00', 'Academia'),
          ],
        ),
      ),
    );
  }
}

class DayTasksElement extends StatelessWidget {
  final String _time;
  final String _task;

  const DayTasksElement(this._time, this._task);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
        '$_time - $_task',
        style: const TextStyle(
          fontSize: 18,
          color: Colors.white,
        )
      ),
    );
  }
}