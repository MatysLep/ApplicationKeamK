import 'package:flutter/material.dart';
import 'package:keamk/assets/class/SortBy.dart';
import 'package:keamk/assets/class/Team.dart';
import 'package:keamk/assets/widget/DisplayTeam.dart';

class DisplayAllTeam extends StatelessWidget {
  const DisplayAllTeam({Key? key, required this.teams, required this.sort})
      : super(key: key);

  final List<Team> teams;
  final SortBy sort;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: teams.map((team) {
        return DisplayTeam(team: team, sort: sort);
      }).toList(),
    );
  }
}
