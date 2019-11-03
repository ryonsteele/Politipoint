import 'package:flutter/material.dart';
import 'package:politipoint/Utils.dart';
import 'package:politipoint/models/CandidateResults.dart';
import 'package:politipoint/models/SenateRacesByState.dart';
import 'package:politipoint/candidateDetailsView.dart';


class CandidateCard extends StatefulWidget {
//  final CandidateResults member;
  final SenateRacesByState member;

  CandidateCard(this.member);

  @override
  State<StatefulWidget> createState() {
    return CandidateCardState(member);
  }
}

class CandidateCardState extends State<CandidateCard> {
  SenateRacesByState baby;
  String renderUrl;
  Utils utils = new Utils();

  CandidateCardState(this.baby);


  Widget get babyCard {
    if(baby.results == null){return null;}
    //print(this.baby.toJson());
    return new Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              side: BorderSide(width: 5, color: Colors.black)),
          color: const Color(0xffffffce),
          margin: const EdgeInsets.only(top: 25.0, left: 75.0, right: 75.0, bottom: 25.0),
          child: InkWell(
              splashColor: Colors.grey,
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CandidateDetailsView(data: this.baby)),
                );
              },


              child: new Padding(
                  padding: const EdgeInsets.only(bottom: 1.0, top: 5.0),
                  child: Column(
                    //mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,

                      children: <Widget>[
                        Container(
                            color: Colors.greenAccent,
                            child: ListTile(
                              leading: const Icon(Icons.perm_identity),
                              title: Text('${baby.state} - Senate Race ${baby.cycle}'),
                              subtitle: Text('Candidate Count: ${baby.summary.candidates}'),
                            )),
                        new Image.asset('assets/cong_seal.png'),
                      ]))));
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child:  babyCard,
    );
  }



  Color getPartyColor(String party){

    if(party == 'D'){
      return const Color(0xff6A7CF0);
    }else if(party == 'R'){
      return const Color(0xffE04B4B);
    } else{
      return const Color(0xffB44DE7);
    }
  }


}