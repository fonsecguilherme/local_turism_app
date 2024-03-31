import 'package:flutter/material.dart';
import 'package:local_turism/core/models/city_model.dart';
import 'package:local_turism/core/commons/app_colors.dart';
import 'package:local_turism/core/commons/style.dart';
import 'package:local_turism/core/features/widgets/photo_widget.dart';

class CityFactWidget extends StatelessWidget {
  final CityFact fact;

  const CityFactWidget(this.fact, {super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
        key: key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              fact.title,
              style: Style.cityDetailTitleStyleBold,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 17, bottom: 11),
              child: _cityFactImage(fact.image),
            ),
            Text(
              fact.description,
              style: Style.cityDetailDescriptionStyle,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 6.0),
              child: Divider(
                color: AppColors.black,
              ),
            ),
          ],
        ),
      );

  Widget _cityFactImage(String image) => SizedBox(
        height: 340,
        child: PhotoWidget(image: image),
      );
}
