import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'models/CongressByStateList.dart';
import 'models/MemberCard.dart';
import 'Utils.dart';

class CongressListView extends StatefulWidget {

  final MemberData data;

  CongressListView({Key key, @required this.data}) : super(key: key);

  @override
  _CongressListView createState() => _CongressListView();
}


class _CongressListView extends State<CongressListView> {
  CongressByStateList allBaby;
  TextEditingController textFieldController = TextEditingController();
  Utils utils = new Utils();


  @override
  void initState() {
    super.initState();
    loadInit();
  }

  Future loadInit() async {

    if (this.allBaby !=null && this.allBaby.results !=null) {
      this.allBaby.results.clear();
    }
    this.allBaby = new CongressByStateList();
    this.allBaby.results = new List<MemberData>();

    for(String val in utils.getStates().values) {
      //String val = "OH";
      callApi(val);
    }

    setState(() {});

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

    if (this.allBaby !=null && this.allBaby.results !=null) {
      this.allBaby.results.clear();
      callApi(valFilter);
    }
    if (valFilter.isEmpty){
      for(String val in this.utils.getStates().values) {
        callApi(val);
      }
    }

    setState(() {});
  }

  Future callApi(String val) async {

    print('VAL: '+val);
    Response response = await http.get('https://api.propublica.org/congress/v1/members/house/'+val+'/current.json',
        headers: {"X-API-Key": "ZsyvmijWed7wQqIJ6bz8d3W1vDXXvqm1jPAQTJMi"});

    CongressByStateList resObj = CongressByStateList.fromJson(
        json.decode(response.body));
    if(resObj.results != null) {
      for (MemberData mem in resObj.results) {
        mem.state = val;
      }
      this.allBaby.results.addAll(resObj.results);
      print('list size: ' + this.allBaby.results.length.toString());
    }
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    print('Build Called');
    for(MemberData mem in this.allBaby.results){
      print(mem.lastName);
    }

    if(this.allBaby == null || this.allBaby.results.isEmpty){
      return Stack(
          children: <Widget>[
            Image.asset("assets/splash.jpg",
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
//              appBar: AppBar(
//                title: Text(widget.title),
//              ),
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
                    itemCount: this.allBaby.results.length,
                    padding: const EdgeInsets.only(top: 10.0),
                    itemBuilder: (context, index) {
                      print(index);
                      return MemberCard(this.allBaby.results[index]);
                    })
            ),
          )]);
  }
}