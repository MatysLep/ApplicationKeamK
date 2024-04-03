import 'package:keamk/assets/class/Participant.dart';

class ParticipantLevel extends Participant {
  int _level;
  ParticipantLevel(super.nom, this._level);

  String toString() {
    return super.toString() + " level : " + _level.toString();
  }

  void setLevel(int l) {
    _level = l;
  }

  int getLevel() {
    return _level;
  }
}
