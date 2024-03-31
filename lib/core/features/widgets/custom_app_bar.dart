import 'package:flutter/material.dart';
import 'package:local_turism/core/commons/app_strings.dart';
import 'package:local_turism/core/commons/style.dart';

class CustomAppBarWidget extends StatelessWidget {
  final String title;
  final List<Widget>? actions;

  const CustomAppBarWidget({super.key, required this.title, this.actions});

  @override
  Widget build(BuildContext context) => AppBar(
        title: const Text(
          AppStrings.appBarText,
          style: Style.appBarTextStyle,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: actions,
      );
}
