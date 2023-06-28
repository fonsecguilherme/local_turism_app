import 'package:flutter/material.dart';
import 'package:local_turism/commons/app_strings.dart';
import 'package:local_turism/data/model/city_model.dart';
import 'package:local_turism/data/repository/city_repository.dart';
import 'package:local_turism/style/style.dart';
import 'package:local_turism/views/pages/data_page.dart';
import 'package:local_turism/views/pages/error_page.dart';
import 'package:local_turism/views/pages/loading_page.dart';

class HomePageWidget extends StatefulWidget {
  final CityRepository repository;

  const HomePageWidget({super.key, required this.repository});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late Future<CityModel?> cities;

  @override
  void initState() {
    super.initState();
    cities = widget.repository.getAll();
  }

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: _appBar(),
          ),
          body: FutureBuilder<CityModel?>(
            future: cities,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const ErrorScreen();
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const LoadingPage();
              } else if (snapshot.hasData) {
                final citiesList = snapshot.data!.cities;
                return DataPage(cities: citiesList);
              }
              return const SizedBox();
            },
          ),
        ),
      );

  Widget _appBar() => AppBar(
        title: const Text(
          AppStrings.appBarText,
          style: Style.appBarTextStyle,
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu_rounded),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      );
}
