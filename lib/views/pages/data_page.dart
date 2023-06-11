import 'package:flutter/material.dart';
import 'package:local_turism/data/model/city_model.dart';
import 'package:local_turism/views/widgets/city_card.dart';

class DataPage extends StatefulWidget {
  final AsyncSnapshot<CityModel?> snapshot;

  const DataPage({super.key, required this.snapshot});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  @override
  Widget build(BuildContext context) {
    List<City> cities = widget.snapshot.data!.cities;

    return ListView.builder(
      shrinkWrap: true,
      itemCount: cities.length,
      itemBuilder: (context, index) => CityCard(
        city: cities[index],
      ),
    );
  }
}
