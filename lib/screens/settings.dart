// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unused_field, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:theme_provider/theme_provider.dart';

class Settings extends StatefulWidget {
  Color color1 = Colors.deepPurpleAccent;
  Color color2 = Colors.cyan;

  Settings(this.color1, this.color2);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
        title: Text('Configurações'),

        gradient: LinearGradient(
          colors: [widget.color1, widget.color2]
        )
      ),

      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            ColorContainer('main', Colors.deepPurpleAccent, Colors.cyan, () => setState(() {
              widget.color1 = Colors.deepPurpleAccent;
              widget.color2 = Colors.cyan;
            })),

            ColorContainer('orange', Colors.deepOrange.shade300, Colors.deepOrange.shade200, () => setState(() {
              widget.color1 = Colors.deepOrange.shade300;
              widget.color2 = Colors.deepOrange.shade200;
            })),

            ColorContainer('pink', Colors.pink.shade300, Colors.pink.shade200, () => setState(() {
              widget.color1 = Colors.pink.shade300;
              widget.color2 = Colors.pink.shade200;
            })),

            ColorContainer('teal', Colors.teal.shade600, Colors.teal.shade300, () => setState(() {
              widget.color1 = Colors.teal.shade600;
              widget.color2 = Colors.teal.shade300;
            })),

            ColorContainer('purple', Colors.deepPurple.shade300, Colors.deepPurple.shade200, () => setState(() {
              widget.color1 = Colors.deepPurple.shade300;
              widget.color2 = Colors.deepPurple.shade200;
            })),
          ],
        ),
      )
    );
  }
}

class ColorContainer extends StatelessWidget {
  final Color color1;
  final Color color2;
  final VoidCallback action;
  final String id;
  ColorContainer(this.id, this.color1, this.color2, this.action);
  
  @override 
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: InkWell(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.08,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [color1, color2]),
            borderRadius: BorderRadius.circular(10)
          )
        ),

        onTap: () {
          ThemeProvider.controllerOf(context).setTheme(id);
          Navigator.pop(context, [color1, color2]);
        }
      )
    );
  }
}