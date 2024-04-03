import 'package:keamk/assets/class/Participant.dart';
import 'package:keamk/assets/class/ParticipantLevel.dart';

class Team {
  String _name;
  List<dynamic> _participants;

  Team(this._name, this._participants);

  String toString() {
    String res = _name + " : \n";
    for (int i = 0; i < _participants.length; ++i) {
      res += i.toString() + " : " + _participants[i].toString() + "\n";
    }
    return res;
  }

  void addParticipant(dynamic participant) {
    _participants.add(participant);
  }

  void removeParticipant(int i) {
    _participants.remove(i);
  }

  String getName() {
    return _name;
  }

  List<dynamic> getParticipants() {
    return _participants;
  }

  void setListParticipant(List<Participant> p) {
    _participants = p;
  }

  double getAverage() {
    int somme = 0;
    if (_participants.isEmpty) {
      return 0;
    }
    for (int i = 0; i < _participants.length; i++) {
      ParticipantLevel p = _participants[i] as ParticipantLevel;
      somme += p.getLevel();
    }
    return somme / _participants.length;
  }
}
