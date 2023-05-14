import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:mini_project/food_retrieve.dart';
import 'map.dart';
import 'main.dart';
import 'food_retrieve.dart';
import 'auth.dart';
import 'fetch.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _database = FirebaseDatabase.instance.reference();

  bool _showText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
        backgroundColor: Colors.black54,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Menu'),
              decoration: BoxDecoration(
                color: Colors.black54,
              ),
            ),
            ElevatedButton(
              child: Text('Food season'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FoodList()));
              },
            ),
            ElevatedButton(
              child: Text('Location'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Map()));
              },
            ),
            ElevatedButton(
              child: Text('View Data'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TemperatureList()));
              },
            ),
            ElevatedButton(
              child: Text('Log Out'),
              onPressed: () async {
                await _auth.signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
          ],
        ),
      ),
      body: Scaffold(
        backgroundColor: Colors.white38,
        appBar: AppBar(
          title:
          Text('Welcome To Your Greenhouse Connect System!', style: TextStyle(fontSize: 24)),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            Image.asset('assets/images/download.jfif', height: 300, width: double.infinity),
            ElevatedButton(
              child:
              Text(_showText ? 'What is a Greenhouse Connect System' : 'What is a Greenhouse Connect System'),
              onPressed: () {
                setState(() {
                  _showText = !_showText;
                });
              },
              style:
              ElevatedButton.styleFrom(primary: Colors.blueGrey, minimumSize:
              Size(200, 50),),
            ),
            if (_showText)
              Padding(
                padding:
                const EdgeInsets.all(16.0),
                child:
                Text('connected greenhouse structures occupy less land and have no sidewalls; therefore, fewer materials are needed for construction. Because there are no walls where the gutters are, more interior space is available than in several free-standing structures.',
                  textAlign:
                  TextAlign.justify,),
              ),
          ],
        ),
      ),

    );
  }
}
