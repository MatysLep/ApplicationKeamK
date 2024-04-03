import 'package:keamk/assets/class/Participant.dart';

class ParticipantGender extends Participant {
  String _gender; // M for Male, F for Fem

  ParticipantGender(super._nom, this._gender);

  String toString() {
    return super.toString() + " gender : " + _gender;
  }

  void setGender(String g) {
    _gender = g;
  }

  String getGender() {
    return _gender;
  }
}
