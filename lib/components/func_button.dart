// ignore_for_file: use_key_in_widget_constructors, prefer_equal_for_default_values, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class FuncButton extends StatelessWidget {
  final String _text;
  final VoidCallback _onClick;
  final Color _color;

  FuncButton(this._text, this._color, this._onClick);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.08,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: _color,
          borderRadius: BorderRadius.circular(10)
        ),
        
        child: InkWell(
          child: Center(
            child: Text(
              _text,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white
              ),
            )
          ),

          onTap: _onClick,
          borderRadius: BorderRadius.circular(0),
        )
      ),
    );
  }
}