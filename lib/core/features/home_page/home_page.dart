import 'package:flutter/material.dart';
import 'package:local_turism/core/commons/app_strings.dart';
import 'package:local_turism/core/features/home_page/home_page_state.dart';
import 'package:local_turism/core/features/home_page/stores/home_page_store.dart';
import 'package:local_turism/core/features/home_page/widgets/success_widget.dart';
import 'package:local_turism/core/features/widgets/custom_app_bar.dart';
import 'package:local_turism/core/features/widgets/drawer_widget.dart';
import 'package:local_turism/service_locator.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({
    super.key,
  });

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageStore store;

  @override
  void initState() {
    super.initState();

    store = ServiceLocator.instance.get<HomePageStore>();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await store.getCities();
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: DrawerWidget(),
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: CustomAppBarWidget(title: AppStrings.appBarText),
        ),
        body: SafeArea(
            child: ValueListenableBuilder(
          valueListenable: store,
          builder: (context, value, child) {
            if (value is ErrorHomePageState) {
              return errorWidget(value.errorMessage);
            } else if (value is FetchedHomePagestate) {
              return SuccessWidget(cities: value.cities);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        )),
      );

  Widget errorWidget(String message) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                store.getCities();
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
