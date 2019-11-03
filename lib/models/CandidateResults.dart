import 'Candidate.dart';

class CandidateResults {
  Candidate _candidate;
  String _committee;

  CandidateResults({Candidate candidate, String committee}) {
    this._candidate = candidate;
    this._committee = committee;
  }

  Candidate get candidate => _candidate;
  set candidate(Candidate candidate) => _candidate = candidate;
  String get committee => _committee;
  set committee(String committee) => _committee = committee;

  CandidateResults.fromJson(Map<String, dynamic> json) {
    _candidate = json['candidate'] != null
        ? new Candidate.fromJson(json['candidate'])
        : null;
    _committee = json['committee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._candidate != null) {
      data['candidate'] = this._candidate.toJson();
    }
    data['committee'] = this._committee;
    return data;
  }
}