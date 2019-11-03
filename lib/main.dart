
import 'package:flutter/material.dart';
import 'Utils.dart';
import 'senateListView.dart';
import 'congressListView.dart';
import 'candidatesView.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Politipoint',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(title: 'Politipoint'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        title: Text(widget.title),
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
                child: new Text("Candidates"),
                onPressed: () async { Navigator.push( context,
                  MaterialPageRoute(builder: (context) => CandidatesView()),);
                },
                splashColor: Colors.redAccent,
              ),
              SizedBox(height: 40),
              MaterialButton(
                height: 45.0,
                minWidth: 210.0,
                color: Theme.of(context).primaryColor,
                textColor: Colors.yellowAccent,
                child: new Text("Senate"),
                onPressed: () async { Navigator.push( context,
                  MaterialPageRoute(builder: (context) => SenateListView()),);
                },
                splashColor: Colors.redAccent,
              ),
             SizedBox(height: 40),
              MaterialButton(
                height: 45.0,
                minWidth: 210.0,
                color: Theme.of(context).primaryColor,
                textColor: Colors.yellowAccent,
                child: new Text("Congress"),
                onPressed: () async { Navigator.push( context,
                  MaterialPageRoute(builder: (context) => CongressListView()),);
                 },
                splashColor: Colors.redAccent,
              ),
        ])
      ),
    )]);
  }
}
