import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SharepreferenceScreen extends StatefulWidget {
  const SharepreferenceScreen({super.key});

  @override
  State<SharepreferenceScreen> createState() => _SharepreferenceScreenState();
}

class _SharepreferenceScreenState extends State<SharepreferenceScreen> {

  int value = 1;

 Future saveToPreference ()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('counter', value);
  }

  Future getToPreference()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? counter = prefs.getInt('counter');
    setState(() {
      value = counter!;
    });
  }

  List itemList = [
    {
      'id': 1,
      'item_pic': 'assets/images/dish_one.png',
      'item_name': 'Dish Name',
      'item_subname': 'Dish Subtitle',
      'special_price': '120',
      'regular_price': '180',
      'item_left': '5',
      'isFavorite': false,
      "count": 1,
    },
    {
      'id': 2,
      'item_pic': 'assets/images/dish_two.png',
      'item_name': 'Dish Name',
      'item_subname': 'Dish Subtitle',
      'special_price': '120',
      'regular_price': '190',
      'item_left': '5',
      'isFavorite': false,
      "count": 1,
    },
    {
      'id': 3,
      'item_pic': 'assets/images/dish_one.png',
      'item_name': 'Dish Name',
      'item_subname': 'Dish Subtitle',
      'special_price': '120',
      'regular_price': '180',
      'item_left': '5',
      'isFavorite': false,
      "count": 1,
    },
    {
      'id': 4,
      'item_pic': 'assets/images/dish_two.png',
      'item_name': 'Dish Name',
      'item_subname': 'Dish Subtitle',
      'special_price': '120',
      'regular_price': '180',
      'item_left': '5',
      'isFavorite': false,
      "count": 1,
    }
  ];

  Future saveJsonToSharePreference()async{
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = jsonEncode(itemList);
    prefs.setString("user", token);
  }

  Future getToJsonSharePreference()async{
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var myData = prefs.getString('user');
    dynamic token = jsonDecode(myData!);

    print("token user data");
    print(token);

  }

  @override
  void initState() {
    getToPreference();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("$value",style: TextStyle(fontSize: 20),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Flexible(
                child: InkWell(
                  onTap: (){
                    setState(() {
                      value++;
                    });
                    saveToPreference();
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.orange
                    ),
                    child: Text("Increment",style: TextStyle(color: Colors.white,fontSize: 20),),
                  ),
                ),
              ),
              Flexible(
                child: InkWell(
                  onTap: (){
                    setState(() {
                      value++;
                    });
                    saveToPreference();
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.orange
                    ),
                    child: Text("Decrement",style: TextStyle(color: Colors.white,fontSize: 20),),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
