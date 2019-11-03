class Candidate {
  String _id;
  String _relativeUri;
  String _name;
  String _party;
  String _status;

  Candidate(
      {String id,
        String relativeUri,
        String name,
        String party,
        String status}) {
    this._id = id;
    this._relativeUri = relativeUri;
    this._name = name;
    this._party = party;
    this._status = status;
  }

  String get id => _id;
  set id(String id) => _id = id;
  String get relativeUri => _relativeUri;
  set relativeUri(String relativeUri) => _relativeUri = relativeUri;
  String get name => _name;
  set name(String name) => _name = name;
  String get party => _party;
  set party(String party) => _party = party;
  String get status => _status;
  set status(String status) => _status = status;

  Candidate.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _relativeUri = json['relative_uri'];
    _name = json['name'];
    _party = json['party'];
    _status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['relative_uri'] = this._relativeUri;
    data['name'] = this._name;
    data['party'] = this._party;
    data['status'] = this._status;
    return data;
  }
}