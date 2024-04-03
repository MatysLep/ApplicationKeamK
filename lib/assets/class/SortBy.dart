enum SortBy {
  NORMAL("Normal"),
  GENDER("Genre"),
  LEVEL("Niveau"),
  ;

  const SortBy(this.value);

  final String value;

  String getStringValue() {
    return value;
  }
}
