import 'package:politipoint/models/SenateRacesByState.dart';

class SenateRacesList {
  List<SenateRacesByState> races;

  SenateRacesList(
      List<SenateRacesByState> races
      ){
       this.races = races;
      }

  List<SenateRacesByState> get results => this.races;
  set results(List<SenateRacesByState> races) => this.races = races;
}