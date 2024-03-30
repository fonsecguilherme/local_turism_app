import 'package:flutter/material.dart';
import 'package:local_turism/core/commons/app_strings.dart';
import 'package:local_turism/core/commons/style.dart';

class CityTemperatureWidget extends StatelessWidget {
  const CityTemperatureWidget({
    super.key,
    required this.degrees,
  });

  final int degrees;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Center(
          child: Text(
            '$degrees${AppStrings.degreesCelsiusText}',
            style: Style.appBarTemperatureTextStyle,
          ),
        ),
      );
}
