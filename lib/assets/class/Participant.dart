class Participant {
  String _nom;

  Participant(this._nom);

  @override
  String toString() {
    return "name : " + _nom;
  }

  String getName() {
    return _nom;
  }

  void setName(String n) {
    _nom = n;
  }
}
