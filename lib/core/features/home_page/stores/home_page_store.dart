import 'package:flutter/material.dart';
import 'package:local_turism/core/features/home_page/home_page_state.dart';
import 'package:local_turism/data/http_exceptions.dart';
import 'package:local_turism/domain/city_repository.dart';

class HomePageStore extends ValueNotifier<HomePageState> {
  final ICityRepository repository;

  HomePageStore({
    required this.repository,
  }) : super(LoadingHomePageState());

  Future getCities() async {
    try {
      final result = await repository.getCities();

      if (result != null) {
        value = FetchedHomePagestate(
          cities: result.cities,
        );
      }
    } on NotFoundException catch (e) {
      value = ErrorHomePageState(errorMessage: e.message);
    } catch (e) {
      value = ErrorHomePageState(errorMessage: e.toString());
    }
  }
}
