import 'package:flutter/material.dart';
import 'package:keamk/assets/class/Participant.dart';
import 'package:keamk/assets/class/ParticipantGender.dart';
import 'package:keamk/assets/class/ParticipantLevel.dart';
import 'package:keamk/assets/class/SortBy.dart';
import 'package:keamk/assets/class/Team.dart';
import 'package:keamk/assets/class/Tirage.dart';
import 'package:keamk/assets/widget/DisplayAllTeam.dart';
import 'package:keamk/assets/widget/EnterNameParticipant.dart';
import 'package:keamk/assets/widget/EnterNameEquipe.dart';
import 'package:keamk/assets/widget/ChooseNum.dart';
import 'package:keamk/assets/widget/TypeOfTirage.dart';

class Keamk extends StatefulWidget {
  Keamk({Key? key}) : super(key: key);

  int nbParticipants = 1;
  int nbEquipes = 1;
  SortBy sort = SortBy.NORMAL;
  List<ParticipantGender> participantsGender = [];
  List<ParticipantLevel> participantsLevel = [];
  List<Participant> participants = [];

  List<EnterNameParticipant> widgetEnterNameParticipant = [
    EnterNameParticipant(sort: SortBy.NORMAL, name: "")
  ];
  List<EnterNameEquipe> widgetEnterNameEquipe = [
    EnterNameEquipe(
      name: "",
    )
  ];
  List<String> participantNames = [];
  List<String> teamNames = [];

  List<Team> listTeam = [];
  List<int> listLevel = [];
  List<String> listGender = [];

  bool doTirage = false;

  @override
  State<Keamk> createState() => _KeamkState();

  List<String> getParticipantNames() {
    List<String> listParticipantName = [];
    for (int i = 0; i < widgetEnterNameParticipant.length; i++) {
      listParticipantName.add(widgetEnterNameParticipant[i].getName());
    }
    return listParticipantName;
  }

  List<String> getEquipeNames() {
    List<String> listEquipeName = [];
    for (int i = 0; i < widgetEnterNameEquipe.length; i++) {
      listEquipeName.add(widgetEnterNameEquipe[i].getName());
    }
    return listEquipeName;
  }

  List<Team> getEquipes() {
    List<Team> listEquipeName = [];
    for (int i = 0; i < widgetEnterNameEquipe.length; i++) {
      listEquipeName.add(Team(widgetEnterNameEquipe[i].getName(), []));
    }
    return listEquipeName;
  }

  List<String> getGenderParticipants() {
    List<String> listGenderParticipants = [];
    for (int i = 0; i < participantNames.length; i++) {
      listGenderParticipants.add(widgetEnterNameParticipant[i].getGender());
    }
    return listGenderParticipants;
  }

  List<int> getLevelParticipants() {
    List<int> listLevelParticipants = [];
    for (int i = 0; i < participantNames.length; i++) {
      listLevelParticipants.add(widgetEnterNameParticipant[i].getLevel());
    }
    return listLevelParticipants;
  }

  List<ParticipantGender> listParticipantsGender() {
    List<ParticipantGender> participants = [];
    for (int i = 0; i < participantNames.length; i++) {
      participants.add(ParticipantGender(participantNames[i], listGender[i]));
    }
    return participants;
  }

  List<ParticipantLevel> listParticipantsLevel() {
    List<ParticipantLevel> participants = [];
    for (int i = 0; i < participantNames.length; i++) {
      participants.add(ParticipantLevel(participantNames[i], listLevel[i]));
    }
    return participants;
  }

  List<Participant> listParticipants() {
    List<Participant> participants = [];
    for (int i = 0; i < participantNames.length; i++) {
      participants.add(Participant(participantNames[i]));
    }
    return participants;
  }

  String afficherParticipants() {
    String res = "afficherParticipant : ";
    if (sort == SortBy.LEVEL) {
      for (int i = 0; i < participantsLevel.length; i++) {
        res += participantsLevel[i].toString();
      }
    } else if (sort == SortBy.GENDER) {
      for (int i = 0; i < participantsGender.length; i++) {
        res += participantsGender[i].toString();
      }
    } else {
      for (int i = 0; i < participants.length; i++) {
        res += participants[i].toString();
      }
    }
    return res;
  }
}

class _KeamkState extends State<Keamk> {
  late Tirage tirage;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    TextStyle styleHeader = const TextStyle(
      color: Colors.white,
      fontSize: 20,
    );
    TextStyle styleBody = const TextStyle(
      fontSize: 16,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3d4045),
        elevation: 30,
        title: Image.asset(
          "lib/assets/img/keamk-logo.png",
          height: 40,
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Container(
              color: const Color.fromARGB(255, 85, 85, 100),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 0, 5),
                      child: Text(
                        "Type de tirage",
                        style: styleHeader,
                      ),
                    ),
                    TypeOfTirage(
                      onChanged: (newSort) {
                        setState(() {
                          widget.doTirage = false;
                          widget.sort = newSort;
                          widget.participantNames =
                              widget.getParticipantNames();
                          widget.widgetEnterNameParticipant = List.generate(
                            widget.nbParticipants,
                            (index) => EnterNameParticipant(
                              sort: widget.sort,
                              name: widget.participantNames.isEmpty
                                  ? ""
                                  : widget.participantNames[index],
                            ),
                          );
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  ChooseNum(
                    onSelectedNumberChanged: (newNumber) {
                      setState(() {
                        widget.nbParticipants = newNumber;
                        widget.doTirage = false;
                        widget.participantNames = widget.getParticipantNames();
                        widget.widgetEnterNameParticipant = List.generate(
                          widget.nbParticipants,
                          (index) => EnterNameParticipant(
                            sort: widget.sort,
                            name: index < widget.participantNames.length
                                ? widget.participantNames[index]
                                : "",
                          ),
                        );
                      });
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Participants",
                    style: styleBody,
                  )
                ],
              ),
            ),
            // Utilisation de la liste widgetEnterNameParticipant pour afficher les widgets EnterNameParticipant
            Column(
              children: widget.widgetEnterNameParticipant,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  ChooseNum(
                    onSelectedNumberChanged: (newNumber) {
                      setState(() {
                        widget.doTirage = false;
                        widget.nbEquipes = newNumber;
                        widget.listTeam = widget.getEquipes();

                        widget.teamNames = widget.getEquipeNames();
                        widget.widgetEnterNameEquipe = List.generate(
                          widget.nbEquipes,
                          (index) => EnterNameEquipe(
                              name: index < widget.teamNames.length
                                  ? widget.teamNames[index]
                                  : ""),
                        );
                      });
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text("Equipes", style: styleBody),
                ],
              ),
            ),
            Column(
              children: widget.widgetEnterNameEquipe,
            ),
            widget.doTirage
                ? Column(
                    children: [
                      const SizedBox(height: 50),
                      const Divider(
                        color: Colors.black,
                        thickness: 2,
                      ),
                      DisplayAllTeam(
                        teams: widget.listTeam,
                        sort: widget.sort,
                      ),
                    ],
                  )
                : const SizedBox(
                    width: 0,
                  ),
            const SizedBox(
              height: 90,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFf97352),
        onPressed: () {
          setState(() {
            widget.doTirage = true;
          });
          widget.participantNames = widget.getParticipantNames();
          widget.listTeam = widget.getEquipes();
          if (widget.sort == SortBy.GENDER) {
            widget.listGender = widget.getGenderParticipants();
            widget.participantsGender = widget.listParticipantsGender();
            tirage =
                Tirage(widget.sort, widget.participantsGender, widget.listTeam);
          } else if (widget.sort == SortBy.LEVEL) {
            widget.listLevel = widget.getLevelParticipants();
            widget.participantsLevel = widget.listParticipantsLevel();
            tirage =
                Tirage(widget.sort, widget.participantsLevel, widget.listTeam);
          } else {
            widget.participants = widget.listParticipants();
            tirage = Tirage(widget.sort, widget.participants, widget.listTeam);
          }
          tirage.makeTirage();
          widget.listTeam = tirage.getTeams();
        },
        child: const Icon(
          Icons.check,
          color: Colors.white,
        ),
      ),
    );
  }
}
