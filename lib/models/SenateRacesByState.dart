import 'CandidateResults.dart';
import 'IndependentExpenditures.dart';
import 'Summary.dart';
import 'Candidate.dart';

class SenateRacesByState {
  String _status;
  String _copyright;
  int _cycle;
  String _state;
  Null _district;
  String _baseUri;
  int _numResults;
  List<CandidateResults> _results;
  Summary _summary;
  IndependentExpenditures _independentExpenditures;

  SenateRacesByState(
      {String status,
        String copyright,
        int cycle,
        String state,
        Null district,
        String baseUri,
        int numResults,
        List<CandidateResults> results,
        Summary summary,
        IndependentExpenditures independentExpenditures}) {
    this._status = status;
    this._copyright = copyright;
    this._cycle = cycle;
    this._state = state;
    this._district = district;
    this._baseUri = baseUri;
    this._numResults = numResults;
    this._results = results;
    this._summary = summary;
    this._independentExpenditures = independentExpenditures;
  }

  String get status => _status;
  set status(String status) => _status = status;
  String get copyright => _copyright;
  set copyright(String copyright) => _copyright = copyright;
  int get cycle => _cycle;
  set cycle(int cycle) => _cycle = cycle;
  String get state => _state;
  set state(String state) => _state = state;
  Null get district => _district;
  set district(Null district) => _district = district;
  String get baseUri => _baseUri;
  set baseUri(String baseUri) => _baseUri = baseUri;
  int get numResults => _numResults;
  set numResults(int numResults) => _numResults = numResults;
  List<CandidateResults> get results => _results;
  set results(List<CandidateResults> results) => _results = results;
  Summary get summary => _summary;
  set summary(Summary summary) => _summary = summary;
  IndependentExpenditures get independentExpenditures =>
      _independentExpenditures;
  set independentExpenditures(
      IndependentExpenditures independentExpenditures) =>
      _independentExpenditures = independentExpenditures;

  SenateRacesByState.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _copyright = json['copyright'];
    _cycle = json['cycle'];
    _state = json['state'];
    _district = json['district'];
    _baseUri = json['base_uri'];
    _numResults = json['num_results'];
    if (json['results'] != null) {
      _results = new List<CandidateResults>();
      json['results'].forEach((v) {
        _results.add(new CandidateResults.fromJson(v));
      });
    }
    _summary =
    json['summary'] != null ? new Summary.fromJson(json['summary']) : null;
    _independentExpenditures = json['independent_expenditures'] != null
        ? new IndependentExpenditures.fromJson(json['independent_expenditures'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    data['copyright'] = this._copyright;
    data['cycle'] = this._cycle;
    data['state'] = this._state;
    data['district'] = this._district;
    data['base_uri'] = this._baseUri;
    data['num_results'] = this._numResults;
    if (this._results != null) {
      data['results'] = this._results.map((v) => v.toJson()).toList();
    }
    if (this._summary != null) {
      data['summary'] = this._summary.toJson();
    }
    if (this._independentExpenditures != null) {
      data['independent_expenditures'] = this._independentExpenditures.toJson();
    }
    return data;
  }
}