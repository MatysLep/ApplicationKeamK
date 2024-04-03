import 'package:keamk/assets/class/ParticipantGender.dart';
import 'package:keamk/assets/class/ParticipantLevel.dart';
import 'package:keamk/assets/class/Team.dart';
import 'package:keamk/assets/widget/EnterNameEquipe.dart';
import 'package:keamk/assets/widget/EnterNameParticipant.dart';

// A ajouter pour améliorer le code

class Outils {
  List<String> getParticipantNames(
      List<EnterNameParticipant> widgetEnterNameParticipant) {
    List<String> listParticipantName = [];
    for (int i = 0; i < widgetEnterNameParticipant.length; i++) {
      listParticipantName.add(widgetEnterNameParticipant[i].getName());
    }
    return listParticipantName;
  }

  List<String> getEquipeNames(List<EnterNameEquipe> widgetEnterNameEquipe) {
    List<String> listEquipeName = [];
    for (int i = 0; i < widgetEnterNameEquipe.length; i++) {
      listEquipeName.add(widgetEnterNameEquipe[i].getName());
    }
    return listEquipeName;
  }

  List<Team> getEquipes(List<EnterNameEquipe> widgetEnterNameEquipe) {
    List<Team> listEquipeName = [];
    for (int i = 0; i < widgetEnterNameEquipe.length; i++) {
      listEquipeName.add(Team(widgetEnterNameEquipe[i].getName(), []));
    }
    return listEquipeName;
  }

  List<String> getGenderParticipants(
      List<ParticipantGender> widgetEnterNameParticipant,
      List<String> participantNames) {
    List<String> listGenderParticipants = [];
    for (int i = 0; i < participantNames.length; i++) {
      listGenderParticipants.add(widgetEnterNameParticipant[i].getGender());
    }
    return listGenderParticipants;
  }

  List<int> getLevelParticipants(List<String> participantNames,
      List<EnterNameEquipe> widgetEnterNameParticipant) {
    List<int> listLevelParticipants = [];
    for (int i = 0; i < participantNames.length; i++) {
      listLevelParticipants.add(widgetEnterNameParticipant[i].getLevel());
    }
    return listLevelParticipants;
  }

  List<ParticipantGender> listParticipantsGender(
      List<String> participantNames, List<String> listGender) {
    List<ParticipantGender> participants = [];
    for (int i = 0; i < participantNames.length; i++) {
      participants.add(ParticipantGender(participantNames[i], listGender[i]));
    }
    return participants;
  }

  List<ParticipantLevel> listParticipantsLevel(
      List<String> participantNames, List<int> listLevel) {
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
