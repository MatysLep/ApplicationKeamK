import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keamk/assets/class/SortBy.dart';

class EnterNameParticipant extends StatefulWidget {
  // Déclarez un paramètre nommé "sort" dans le constructeur
  EnterNameParticipant(
      {Key? key, required this.sort, required String this.name})
      : super(key: key);

  // Attribut pour stocker la valeur de tri
  final SortBy sort;
  final String name;
  int level = 1;
  bool _isSelectedF = false;
  bool _isSelectedM = false;

  @override
  State<EnterNameParticipant> createState() => _EnterNameParticipantState();

  // Contrôleur de texte pour le TextField
  late TextEditingController _textEditingController = TextEditingController();

  String getName() {
    if (_textEditingController.text.isEmpty) {
      return name;
    } else {
      return _textEditingController.text;
    }
  }

  String getGender() {
    if (_isSelectedF) {
      return "F";
    } else {
      return "M";
    }
  }

  int getLevel() {
    return level;
  }
}

class _EnterNameParticipantState extends State<EnterNameParticipant> {
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
      child: Row(
        children: [
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
          Expanded(
            flex: 3,
            child: widget.sort == SortBy.NORMAL
                ? SizedBox(
                    height: width * 0.55 * 0.15,
                  )
                : widget.sort == SortBy.GENDER
                    ? SizedBox(
                        height: width * 0.55 * 0.15,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    widget._isSelectedF = !widget._isSelectedF;
                                    widget._isSelectedM = false;
                                  });
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          widget._isSelectedF
                                              ? const Color(0xFF3d4045)
                                              : const Color.fromARGB(
                                                  20, 61, 64, 69)),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0),
                                      side: const BorderSide(
                                        color: Color.fromARGB(255, 14, 13,
                                            13), // Couleur de la bordure
                                        width: 1.0, // Épaisseur de la bordure
                                      ),
                                    ),
                                  ),
                                ),
                                child: const Text(
                                  'F',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    widget._isSelectedM = !widget._isSelectedM;
                                    widget._isSelectedF = false;
                                  });
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          widget._isSelectedM
                                              ? const Color(0xFF3d4045)
                                              : const Color.fromARGB(
                                                  20, 61, 64, 69)),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0),
                                      side: const BorderSide(
                                        color: Colors
                                            .black, // Couleur de la bordure
                                        width: 1.0, // Épaisseur de la bordure
                                      ),
                                    ),
                                  ),
                                ),
                                child: const Text(
                                  'M',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : SizedBox(
                        height: width * 0.55 * 0.15,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: width *
                                    0.55 *
                                    0.15, // Définissez la hauteur du Container
                                child: DropdownButton<int>(
                                  isExpanded:
                                      true, // Permet au DropdownButton de s'étendre sur toute la largeur du conteneur
                                  items: List.generate(5, (index) => index + 1)
                                      .map((int value) => DropdownMenuItem<int>(
                                            value: value,
                                            child: Text(value.toString()),
                                          ))
                                      .toList(),
                                  value: widget.level,
                                  onChanged: (int? newValue) {
                                    setState(() {
                                      widget.level = newValue!;
                                    });
                                  },
                                ),
                              ),
                            ),
                            Expanded(flex: 1, child: SizedBox())
                          ],
                        ),
                      ),
          )
        ],
      ),
    );
  }
}
