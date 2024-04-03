import 'package:flutter/material.dart';
import 'package:keamk/assets/class/SortBy.dart';
import 'package:keamk/assets/class/Team.dart';

class DisplayTeam extends StatelessWidget {
  const DisplayTeam({Key? key, required this.team, required this.sort})
      : super(key: key);

  final Team team;
  final SortBy sort;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: const Color(0xFFf97352), // Ajoute une ombre à la carte
      margin: const EdgeInsets.all(8), // Marge autour de la carte
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Container(
                child: Text(
                  team.getName(),
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: team.getParticipants().map((participant) {
                    Widget trailingWidget;

                    if (sort == SortBy.GENDER) {
                      trailingWidget = Text(
                        participant.getGender(),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    } else if (sort == SortBy.LEVEL) {
                      trailingWidget = Text(
                        participant.getLevel().toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    } else {
                      trailingWidget =
                          const SizedBox(); // Pour assurer la compatibilité, mettre un widget vide
                    }

                    return Card(
                        elevation: 10,
                        color: const Color.fromARGB(255, 255, 162, 138),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 3.0),
                          child: ListTile(
                            title: Text(
                              participant.getName(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            trailing: trailingWidget,
                          ),
                        ));
                  }).toList() ??
                  [],
            ),
          ],
        ),
      ),
    );
  }
}
