import 'package:flutter/material.dart';
import 'package:politipoint/models/Candidate.dart';
import 'package:politipoint/models/SenateRacesByState.dart';
import 'package:politipoint/models/CandidateResults.dart';
import 'Utils.dart';


class CandidateDetailsView extends StatefulWidget {

  final SenateRacesByState data;

  CandidateDetailsView({Key key, @required this.data}) : super(key: key);

  @override
  _CandidateDetailsView createState() => _CandidateDetailsView(this.data);
}


class _CandidateDetailsView extends State<CandidateDetailsView> {

  List<String> litems;
  SenateRacesByState data;

  _CandidateDetailsView(SenateRacesByState data) {
    this.data = data;
     loadInit();
  }

  Future loadInit() async {
    Utils utils = new Utils();

    litems = new List<String>();

    for(CandidateResults can in this.data.results){
      //print(this.data.toJson());
      String val = '  ${can.candidate.party} -  \t\t\t   ${can.candidate.name} ' ;
      litems.add(val);
    }

  }


  @override
  Widget build(BuildContext context) {

    if(this.data == null){
      return new Container();
    }


    return Scaffold(
      appBar: AppBar(
        title: Text('${this.data.state} Senate Race Details'),
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
                      child: Text('Cycle: ', textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent, fontSize: 18)),
                    ),
                    Padding(padding: EdgeInsets.only(right: 25.0, top: 25),
                      child: Text('${this.data.cycle}', textAlign: TextAlign.end, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    ),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(left: 25.0, top: 8),
                      child: Text('End Date: ', textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent, fontSize: 18)),
                    ),
                    Padding(padding: EdgeInsets.only(right: 25.0, top: 8),
                      child: Text('${this.data.summary.endDate}', textAlign: TextAlign.end, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    ),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(left: 25.0, top: 8),
                      child: Text('Reciepts Total: ', textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent, fontSize: 18)),
                    ),
                    Padding(padding: EdgeInsets.only(right: 25.0, top: 8),
                      child: Text('${this.data.summary.receiptsTotal}', textAlign: TextAlign.end, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    ),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(left: 25.0, top: 8),
                      child: Text('Incumbent Party: ', textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent, fontSize: 18)),
                    ),
                    Padding(padding: EdgeInsets.only(right: 25.0, top: 8),
                      child: Text('${this.data.summary.incumbentParty}', textAlign: TextAlign.end, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    ),
                  ]),
              Padding(padding: EdgeInsets.only(right: 25.0, top: 18),
                child: Text('Candidates', textAlign: TextAlign.center, style: TextStyle(decoration: TextDecoration.underline, fontWeight: FontWeight.bold, color: Colors.blueAccent, fontSize: 22)),
              ),
              Padding(padding: EdgeInsets.only(right: 25.0, top: 18),
                child: ListView.builder(
                    itemCount: this.data.results.length,
                    padding: const EdgeInsets.only(top: 10.0),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      //print(index);
                      return new Text(litems[index], textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18));
                    }),
              ),
            ]
        ),
      ),
    );
  }

}
