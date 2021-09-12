import 'package:flutter/material.dart';

class CurrentStats extends StatelessWidget {
  const CurrentStats({
    Key key,
    this.cases,
    this.recovered,
    this.deaths,
  }) : super(key: key);

  final cases;
  final recovered;
  final deaths;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: (cases == null || deaths == null || recovered == null)
          ? Center(child: CircularProgressIndicator())
          : Container(
              // width: double.infinity,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      offset: const Offset(
                        8.0,
                        14.0,
                      ),
                      blurRadius: 18.0,
                      spreadRadius: 0.0,
                    ), //BoxShadow:
                  ],
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(32), right: Radius.circular(32))),
              clipBehavior: Clip.antiAlias,
              child: Card(
                elevation: 1,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(12), right: Radius.circular(12)),
                ),
                // clipBehavior: Clip.hardEdge,
                margin: EdgeInsets.all(16.0),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      StatCount(
                        count: cases,
                        color: Colors.orange,
                        type: "cases",
                      ),
                      StatCount(
                        count: deaths,
                        color: Colors.red,
                        type: "deaths",
                      ),
                      StatCount(
                        count: recovered,
                        color: Colors.green,
                        type: "recovered",
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

class StatCount extends StatelessWidget {
  const StatCount({
    Key key,
    @required this.count,
    @required this.color,
    @required this.type,
  }) : super(key: key);

  final count;
  final type;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.cover,
      child: Column(
        children: [
          Text(
              "${count.toString().substring(0, count.toString().length > 4 ? 4 : count.toString().length)}",
              style: TextStyle(
                  color: color,
                  fontSize: 32,
                  fontWeight: FontWeight.bold)),
          Text(
            "${type.toString().toUpperCase()}",
            style: TextStyle(color: color, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
