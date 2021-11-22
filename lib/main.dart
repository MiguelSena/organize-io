// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:organize_io/screens/home.dart';
import 'package:theme_provider/theme_provider.dart';

void main() {
  runApp(ThemeProvider(
    saveThemesOnChange: true,
    loadThemeOnInit: true,

    themes: [
      AppTheme(
        id: 'main',
        description: 'purple and cyan theme',
        data: ThemeData().copyWith(
          colorScheme: ThemeData().colorScheme.copyWith(
            primary: Colors.deepPurpleAccent,
            secondary: Colors.cyan
          )
        )
      ),

      AppTheme(
        id: 'orange',
        description: 'orange theme',
        data: ThemeData().copyWith(
          colorScheme: ThemeData().colorScheme.copyWith(
            primary: Colors.deepOrange.shade300,
            secondary: Colors.deepOrange.shade200
          )
        )
      ),

      AppTheme(
        id: 'pink',
        description: 'pink theme',
        data: ThemeData().copyWith(
          colorScheme: ThemeData().colorScheme.copyWith(
            primary: Colors.pink.shade300,
            secondary: Colors.pink.shade200
          )
        )
      ),

      AppTheme(
        id: 'teal',
        description: 'teal theme',
        data: ThemeData().copyWith(
          colorScheme: ThemeData().colorScheme.copyWith(
            primary: Colors.teal.shade600,
            secondary: Colors.teal.shade300
          )
        )
      ),

      AppTheme(
        id: 'purple',
        description: 'purple theme',
        data: ThemeData().copyWith(
          colorScheme: ThemeData().colorScheme.copyWith(
            primary: Colors.deepPurple.shade300,
            secondary: Colors.deepPurple.shade200
          )
        )
      ),
    ],

    child: ThemeConsumer(
      child: Builder(
        builder: (context) => MaterialApp(
          theme: ThemeProvider.themeOf(context).data,
          debugShowCheckedModeBanner: false,
          home: OrganizeIO()
        ),
      )
    )
  ));
}

class OrganizeIO extends StatelessWidget {
  const OrganizeIO({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Home();
  }
}