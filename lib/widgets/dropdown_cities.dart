import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/stats_model.dart';
import './current_stats.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DropDownCities extends StatefulWidget {
  @override
  _DropDownCitiesState createState() => _DropDownCitiesState();
}

class _DropDownCitiesState extends State<DropDownCities> {
  String _chosenCity = "World";

  List<String> cities = <String>[
    "World",
    "India",
    "Italy",
    "UK",
    "Germany",
    "China",
    "Russia",
    "USA",
  ];
  Stats stats = Stats(cases: null, deaths: null, recovered: null);
  void getStats(String country) async {
    var url = Uri.parse(
        "https://coronavirus-19-api.herokuapp.com/countries/$country");
    var response = await http.get(url);

    var responseData = jsonDecode(response.body);
    print("$responseData");

    setState(() {
      Stats obj = new Stats(
        cases: responseData["cases"],
        deaths: responseData["deaths"],
        recovered: responseData["recovered"],
      );
      stats = obj;
    });
  }

  @override
  void initState() {
    super.initState();
    getStats(_chosenCity);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade300,
                width: 1.5,
              ),
              borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(32), right: Radius.circular(32)),
            ),
            margin: EdgeInsets.all(16.0),
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isExpanded: true,
                elevation: 0,
                value: _chosenCity,
                iconEnabledColor: Colors.blue,
                hint: Text(
                  "$_chosenCity",
                  style: TextStyle(color: Colors.blue),
                ),
                items: cities.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (val) {
                  setState(() {
                    _chosenCity = val;
                    print(_chosenCity);
                    getStats(_chosenCity);
                  });
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Case Update",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      letterSpacing: 1.2,
                    )),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Newest update: ${DateFormat().add_yMMMEd().format(DateTime.now())}",
                  style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 13,
                      letterSpacing: 0.4),
                )
              ],
            ),
          ),
          CurrentStats(
            cases: stats.cases,
            recovered: stats.recovered,
            deaths: stats.deaths,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text("Spread of Virus",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  letterSpacing: 1.2,
                )),
          ),
          Container(
              height: 200,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              width: double.infinity,
              child: new Image.asset(
                "assets/images/map.png",
                fit: BoxFit.contain,
              ))
        ],
      ),
    );
  }
}
