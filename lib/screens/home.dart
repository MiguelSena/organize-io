// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_final_fields, must_be_immutable, void_checks

import 'package:flutter/material.dart';
import 'package:organize_io/components/clickable_icon.dart';
import 'package:organize_io/components/day_tasks.dart';
import 'package:organize_io/components/func_button.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:organize_io/screens/settings.dart';
import 'package:organize_io/screens/tasks_list.dart';
import 'package:theme_provider/theme_provider.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Color color1 = ThemeProvider.themeOf(context).data.colorScheme.primary;
    Color color2 = ThemeProvider.themeOf(context).data.colorScheme.secondary;

    return Scaffold(
      appBar: NewGradientAppBar(
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ClickableIcon(Icons.settings_outlined, () {
                final Future future = Navigator.of(context).push(MaterialPageRoute(builder: (context) => Settings(color1, color2)));
                future.then((newColors) {
                  color1 = newColors[0];
                  color2 = newColors[1];
                  setState(() {});
                });
              }),
              Text('Organize.io'),
              ClickableIcon(Icons.info_outline, () {}),
            ],
          )
        ),
        
        gradient: LinearGradient(
          colors: [color1, color2]
        )
      ),

      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            DayTasks(checkColor(color1)),
            Column(
              children: <Widget>[
                FuncButton('Lista de tarefas', checkColor(color1), () {
                  final Future future = Navigator.of(context).push(MaterialPageRoute(builder: (context) => TaskList()));
                }),

                FuncButton('Lista de compras', checkColor(color1), () {}),
                FuncButton('Eventos regulares', checkColor(color1), (){}),
              ],
            )
          ]
        ),
      )
    );
  }
}

Color checkColor(Color color) {
  if (color != Colors.cyan) {
    return color;
  } else {
    return Colors.deepPurpleAccent;
  }
}