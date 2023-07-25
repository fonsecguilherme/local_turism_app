import 'package:flutter/material.dart';
import 'package:local_turism/commons/app_strings.dart';
import 'package:local_turism/data/model/city_model.dart';
import 'package:local_turism/data/repository/city_repository.dart';
import 'package:local_turism/style/style.dart';
import 'package:local_turism/views/pages/data_page/data_page.dart';
import 'package:local_turism/views/pages/loading_page/loading_page.dart';
import 'package:local_turism/views/widgets/drawer_widget.dart';

class HomePageWidget extends StatefulWidget {
  final CityRepository _cityRepository;

  HomePageWidget({super.key, CityRepository? cityRepository})
      : _cityRepository = cityRepository ?? CityRepository();

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late Future<CityModel?> cities;

  @override
  void initState() {
    super.initState();
    cities = widget._cityRepository.getAll();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: DrawerWidget(),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: _appBar(),
        ),
        body: SafeArea(
          child: FutureBuilder<CityModel?>(
            future: cities,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return errorWidget();
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
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      );

  Widget errorWidget() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              AppStrings.errorMessage,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  cities = widget._cityRepository.getAll();
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
