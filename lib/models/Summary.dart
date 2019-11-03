class Summary {
  int _candidates;
  bool _incumbent;
  String _incumbentParty;
  double _receiptsTotal;
  double _disbursementsTotal;
  String _endDate;

  Summary(
      {int candidates,
        bool incumbent,
        Null incumbentParty,
        double receiptsTotal,
        double disbursementsTotal,
        String endDate}) {
    this._candidates = candidates;
    this._incumbent = incumbent;
    this._incumbentParty = incumbentParty;
    this._receiptsTotal = receiptsTotal;
    this._disbursementsTotal = disbursementsTotal;
    this._endDate = endDate;
  }

  int get candidates => _candidates;
  set candidates(int candidates) => _candidates = candidates;
  bool get incumbent => _incumbent;
  set incumbent(bool incumbent) => _incumbent = incumbent;
  String get incumbentParty => _incumbentParty;
  set incumbentParty(String incumbentParty) => _incumbentParty = incumbentParty;
  double get receiptsTotal => _receiptsTotal;
  set receiptsTotal(double receiptsTotal) => _receiptsTotal = receiptsTotal;
  double get disbursementsTotal => _disbursementsTotal;
  set disbursementsTotal(double disbursementsTotal) =>
      _disbursementsTotal = disbursementsTotal;
  String get endDate => _endDate;
  set endDate(String endDate) => _endDate = endDate;

  Summary.fromJson(Map<String, dynamic> json) {
    _candidates = json['candidates'];
    _incumbent = json['incumbent'];
    _incumbentParty = json['incumbent_party'];
    _receiptsTotal = json['receipts_total'];
    _disbursementsTotal = json['disbursements_total'];
    _endDate = json['end_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['candidates'] = this._candidates;
    data['incumbent'] = this._incumbent;
    data['incumbent_party'] = this._incumbentParty;
    data['receipts_total'] = this._receiptsTotal;
    data['disbursements_total'] = this._disbursementsTotal;
    data['end_date'] = this._endDate;
    return data;
  }
}