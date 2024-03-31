import 'package:flutter/material.dart';

class LoadingTemperatureWidget extends StatelessWidget {
  const LoadingTemperatureWidget({super.key});

  @override
  Widget build(BuildContext context) => const Padding(
        padding: EdgeInsets.only(right: 8.0),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
}
