import 'package:flutter/material.dart';
import 'package:local_turism/data/model/city_model.dart';
import 'package:local_turism/style/style.dart';

class CityDetailPage extends StatelessWidget {
  final City city;

  const CityDetailPage({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            city.name,
            style: Style.appBarTextStyle,
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Container(
          color: Colors.amber,
        ),
      ),
    );
  }
}
