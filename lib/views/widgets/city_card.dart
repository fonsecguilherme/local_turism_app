import 'package:flutter/material.dart';
import 'package:local_turism/data/model/city_model.dart';
import 'package:local_turism/views/widgets/photo_carousel_widget.dart';
import 'package:local_turism/views/widgets/tag_item.dart';

class CityCard extends StatelessWidget {
  final City city;

  const CityCard({
    super.key,
    required this.city,
  });

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title(),
          PhotoCarouselWidget(city: city),
          TagItemWidget(tagsList: city.tags),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Divider(),
          ),
        ],
      );

  Widget title() => Padding(
        padding: const EdgeInsets.only(
          top: 25,
          left: 12,
        ),
        child: Text(
          city.title,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
      );
}
