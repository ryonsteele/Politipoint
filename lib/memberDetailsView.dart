import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'models/CongressByStateList.dart';
import 'models/MemberDetails.dart';
import 'Utils.dart';

class MemberDetailsView extends StatefulWidget {

  final MemberData data;

  MemberDetailsView({Key key, @required this.data}) : super(key: key);

  @override
  _MemberDetailsView createState() => _MemberDetailsView(this.data);
}

class _MemberDetailsView extends State<MemberDetailsView> {

  MemberDetails memObj;
  Results resObj;
  MemberData dataPassed;
  Roles latestRole;
  String stateKey;
  String inOffice = "No";
  int committees = 0;
  int subcommittees = 0;

  _MemberDetailsView(MemberData data){
    this.dataPassed = data;
    loadInit();
  }


  Future loadInit() async {

    Response response = await http.get('https://api.propublica.org/congress/v1/members/'+dataPassed.id + '.json',
        headers: {"X-API-Key": "ZsyvmijWed7wQqIJ6bz8d3W1vDXXvqm1jPAQTJMi"});

     //resObj = Results.fromJson(json.decode(response.body));


    setState(() {
      this.memObj = MemberDetails.fromJson(json.decode(response.body));
      this.resObj = memObj.results.first;

      if(this.resObj.inOffice){
        inOffice = "Yes";
      }
      this.latestRole = resObj.roles.first;
      //print(this.latestRole.toJson());
    });
  }

  @override
  Widget build(BuildContext context) {

    if(this.resObj == null){
      return new Container();
    }

    Utils util = new Utils();
    stateKey = util.getStates().keys.firstWhere(
            (k) => util.getStates()[k] == widget.data.state, orElse: () => null);

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.data.name} - ${widget.data.state}'),
      ),
      body: new Container(
                decoration: new BoxDecoration(
                color: const Color(0xffffffce),
                border: new Border.all(color: Colors.black, width: 5.0),
                borderRadius: new BorderRadius.all(Radius.circular(10)),
            ),
         margin: const EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0, bottom: 5.0),
         child:
         Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              Padding(padding: EdgeInsets.only(left: 25.0, top: 25),
                 child: Text('Name: ', textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent, fontSize: 18)),
               ),
              Padding(padding: EdgeInsets.only(right: 25.0, top: 25),
                 child: Text('${this.resObj.firstName} ${this.resObj.middleName} ${this.resObj.lastName}', textAlign: TextAlign.end, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
               ),
             ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 25.0, top: 8),
                    child: Text('State: ', textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent, fontSize: 18)),
                  ),
                  Padding(padding: EdgeInsets.only(right: 25.0, top: 8),
                    child: Text('${this.stateKey}', textAlign: TextAlign.end, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  ),
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 25.0, top: 8),
                    child: Text('Gender: ', textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent, fontSize: 18)),
                  ),
                  Padding(padding: EdgeInsets.only(right: 25.0, top: 8),
                    child: Text('${this.resObj.gender}', textAlign: TextAlign.end, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  ),
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 25.0, top: 8),
                    child: Text('Party: ', textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent, fontSize: 18)),
                  ),
                  Padding(padding: EdgeInsets.only(right: 25.0, top: 8),
                    child: Text('${util.getParty(this.resObj.currentParty)}', textAlign: TextAlign.end, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  ),
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 25.0, top: 8),
                      child: Text('In Office: ', textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent, fontSize: 18)),
                  ),
                  Padding(padding: EdgeInsets.only(right: 25.0, top: 8),
                    child: Text('${this.inOffice}', textAlign: TextAlign.end, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  ),
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 25.0, top: 8),
                    child: Text('Last Vote: ', textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent, fontSize: 18)),
                  ),
                  Padding(padding: EdgeInsets.only(right: 25.0, top: 8),
                    child: Text('${this.resObj.mostRecentVote}', textAlign: TextAlign.end, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  ),
                ]),
            Padding(padding: EdgeInsets.only(right: 25.0, top: 18),
              child: Text('Most Recent Role', textAlign: TextAlign.center, style: TextStyle(decoration: TextDecoration.underline, fontWeight: FontWeight.bold, color: Colors.blueAccent, fontSize: 22)),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 25.0, top: 18),
                    child: Text('Congress: ', textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent, fontSize: 18)),
                  ),
                  Padding(padding: EdgeInsets.only(right: 25.0, top: 18),
                    child: Text('${this.latestRole.congress} - ${this.latestRole.chamber}', textAlign: TextAlign.end, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  ),
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 25.0, top: 8),
                    child: Text('Period: ', textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent, fontSize: 18)),
                  ),
                  Padding(padding: EdgeInsets.only(right: 25.0, top: 8),
                    child: Text('${this.latestRole.startDate} - ${this.latestRole.endDate}', textAlign: TextAlign.end, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  ),
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:<Widget>[
                  Padding(padding: EdgeInsets.only(left: 25.0, top: 8),
                    child: Text('Address: ', textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent, fontSize: 18)),
                  ),
                  Flexible(child: Padding(padding: EdgeInsets.only(right: 25.0, top: 8),
                    child: Text('${this.latestRole.office}', softWrap: true, textAlign: TextAlign.end, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))),
                  ),
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 25.0, top: 8),
                    child: Text('Phone: ', textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent, fontSize: 18)),
                  ),
                  Padding(padding: EdgeInsets.only(right: 25.0, top: 8),
                    child: Text('${this.latestRole.phone}', textAlign: TextAlign.end, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  ),
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 25.0, top: 8),
                    child: Text('Bills Spons/Cospons: ', textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent, fontSize: 18)),
                  ),
                  Padding(padding: EdgeInsets.only(right: 25.0, top: 8),
                    child: Text('${this.latestRole.billsSponsored}/${this.latestRole.billsCosponsored}', textAlign: TextAlign.end, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  ),
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 25.0, top: 8),
                    child: Text('Votes With Party %: ', textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent, fontSize: 18)),
                  ),
                  Padding(padding: EdgeInsets.only(right: 25.0, top: 8),
                    child: Text('%${this.latestRole.votesWithPartyPct}', textAlign: TextAlign.end, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  ),
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 25.0, top: 8),
                    child: Text('Number Of Committees: ', textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent, fontSize: 18)),
                  ),
                  Padding(padding: EdgeInsets.only(right: 25.0, top: 8),
                    child: Text('${this.latestRole.committees.length}', textAlign: TextAlign.end, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  ),
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 25.0, top: 8),
                    child: Text('Number Of SubCommittees: ', textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent, fontSize: 18)),
                  ),
                  Padding(padding: EdgeInsets.only(right: 25.0, top: 8),
                    child: Text('${this.latestRole.subcommittees.length}', textAlign: TextAlign.end, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  ),
                ]),
            Padding(padding: EdgeInsets.only(right: 25.0, top: 18),
              child: Text('Contact', textAlign: TextAlign.center, style: TextStyle(decoration: TextDecoration.underline, fontWeight: FontWeight.bold, color: Colors.blueAccent, fontSize: 22)),
            ),
           ]
         ),
      ),
    );
  }

}