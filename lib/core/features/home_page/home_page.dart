import 'package:flutter/material.dart';
import 'package:local_turism/core/commons/app_strings.dart';
import 'package:local_turism/core/features/home_page/stores/home_page_store.dart';
import 'package:local_turism/core/features/home_page/widgets/success_widget.dart';
import 'package:local_turism/core/features/widgets/custom_app_bar.dart';
import 'package:local_turism/core/features/widgets/drawer_widget.dart';
import 'package:local_turism/core/models/city_model.dart';
import 'package:local_turism/data/http_client.dart';
import 'package:local_turism/domain/city_repository.dart';

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

  final HomePageStore store =
      HomePageStore(repository: CityRepository(client: HttpClient()));

  @override
  void initState() {
    super.initState();
    store.getCities();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: DrawerWidget(),
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: CustomAppBarWidget(title: AppStrings.appBarText),
        ),
        body: SafeArea(
          child: AnimatedBuilder(
            animation:
                Listenable.merge([store.isLoading, store.state, store.error]),
            builder: (context, child) {
              if (store.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (store.error.value.isNotEmpty) {
                Center(
                  child: errorWidget(),
                );
              } else {
                return SuccessWidget(
                  cities: store.state.value.cities,
                );
              }
              return const SizedBox();
            },
          ),
        ),
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
