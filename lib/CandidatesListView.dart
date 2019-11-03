import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:politipoint/models/CandidateResults.dart';
import 'package:politipoint/models/SenateRacesByState.dart';
import 'package:politipoint/models/SenateRacesList.dart';

import 'models/CongressByStateList.dart';
import 'models/CandidateCard.dart';
import 'Utils.dart';
import 'models/Candidate.dart';


class CandidatesListView extends StatefulWidget {

  final MemberData data;

  CandidatesListView({Key key, @required this.data}) : super(key: key);

  @override
  _CandidatesListView createState() => _CandidatesListView();
}


class _CandidatesListView extends State<CandidatesListView> {
  SenateRacesList allBaby;
  TextEditingController textFieldController = TextEditingController();
  Utils utils = new Utils();
  int counter = 0;


  @override
  void initState() {
    super.initState();
    loadInit();
  }

  Future loadInit() async {

    this.counter = 0;
    if (this.allBaby !=null && this.allBaby.races !=null) {
      this.allBaby.races.clear();
    }
    this.allBaby = new SenateRacesList(new List<SenateRacesByState>());
    //this.allBaby.races = new List<CandidateResults>();

    this.counter = utils.getStates().values.length;
    print('Initial Counter: ' + this.counter.toString());
    for(String val in utils.getStates().values) {
      //String val = "OH";
      this.counter--;
      callApi(val);
    }

    //setState(() {});

  }

  displayDialog(BuildContext context) {
    if(textFieldController != null){
      textFieldController.clear();
    }
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Filter By State or Name'),
            content: TextField(
              controller: textFieldController,
              decoration: InputDecoration(hintText: "Input filter..."),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('SEARCH'),
                onPressed: () {
                  //print(textFieldController.text);
                  searchFilter(textFieldController.text);
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  searchFilter(String valFilter) {

    if (this.allBaby !=null && this.allBaby.races !=null) {
      this.allBaby.races.clear();
      callApi(valFilter);
    }
    if (valFilter.isEmpty){
      this.counter = utils.getStates().length;
      for(String val in this.utils.getStates().values) {
        this.counter--;
        callApi(val);
      }
    }

    //setState(() {});
  }

  Future callApi(String val) async {

    Response response = await http.get('https://api.propublica.org/campaign-finance/v1/2020/races/'+val+'/senate.json',
        headers: {"X-API-Key": "ZsyvmijWed7wQqIJ6bz8d3W1vDXXvqm1jPAQTJMi"});

    if(response.body.contains('html')) return;
    SenateRacesByState resObj = SenateRacesByState.fromJson(
        json.decode(response.body));

    if(resObj == null || resObj.results == null) return;


    if(resObj.results != null && resObj.numResults != null) {
      if(resObj.summary != null && (resObj.summary.incumbentParty == null || resObj.summary.incumbentParty == 'null')){
        resObj.summary.incumbentParty = 'NA';
      }
      this.allBaby.races.add(resObj);
      if(this.counter <= 1 && !this.allBaby.races.isEmpty) {setState(() {});}
    }
  }


  @override
  Widget build(BuildContext context) {
    print('Build Called');

    if(this.allBaby == null || this.allBaby.races.isEmpty){
      return Stack(
          children: <Widget>[
            Image.asset("assets/splash.jpg",
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: Text("Filling Seats...",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.amber, fontSize: 22.0),
                ),
              ),
            )]);
    }

    return Stack(
        children: <Widget>[
          Image.asset("assets/background.jpg",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              // title: Text(widget.title),
              actions: <Widget>[
                IconButton(icon: Icon(Icons.search),
                  onPressed: () => displayDialog(context),
                ),
              ],
            ),
            body: Center(
                child: ListView.builder(
                    itemCount: this.allBaby.races.length,
                    padding: const EdgeInsets.only(top: 10.0),
                    itemBuilder: (context, index) {
                      return CandidateCard(this.allBaby.races[index]);
                    })
            ),
          )]);
  }
}