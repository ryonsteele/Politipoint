class CongressByStateList {
  String status;
  String copyright;
  List<MemberData> results;

  CongressByStateList({this.status, this.copyright, this.results});

  CongressByStateList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    copyright = json['copyright'];
    if (json['results'] != null) {
      results = new List<MemberData>();
      json['results'].forEach((v) {
        results.add(new MemberData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['copyright'] = this.copyright;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MemberData {
  String id;
  String name;
  String firstName;
  String middleName;
  String lastName;
  String suffix;
  String role;
  String gender;
  String party;
  String timesTopicsUrl;
  String twitterId;
  String facebookAccount;
  String youtubeId;
  String seniority;
  String nextElection;
  String apiUri;
  String state;

  MemberData(
      {this.id,
        this.name,
        this.firstName,
        this.middleName,
        this.lastName,
        this.suffix,
        this.role,
        this.gender,
        this.party,
        this.timesTopicsUrl,
        this.twitterId,
        this.facebookAccount,
        this.youtubeId,
        this.seniority,
        this.nextElection,
        this.apiUri,
        this.state});

  MemberData.fromJson(Map<String, dynamic> json) {
    if(json['id'] != null)
      id = json['id'];
    if(json['name'] != null)
      name = json['name'];
    if(json['first_name'] != null)
      firstName = json['first_name'];
    if(json['middle_name'] != null)
      middleName = json['middle_name'];
    if(json['last_name'] != null)
      lastName = json['last_name'];
    if(json['suffix'] != null)
      suffix = json['suffix'];
    if(json['role'] != null)
      role = json['role'];
    if(json['gender'] != null)
      gender = json['gender'];
    if(json['party'] != null)
      party = json['party'];
    if(json['times_topics_url'] != null)
      timesTopicsUrl = json['times_topics_url'];
    if(json['twitter_id'] != null)
      twitterId = json['twitter_id'];
    if(json['facebook_account'] != null)
      facebookAccount = json['facebook_account'];
    if(json['youtube_id'] != null)
      youtubeId = json['youtube_id'];
    if(json['seniority'] != null)
      seniority = json['seniority'];
    if(json['next_election'] != null)
      nextElection = json['next_election'];
    if(json['api_url'] != null)
      apiUri = json['api_uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['first_name'] = this.firstName;
    data['middle_name'] = this.middleName;
    data['last_name'] = this.lastName;
    data['suffix'] = this.suffix;
    data['role'] = this.role;
    data['gender'] = this.gender;
    data['party'] = this.party;
    data['times_topics_url'] = this.timesTopicsUrl;
    data['twitter_id'] = this.twitterId;
    data['facebook_account'] = this.facebookAccount;
    data['youtube_id'] = this.youtubeId;
    data['seniority'] = this.seniority;
    data['next_election'] = this.nextElection;
    data['api_uri'] = this.apiUri;
    return data;
  }
}

