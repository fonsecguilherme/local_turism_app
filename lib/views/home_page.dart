import 'package:flutter/material.dart';
import 'package:local_turism/data/model/city_model.dart';
import 'package:local_turism/data/repository/city_repository.dart';
import 'package:local_turism/style/style.dart';
import 'package:local_turism/views/pages/data_page.dart';
import 'package:local_turism/views/pages/loading_page.dart';

class MyHomePageWidget extends StatefulWidget {
  const MyHomePageWidget({super.key});

  @override
  State<MyHomePageWidget> createState() => _MyHomePageWidgetState();
}

class _MyHomePageWidgetState extends State<MyHomePageWidget> {
  late Future<CityModel?> cities;
  CityRepository repository = CityRepository();

  @override
  void initState() {
    super.initState();
    cities = repository.getAll();
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
                return const Text('Ops! Não consegui carregar os dados!');
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const LoadingPage();
              } else if (snapshot.hasData) {
                return DataPage(snapshot: snapshot);
              }
              return const SizedBox();
            },
          ),
        ),
      );

  Widget _appBar() => AppBar(
        title: const Text(
          'text',
          style: Style.appBarTextStyle,
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu_rounded),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.refresh),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      );
}
