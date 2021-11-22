// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String time;
  TaskCard({required this.title, required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.12,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: ThemeProvider.themeOf(context).data.colorScheme.secondary,
            borderRadius: BorderRadius.circular(20)
          ),
      
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                  )
                ),
      
                Text(
                  time,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  )
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}