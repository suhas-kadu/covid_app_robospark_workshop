import 'package:flutter/material.dart';
import '../widgets/stat_count.dart';

class CurrentStats extends StatelessWidget {
  const CurrentStats({
    Key key,
    @required this.cases,
    @required this.deaths,
    @required this.recovered,
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
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      offset: const Offset(
                        8.0,
                        4.0,
                      ),
                      blurRadius: 18.0,
                      spreadRadius: 0.0,
                    ),
                  ],
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(32), right: Radius.circular(32))),
              clipBehavior: Clip.antiAlias,
              child: Card(
                elevation: 0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(12), right: Radius.circular(12)),
                ),
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
