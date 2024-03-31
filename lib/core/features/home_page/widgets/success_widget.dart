import 'package:flutter/material.dart';
import 'package:local_turism/core/models/city_model.dart';
import 'package:local_turism/core/features/home_page/widgets/city_card.dart';

class SuccessWidget extends StatelessWidget {
  final List<City> cities;
  const SuccessWidget({
    super.key,
    required this.cities,
  });

  static const Key listViewKey = Key('listViewKey');

  @override
  Widget build(BuildContext context) => ListView.builder(
        key: listViewKey,
        shrinkWrap: true,
        itemCount: cities.length,
        itemBuilder: (context, index) => CityCard(
          key: Key(cities[index].cityKey),
          city: cities[index],
        ),
      );
}
