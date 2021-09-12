import 'package:flutter/material.dart';
import '../widgets/header_image.dart';
import '../widgets/dropdown_cities.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderImage(),
              DropDownCities(),
            ],
          ),
        ),
      ),
    );
  }
}
