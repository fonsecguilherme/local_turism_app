import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:local_turism/core/commons/app_strings.dart';
import 'package:local_turism/core/features/home_page/stores/home_page_store.dart';
import 'package:local_turism/core/features/home_page/widgets/success_widget.dart';
import 'package:local_turism/core/features/widgets/custom_app_bar.dart';
import 'package:local_turism/core/features/widgets/drawer_widget.dart';

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
    final getIt = GetIt.instance;

    store = getIt<HomePageStore>();

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
          child: AnimatedBuilder(
            animation: Listenable.merge([
              store.isLoading,
              store.state,
              store.error,
            ]),
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
              onPressed: () {},
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
