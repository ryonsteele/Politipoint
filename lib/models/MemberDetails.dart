class MemberDetails {
  String status;
  String copyright;
  List<Results> results;

  MemberDetails({this.status, this.copyright, this.results});

  MemberDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    copyright = json['copyright'];
    if (json['results'] != null) {
      results = new List<Results>();
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
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

class Results {
  String memberId;
  String firstName;
  String middleName;
  String lastName;
  String suffix;
  String dateOfBirth;
  String gender;
  String url;
  String timesTopicsUrl;
  String timesTag;
  String govtrackId;
  String cspanId;
  String votesmartId;
  String icpsrId;
  String twitterAccount;
  String facebookAccount;
  String youtubeAccount;
  String crpId;
  String googleEntityId;
  String rssUrl;
  bool inOffice;
  String currentParty;
  String mostRecentVote;
  String lastUpdated;
  List<Roles> roles;

  Results(
      {this.memberId,
        this.firstName,
        this.middleName,
        this.lastName,
        this.suffix,
        this.dateOfBirth,
        this.gender,
        this.url,
        this.timesTopicsUrl,
        this.timesTag,
        this.govtrackId,
        this.cspanId,
        this.votesmartId,
        this.icpsrId,
        this.twitterAccount,
        this.facebookAccount,
        this.youtubeAccount,
        this.crpId,
        this.googleEntityId,
        this.rssUrl,
        this.inOffice,
        this.currentParty,
        this.mostRecentVote,
        this.lastUpdated,
        this.roles});

  Results.fromJson(Map<String, dynamic> json) {
    memberId = json['member_id'];
    firstName = json['first_name'];
    middleName = json['middle_name'];
    lastName = json['last_name'];
    suffix = json['suffix'];
    dateOfBirth = json['date_of_birth'];
    gender = json['gender'];
    url = json['url'];
    timesTopicsUrl = json['times_topics_url'];
    timesTag = json['times_tag'];
    govtrackId = json['govtrack_id'];
    cspanId = json['cspan_id'];
    votesmartId = json['votesmart_id'];
    icpsrId = json['icpsr_id'];
    twitterAccount = json['twitter_account'];
    facebookAccount = json['facebook_account'];
    youtubeAccount = json['youtube_account'];
    crpId = json['crp_id'];
    googleEntityId = json['google_entity_id'];
    rssUrl = json['rss_url'];
    inOffice = json['in_office'];
    currentParty = json['current_party'];
    mostRecentVote = json['most_recent_vote'];
    lastUpdated = json['last_updated'];
    if (json['roles'] != null) {
      roles = new List<Roles>();
      json['roles'].forEach((v) {
        roles.add(new Roles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['member_id'] = this.memberId;
    data['first_name'] = this.firstName;
    data['middle_name'] = this.middleName;
    data['last_name'] = this.lastName;
    data['suffix'] = this.suffix;
    data['date_of_birth'] = this.dateOfBirth;
    data['gender'] = this.gender;
    data['url'] = this.url;
    data['times_topics_url'] = this.timesTopicsUrl;
    data['times_tag'] = this.timesTag;
    data['govtrack_id'] = this.govtrackId;
    data['cspan_id'] = this.cspanId;
    data['votesmart_id'] = this.votesmartId;
    data['icpsr_id'] = this.icpsrId;
    data['twitter_account'] = this.twitterAccount;
    data['facebook_account'] = this.facebookAccount;
    data['youtube_account'] = this.youtubeAccount;
    data['crp_id'] = this.crpId;
    data['google_entity_id'] = this.googleEntityId;
    data['rss_url'] = this.rssUrl;
    data['in_office'] = this.inOffice;
    data['current_party'] = this.currentParty;
    data['most_recent_vote'] = this.mostRecentVote;
    data['last_updated'] = this.lastUpdated;
    if (this.roles != null) {
      data['roles'] = this.roles.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Roles {
  String congress;
  String chamber;
  String title;
  String shortTitle;
  String state;
  String party;
  String leadershipRole;
  String fecCandidateId;
  String seniority;
  String senateClass;
  String stateRank;
  String lisId;
  String ocdId;
  String startDate;
  String endDate;
  String office;
  String phone;
  String fax;
  String contactForm;
  int billsSponsored;
  int billsCosponsored;
  double missedVotesPct;
  double votesWithPartyPct;
  List<Committees> committees;
  List<Subcommittees> subcommittees;

  Roles(
      {this.congress,
        this.chamber,
        this.title,
        this.shortTitle,
        this.state,
        this.party,
        this.leadershipRole,
        this.fecCandidateId,
        this.seniority,
        this.senateClass,
        this.stateRank,
        this.lisId,
        this.ocdId,
        this.startDate,
        this.endDate,
        this.office,
        this.phone,
        this.fax,
        this.contactForm,
        this.billsSponsored,
        this.billsCosponsored,
        this.missedVotesPct,
        this.votesWithPartyPct,
        this.committees,
        this.subcommittees});

  Roles.fromJson(Map<String, dynamic> json) {
    congress = json['congress'];
    chamber = json['chamber'];
    title = json['title'];
    shortTitle = json['short_title'];
    state = json['state'];
    party = json['party'];
    leadershipRole = json['leadership_role'];
    fecCandidateId = json['fec_candidate_id'];
    seniority = json['seniority'];
    senateClass = json['senate_class'];
    stateRank = json['state_rank'];
    lisId = json['lis_id'];
    ocdId = json['ocd_id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    office = json['office'];
    phone = json['phone'];
    fax = json['fax'];
    contactForm = json['contact_form'];
    billsSponsored = json['bills_sponsored'];
    billsCosponsored = json['bills_cosponsored'];
    missedVotesPct = json['missed_votes_pct'];
    votesWithPartyPct = json['votes_with_party_pct'];
    if (json['committees'] != null) {
      committees = new List<Committees>();
      json['committees'].forEach((v) {
        committees.add(new Committees.fromJson(v));
      });
    }
    if (json['subcommittees'] != null) {
      subcommittees = new List<Subcommittees>();
      json['subcommittees'].forEach((v) {
        subcommittees.add(new Subcommittees.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['congress'] = this.congress;
    data['chamber'] = this.chamber;
    data['title'] = this.title;
    data['short_title'] = this.shortTitle;
    data['state'] = this.state;
    data['party'] = this.party;
    data['leadership_role'] = this.leadershipRole;
    data['fec_candidate_id'] = this.fecCandidateId;
    data['seniority'] = this.seniority;
    data['senate_class'] = this.senateClass;
    data['state_rank'] = this.stateRank;
    data['lis_id'] = this.lisId;
    data['ocd_id'] = this.ocdId;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['office'] = this.office;
    data['phone'] = this.phone;
    data['fax'] = this.fax;
    data['contact_form'] = this.contactForm;
    data['bills_sponsored'] = this.billsSponsored;
    data['bills_cosponsored'] = this.billsCosponsored;
    data['missed_votes_pct'] = this.missedVotesPct;
    data['votes_with_party_pct'] = this.votesWithPartyPct;
    if (this.committees != null) {
      data['committees'] = this.committees.map((v) => v.toJson()).toList();
    }
    if (this.subcommittees != null) {
      data['subcommittees'] =
          this.subcommittees.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Committees {
  String name;
  String code;
  String apiUri;
  String side;
  String title;
  int rankInParty;
  String beginDate;
  String endDate;

  Committees(
      {this.name,
        this.code,
        this.apiUri,
        this.side,
        this.title,
        this.rankInParty,
        this.beginDate,
        this.endDate});

  Committees.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
    apiUri = json['api_uri'];
    side = json['side'];
    title = json['title'];
    rankInParty = json['rank_in_party'];
    beginDate = json['begin_date'];
    endDate = json['end_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['code'] = this.code;
    data['api_uri'] = this.apiUri;
    data['side'] = this.side;
    data['title'] = this.title;
    data['rank_in_party'] = this.rankInParty;
    data['begin_date'] = this.beginDate;
    data['end_date'] = this.endDate;
    return data;
  }
}

class Subcommittees {
  String name;
  String code;
  String parentCommitteeId;
  String apiUri;
  String side;
  String title;
  int rankInParty;
  String beginDate;
  String endDate;

  Subcommittees(
      {this.name,
        this.code,
        this.parentCommitteeId,
        this.apiUri,
        this.side,
        this.title,
        this.rankInParty,
        this.beginDate,
        this.endDate});

  Subcommittees.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
    parentCommitteeId = json['parent_committee_id'];
    apiUri = json['api_uri'];
    side = json['side'];
    title = json['title'];
    rankInParty = json['rank_in_party'];
    beginDate = json['begin_date'];
    endDate = json['end_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['code'] = this.code;
    data['parent_committee_id'] = this.parentCommitteeId;
    data['api_uri'] = this.apiUri;
    data['side'] = this.side;
    data['title'] = this.title;
    data['rank_in_party'] = this.rankInParty;
    data['begin_date'] = this.beginDate;
    data['end_date'] = this.endDate;
    return data;
  }
}

