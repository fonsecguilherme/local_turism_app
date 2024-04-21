import 'package:local_turism/data/models/city_model.dart';

abstract class HomePageState {}

class InitialHomePageState extends HomePageState {}

class LoadingHomePageState extends HomePageState {}

class ErrorHomePageState extends HomePageState {
  final String errorMessage;

  ErrorHomePageState({required this.errorMessage});
}

class FetchedHomePagestate extends HomePageState {
  final List<City> cities;

  FetchedHomePagestate({required this.cities});
}
