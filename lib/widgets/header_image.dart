import 'package:flutter/material.dart';

class HeaderImage extends StatelessWidget {
  const HeaderImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            // clipBehavior: Clip.,
            padding: EdgeInsets.only(
                top: 48.0, bottom: 0.0, left: 32.0, right: 32.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                // Colors.blue.shade100,
                Colors.indigo.shade900,
                Colors.blue.shade300,
                Colors.purple.shade900,
              ], 
              begin: Alignment.topLeft, end: Alignment.bottomRight,
              ),
              // border:
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 2.750,
            child: Align(
              alignment: Alignment.topLeft,
              child:
                  Image.asset("assets/images/Drcorona.png", fit: BoxFit.cover),
            ),
          ),
          Positioned(
              top: 100,
              left: MediaQuery.of(context).size.width / 2.4,
              child: Text("All you need to do \nis stay at home",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.visible))
        ],
      ),
    );
  }
}
