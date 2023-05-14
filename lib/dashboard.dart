import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:mini_project/food_retrieve.dart';
import 'fetch.dart';// Import the dart file for your other screen
import 'map.dart';
import 'main.dart';
import 'food_retrieve.dart';
import 'auth.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _database = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Menu'),
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // TODO: Add functionality for item 1
              },
            ),
            ElevatedButton(
              child: Text('Food season'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => FoodList())); // Replace `YourOtherScreen` with the name of your other screen's class
              },
            ),
            ElevatedButton(
              child: Text('Location'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Map())); // Replace `YourOtherScreen` with the name of your other screen's class
              },
            ),
            ElevatedButton(
              child: Text('View Data'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TemperatureList())); // Replace `YourOtherScreen` with the name of your other screen's class
              },
            ),
            ElevatedButton(
              child: Text('Log Out'),
              onPressed: () async {
                await _auth.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                ); // Replace `YourOtherScreen` with the name of your other screen's class
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome To Your Greenhouse Connect System!'),
            SizedBox(height: 20),
            Image.asset('assets/images/2.jpg'), // Replace `assets/images/home.png` with the path to your image asset
            SizedBox(height: 16.0), // Add some spacing between the image and text
            Text(
              'Greenhouse, also called glasshouse, building designed for the protection of tender or out-of-season plants against excessive cold or heat. In the 17th century, greenhouses were ordinary brick or timber shelters with a normal proportion of window space and some means of heating. As glass became cheaper and as more sophisticated forms of heating became available, the greenhouse evolved into a roofed and walled structure built of glass with a minimal wooden or metal skeleton. By the middle of the 19th century, the greenhouse had developed from a mere refuge from a hostile climate into a controlled environment, adapted to the needs of particular plants. A huge increase in the availability of exotic plants in the 19th century led to a vast increase in glasshouse culture in England and elsewhere. Large greenhouses are important in agriculture and horticulture and for botanical science, while smaller structures are commonly used by hobbyists, collectors, and home gardeners.',
              textAlign: TextAlign.justify,
            ),


          ],
        ),
      ),

    );
  }
}
