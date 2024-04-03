import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keamk/assets/class/SortBy.dart';

class EnterNameEquipe extends StatefulWidget {
  // Déclarez un paramètre nommé "sort" dans le constructeur
  EnterNameEquipe({Key? key, required String this.name}) : super(key: key);

  // Attribut pour stocker la valeur de tri
  final String name;
  int level = 1;

  @override
  State<EnterNameEquipe> createState() => _EnterNameEquipeState();

  // Contrôleur de texte pour le TextField
  late TextEditingController _textEditingController = TextEditingController();

  String getName() {
    if (_textEditingController.text.isEmpty) {
      return name;
    } else {
      return _textEditingController.text;
    }
  }
}

class _EnterNameEquipeState extends State<EnterNameEquipe> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Disposez du contrôleur de texte dans la méthode dispose
    widget._textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: [
          Expanded(
            flex: 6,
            child: SizedBox(
              height: width * 0.55 * 0.15,
              child: TextField(
                controller: widget._textEditingController,
                decoration: InputDecoration(
                  labelText: widget.name,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.zero, // Pas de coins arrondis
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors
                            .black), // Couleur de la bordure lorsqu'elle est sélectionnée
                    borderRadius: BorderRadius.zero, // Pas de coins arrondis
                  ),
                ),
              ),
            ),
          ),
        ]));
  }
}
