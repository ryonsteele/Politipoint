class IndependentExpenditures {
  double _total;
  double _primary;
  double _general;
  double _support;
  double _oppose;
  String _lastActivity;
  double _demSupport;
  double _demOppose;
  double _gopSupport;
  double _gopOppose;
  double _indSupport;
  double _indOppose;

IndependentExpenditures(
    {double total,
      double primary,
      double general,
      double support,
      double oppose,
      String lastActivity,
      double demSupport,
      double demOppose,
      double gopSupport,
      double gopOppose,
      double indSupport,
      double indOppose}) {
  this._total = total;
  this._primary = primary;
  this._general = general;
  this._support = support;
  this._oppose = oppose;
  this._lastActivity = lastActivity;
  this._demSupport = demSupport;
  this._demOppose = demOppose;
  this._gopSupport = gopSupport;
  this._gopOppose = gopOppose;
  this._indSupport = indSupport;
  this._indOppose = indOppose;
}

double get total => _total;
set total(double total) => _total = total;
double get primary => _primary;
set primary(double primary) => _primary = primary;
double get general => _general;
set general(double general) => _general = general;
double get support => _support;
set support(double support) => _support = support;
double get oppose => _oppose;
set oppose(double oppose) => _oppose = oppose;
String get lastActivity => _lastActivity;
set lastActivity(String lastActivity) => _lastActivity = lastActivity;
double get demSupport => _demSupport;
set demSupport(double demSupport) => _demSupport = demSupport;
double get demOppose => _demOppose;
set demOppose(double demOppose) => _demOppose = demOppose;
double get gopSupport => _gopSupport;
set gopSupport(double gopSupport) => _gopSupport = gopSupport;
double get gopOppose => _gopOppose;
set gopOppose(double gopOppose) => _gopOppose = gopOppose;
double get indSupport => _indSupport;
set indSupport(double indSupport) => _indSupport = indSupport;
double get indOppose => _indOppose;
set indOppose(double indOppose) => _indOppose = indOppose;

IndependentExpenditures.fromJson(Map<String, dynamic> json) {
_total = json['total'];
_primary = json['primary'];
_general = json['general'];
_support = json['support'];
_oppose = json['oppose'];
_lastActivity = json['last_activity'];
_demSupport = json['dem_support'];
_demOppose = json['dem_oppose'];
_gopSupport = json['gop_support'];
_gopOppose = json['gop_oppose'];
_indSupport = json['ind_support'];
_indOppose = json['ind_oppose'];
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['total'] = this._total;
  data['primary'] = this._primary;
  data['general'] = this._general;
  data['support'] = this._support;
  data['oppose'] = this._oppose;
  data['last_activity'] = this._lastActivity;
  data['dem_support'] = this._demSupport;
  data['dem_oppose'] = this._demOppose;
  data['gop_support'] = this._gopSupport;
  data['gop_oppose'] = this._gopOppose;
  data['ind_support'] = this._indSupport;
  data['ind_oppose'] = this._indOppose;
  return data;
}
}