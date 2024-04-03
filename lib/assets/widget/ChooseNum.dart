import 'package:flutter/material.dart';

class ChooseNum extends StatefulWidget {
  ChooseNum({Key? key, required this.onSelectedNumberChanged})
      : super(key: key);

  final Function(int) onSelectedNumberChanged;

  int selectedNumber = 1;

  @override
  State<ChooseNum> createState() => _ChooseNumState();
}

class _ChooseNumState extends State<ChooseNum> {
  late int _selectedNumber = 0;

  @override
  void initState() {
    super.initState();
    _selectedNumber = widget.selectedNumber;
  }

  @override
  Widget build(BuildContext context) {
    List<int> nombres = List.generate(100, (i) => i + 1);
    return DropdownButton<int>(
      items: nombres
          .map((int nombre) => DropdownMenuItem<int>(
                value: nombre,
                child: Text(nombre.toString()),
              ))
          .toList(),
      value: _selectedNumber,
      onChanged: (int? newNombre) {
        if (newNombre != null) {
          setState(() {
            _selectedNumber = newNombre;
          });
          widget.onSelectedNumberChanged(newNombre);
        }
      },
    );
  }
}
