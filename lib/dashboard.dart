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
        body: Stack(
          children: [
            Center(
              child:
              Image.asset('assets/images/download.jfif', height: 350, width: 700),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: ElevatedButton(
                    child:
                    Text(_showText ? 'Hide Description' : 'Show Description'),
                    onPressed: () {
                      setState(() {
                        _showText = !_showText;
                      });
                    },
                    style:
                    ElevatedButton.styleFrom(primary: Colors.blueGrey, minimumSize:
                    Size(200, 50),),
                  ),
                ),
                if (_showText)
                  Padding(
                    padding:
                    const EdgeInsets.all(16.0),
                    child:
                    Text('Greenhouse, also called glasshouse, building designed for the protection of tender or out-of-season plants against excessive cold or heat. In the 17th century, greenhouses were ordinary brick or timber shelters with a normal proportion of window space and some means of heating. As glass became cheaper and as more sophisticated forms of heating became available, the greenhouse evolved into a roofed and walled structure built of glass with a minimal wooden or metal skeleton. By the middle of the 19th century, the greenhouse had developed from a mere refuge from a hostile climate into a controlled environment, adapted to the needs of particular plants. A huge increase in the availability of exotic plants in the 19th century led to a vast increase in glasshouse culture in England and elsewhere. Large greenhouses are important in agriculture and horticulture and for botanical science, while smaller structures are commonly used by hobbyists, collectors, and home gardeners.',
                      textAlign:
                      TextAlign.justify,),
                  ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
