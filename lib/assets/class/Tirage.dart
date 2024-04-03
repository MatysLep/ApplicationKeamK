import 'package:keamk/assets/class/ParticipantGender.dart';
import 'package:keamk/assets/class/ParticipantLevel.dart';
import 'package:keamk/assets/class/SortBy.dart';
import 'package:keamk/assets/class/Team.dart';

class Tirage {
  SortBy sort;
  List<dynamic> participants;
  List<Team> teams;

  Tirage(this.sort, this.participants, this.teams);

  List<dynamic> getParticipants() => participants;
  List<Team> getTeams() => teams;

  List<Team> makeTirage() {
    List<Team> teamsfinal = [];
    if (sort == SortBy.GENDER) {
      insertParticipantGenderInTeam();
    } else if (sort == SortBy.LEVEL) {
      insertParticipantLevelInTeam();
      for (int i = 0; i < teams.length; i++) {
        print(teams[i].toString());
      }
    } else {
      insertParticipantInTeam(0, participants);
    }
    return teamsfinal;
  }

  // TIRAGE GENDER
  insertParticipantGenderInTeam() {
    List<ParticipantGender> listF = [];
    List<ParticipantGender> listM = [];
    for (int i = 0; i < participants.length; ++i) {
      ParticipantGender p = participants[i];
      if (p.getGender() == 'F') {
        listF.add(p);
      } else {
        listM.add(p);
      }
    }

    insertParticipantInTeam(0, listF);
    insertParticipantInTeam(0, listM);
  }

  //TIRAGE LEVEL

  double getAverage(Team t) {
    double sum = 0;
    List<ParticipantLevel> listP = [];
    for (int i = 0; i < t.getParticipants().length; i++) {
      listP.add(t.getParticipants()[i]);
    }
    for (int i = 0; i < t.getParticipants().length; i++) {
      sum += listP[i].getLevel();
    }
    return sum / t.getParticipants().length;
  }

  void insertParticipantLevelInTeam() {
    participants.sort((a, b) => a.getLevel().compareTo(b.getLevel()));
    int min_average_j;

    while (!participants.isEmpty) {
      min_average_j = 0;
      teams.sort((a, b) =>
          a.getParticipants().length.compareTo(b.getParticipants().length));
      for (int j = 0; j < teams.length; j++) {
        if (teams[min_average_j].getAverage() > teams[j].getAverage()) {
          min_average_j = j;
        }
      }
      if (teams[0].getParticipants().length <
          teams[min_average_j].getParticipants().length) {
        teams[0].addParticipant(participants[0]);
        participants.remove(participants[0]);
      } else {
        teams[min_average_j]
            .addParticipant(participants[participants.length - 1]);
        participants.remove(participants[participants.length - 1]);
      }
    }
  }

  // TIRAGE NORMAL

  void insertParticipantInTeam(int i, List<dynamic> p) {
    p.shuffle();
    if (p.isEmpty) {
      return;
    } else {
      teams[i % teams.length].addParticipant(p[0]);
      p.remove(p[0]);
      return insertParticipantInTeam(i + 1, p);
    }
  }
}
