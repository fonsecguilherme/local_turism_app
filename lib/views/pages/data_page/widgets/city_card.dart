import 'package:flutter/material.dart';
import 'package:local_turism/core/models/city_model.dart';
import 'package:local_turism/core/commons/style.dart';
import 'package:local_turism/views/pages/data_page/widgets/photo_carousel_widget.dart';
import 'package:local_turism/views/pages/data_page/widgets/tag_item.dart';

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
          style: Style.cityDetailTitleStyleSemiBold,
        ),
      );
}
