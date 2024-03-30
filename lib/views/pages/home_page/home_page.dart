import 'package:flutter/material.dart';
import 'package:local_turism/core/commons/app_strings.dart';
import 'package:local_turism/core/commons/style.dart';
import 'package:local_turism/core/models/city_model.dart';
import 'package:local_turism/data/http_client.dart';
import 'package:local_turism/domain/city_repository.dart';
import 'package:local_turism/views/pages/data_page/data_page.dart';
import 'package:local_turism/views/pages/loading_page/loading_page.dart';
import 'package:local_turism/views/widgets/drawer_widget.dart';

class HomePageWidget extends StatefulWidget {
  final ICityRepository _cityRepository;

  HomePageWidget({
    super.key,
    ICityRepository? cityRepository,
  }) : _cityRepository = cityRepository ??
            CityRepository(
              client: HttpClient(),
            );

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late Future<CityModel?> cities;

  @override
  void initState() {
    super.initState();
    cities = widget._cityRepository.getCities();
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
              if (snapshot.hasData) {
                final citiesList = snapshot.data!.cities;
                return DataPage(cities: citiesList);
              } else if (snapshot.hasError) {
                return errorWidget();
              } else {
                return const LoadingPage();
              }
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
                  cities = widget._cityRepository.getCities();
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
