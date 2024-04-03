import 'package:flutter/material.dart';
import 'package:keamk/assets/class/SortBy.dart';

class TypeOfTirage extends StatefulWidget {
  final void Function(SortBy) onChanged; // Définir le paramètre onChanged

  const TypeOfTirage({Key? key, required this.onChanged}) : super(key: key);

  @override
  State<TypeOfTirage> createState() => _TypeOfTirageState();
}

class _TypeOfTirageState extends State<TypeOfTirage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (var index = 0; index < SortBy.values.length; index++)
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: _selectedIndex == index
                      ? Colors.white
                      : Colors.transparent,
                  width: 2.0,
                ),
              ),
              // Set background color based on button state
              backgroundColor:
                  _selectedIndex == index ? Colors.white : Colors.transparent,
              foregroundColor:
                  _selectedIndex == index ? Colors.black : Colors.white,
            ),
            onPressed: () {
              setState(() {
                _selectedIndex = index; // Set selected index
                widget.onChanged(SortBy.values[
                    index]); // Appeler onChanged avec la nouvelle valeur de l'enum
              });
            },
            child: Text(SortBy.values[index].getStringValue().split('.').last),
          ),
      ],
    );
  }
}
