import 'package:flutter/material.dart';

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
    return Flexible(
      child: FittedBox(
        fit: BoxFit.cover,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Column(
            children: [
              Text(
                  "${(double.parse(count.toString()) / 1000000).toStringAsFixed(1)}M",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: color, fontSize: 32, fontWeight: FontWeight.bold)),
              Text(
                "${type.toString().toUpperCase()}",
                style: TextStyle(color: color, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
