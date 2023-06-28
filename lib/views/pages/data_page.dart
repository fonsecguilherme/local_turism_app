import 'package:flutter/material.dart';
import 'package:local_turism/data/model/city_model.dart';
import 'package:local_turism/views/widgets/city_card.dart';

class DataPage extends StatefulWidget {
  final List<City> cities;

  const DataPage({super.key, required this.cities});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  static const Key listViewKey = Key('listViewKey');

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: listViewKey,
      shrinkWrap: true,
      itemCount: widget.cities.length,
      itemBuilder: (context, index) => CityCard(
        key: Key(widget.cities[index].cityKey),
        city: widget.cities[index],
      ),
    );
  }
}
