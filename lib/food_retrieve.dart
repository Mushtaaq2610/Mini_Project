import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

class FoodList extends StatefulWidget {
  @override
  _FoodListState createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  String dropdownValue = 'Summer';

  List<String> winterItems = ['Orange - A juicy citrus fruit that is perfect for cold winter days',
    'Apple - Apples are a versatile fruit and can be enjoyed fresh, baked into pies, or used in various recipes.',];
  List<String> summerItems = ['Strawberry - A sweet and juicy fruit that is perfect for summer desserts',
    'Watermelon - A refreshing fruit that is great for hydrating during the summer months',];

  List<DropdownMenuItem<String>> getDropdownMenuItems(List<String> items) {
    return items.map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Tooltip(
          message: 'Description for $value',
          child: ListTile(
            leading: Icon(Icons.check),
            title: Text(value),
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.extraLightBackgroundGray,
      appBar: AppBar(
        title: Text('Food Season'),
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/images/smart-farming-smart-agriculture-iot.jpg',
            height: 350,
            width: 700,
          ),
          DropdownButton<String>(
            value: dropdownValue,
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
            items: <String>['Summer', 'Winter']
                .toSet().toList()
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Tooltip(
                  message: 'Description for $value',
                  child: Text(value, style: TextStyle(color: Colors.green)),
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 20),
          if (dropdownValue == 'Summer')
            Column(
              children: [
                Text('Summer fruits offer a quick energy boost and aid in reducing exhaustion and fatigue, which are common during the summer months.'),
                SizedBox(height: 10,),
                ...getDropdownMenuItems(summerItems),
              ],
            ),
          if (dropdownValue == 'Winter')
            Column(
              children: [
                Text('As the temperatures drop, many people start to crave the flavors of winter.'),
                SizedBox(height: 10,),
                ...getDropdownMenuItems(winterItems),
              ],
            ),
        ],
      ),
    );
  }
}
