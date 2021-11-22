// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, prefer_void_to_null, unused_element, unused_field, override_on_non_overriding_member, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:organize_io/models/task.dart';
import 'package:theme_provider/theme_provider.dart';

class TaskForm extends StatefulWidget {
  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _hoursController = TextEditingController();

  TimeOfDay selectedTime = TimeOfDay.now();

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.input,
      helpText: 'Escolha o horário',
      hourLabelText: 'Horas',
      minuteLabelText: 'Minutos',
      confirmText: 'Confirmar',
      cancelText: 'Cancelar',
      errorInvalidText: 'Insira valores válidos'
    );

    if(picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  TextStyle style(BuildContext context) {
    return TextStyle(
      fontSize: 24,
      color: ThemeProvider.themeOf(context).data.colorScheme.primary
    );
  }
  
  @override
  String _time() {
    if (selectedTime == TimeOfDay.now()) {
      return 'Selecione o horário';
    } else {
      return selectedTime.format(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
        title: Text('Adcicionar tarefa'),
        gradient: LinearGradient(
          colors: [ThemeProvider.themeOf(context).data.colorScheme.primary, ThemeProvider.themeOf(context).data.colorScheme.secondary]
        )
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            FormInput(
              textController: _nameController,
              label: 'Nome',
              tip: 'Academia'
            ),

            InkWell(
              onTap: () => _selectTime(context),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width * 0.82,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: ThemeProvider.themeOf(context).data.colorScheme.primary
                  )
                ),

                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(_time(), style: style(context))
                  ),
                )
              )
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: InkWell(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ThemeProvider.themeOf(context).data.colorScheme.primary
                  ),

                  child: Center(
                    child: Text(
                      'Confirmar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                      )
                    )
                  ),
                ),

                onTap: () {
                  String time = _time();
                  if (_nameController.text != '' && time != 'Selecione o horário') {
                    Navigator.pop(context, Task(title: _nameController.text, time: time, id: 1));
                  } else {
                    debugPrint('Ivalid data');
                  }
                }
              ),
            )
          ]
        ),
      )
    );
  }
}

class FormInput extends StatelessWidget {
  final TextEditingController? textController;
  final String? tip;
  final String? label;
  final IconData? icon;

  FormInput({this.textController, this.tip, this.label, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: TextField(
        controller: textController,
        style: TextStyle(
          fontSize: 22.0
        ), 

        decoration: InputDecoration(
          hintText: tip,
          labelText: label,
          labelStyle: TextStyle(color: ThemeProvider.themeOf(context).data.colorScheme.primary),
          focusColor: ThemeProvider.themeOf(context).data.colorScheme.primary,

          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ThemeProvider.themeOf(context).data.colorScheme.primary)
          ),

          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ThemeProvider.themeOf(context).data.colorScheme.primary)
          )
        )
      )
    );
  }
}