import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:local_turism/commons/app_strings.dart';
import 'package:local_turism/data/repository/city_repository.dart';

class ErrorPage extends StatefulWidget {
  final CityRepository cityRepository;

  const ErrorPage({super.key, required this.cityRepository});

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(AppStrings.errorMessage),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              setState(() {
                widget.cityRepository.getAll();
                context.goNamed('/');
              });
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(8),
            ),
            child: const Icon(Icons.refresh_rounded),
          )
        ],
      ),
    );
  }
}
