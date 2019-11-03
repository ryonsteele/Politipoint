import 'package:flutter/material.dart';
import 'package:politipoint/Utils.dart';
import '../memberDetailsView.dart';
import 'CongressByStateList.dart';

class MemberCard extends StatefulWidget {
  final MemberData member;

  MemberCard(this.member);

  @override
  State<StatefulWidget> createState() {
    return MemberCardState(member);
  }
}

class MemberCardState extends State<MemberCard> {
  MemberData baby;
  String renderUrl;
  Utils utils = new Utils();

  MemberCardState(this.baby);

  Widget get babyCard {
    return
      new Card(
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
              MaterialPageRoute(builder: (context) => MemberDetailsView(data: this.baby)),
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
                 color: getPartyColor(baby.party),
                 child: ListTile(
                  leading: const Icon(Icons.perm_identity),
                  title: Text('${baby.name} - ${baby.state}'),
                  subtitle: Text('${baby.role}'),
                )),
                Padding(padding: EdgeInsets.only(left: 25.0, top: 15),
                  child: Text('Party: ' + utils.getParty(baby.party)),
                ),
                Padding(padding: EdgeInsets.only(left: 25.0, top: 5.0, bottom: 15),
                  child: Text('Next Election:  ${baby.nextElection}'),
                ),
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