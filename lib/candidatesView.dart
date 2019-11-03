import 'package:flutter/material.dart';
import 'Utils.dart';
import 'CandidatesListView.dart';

class CandidatesView extends StatefulWidget {
  CandidatesView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CandidatesView createState() => _CandidatesView();
}

class _CandidatesView extends State<CandidatesView> {
  Utils utils = new Utils();


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

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
              title: Text("Politipoint - Races"),
            ),
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      MaterialButton(
                        height: 45.0,
                        minWidth: 210.0,
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.yellowAccent,
                        child: new Text("Senate Races"),
                        onPressed: () async { Navigator.push( context,
                          MaterialPageRoute(builder: (context) => CandidatesListView()),);
                        },
                        splashColor: Colors.redAccent,
                      ),
//                      SizedBox(height: 40),
//                      MaterialButton(
//                        height: 45.0,
//                        minWidth: 210.0,
//                        color: Theme.of(context).primaryColor,
//                        textColor: Colors.yellowAccent,
//                        child: new Text("Senate"),
//                        onPressed: () async { Navigator.push( context,
//                          MaterialPageRoute(builder: (context) => SenateListView()),);
//                        },
//                        splashColor: Colors.redAccent,
//                      ),
//                      SizedBox(height: 40),
//                      MaterialButton(
//                        height: 45.0,
//                        minWidth: 210.0,
//                        color: Theme.of(context).primaryColor,
//                        textColor: Colors.yellowAccent,
//                        child: new Text("Congress"),
//                        onPressed: () async { Navigator.push( context,
//                          MaterialPageRoute(builder: (context) => CongressListView()),);
//                        },
//                        splashColor: Colors.redAccent,
//                      ),
                    ])
            ),
          )]);
  }
}