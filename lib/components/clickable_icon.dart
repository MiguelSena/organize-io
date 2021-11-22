// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class ClickableIcon extends StatelessWidget {
  final IconData _icon;
  final VoidCallback _onClick;
  ClickableIcon(this._icon, this._onClick);
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onClick,
      child: Icon(_icon)
    );
  }
}