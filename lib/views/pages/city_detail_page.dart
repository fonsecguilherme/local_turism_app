import 'package:flutter/material.dart';
import 'package:local_turism/commons/app_strings.dart';
import 'package:local_turism/data/model/city_model.dart';
import 'package:local_turism/style/app_colors.dart';
import 'package:local_turism/style/style.dart';

class CityDetailPage extends StatelessWidget {
  final City city;

  const CityDetailPage({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: _appBar(),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 12,
            right: 12,
          ),
          child: Expanded(
            child: ListView.builder(
              itemCount: city.cityFacts.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 14),
                    _cityFact(
                      city.cityFacts[index],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _appBar() => AppBar(
        title: Text(
          city.name,
          style: Style.appBarTextStyle,
        ),
        centerTitle: true,
        backgroundColor: AppColors.white,
        elevation: 0,
      );

  Widget _cityFact(CityFact fact) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            fact.title,
            style: Style.cityDetailTitleStyleBold,
          ),
          const SizedBox(height: 17),
          SizedBox(
            height: 340,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.network(
                fact.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 11),
          Text(
            fact.description,
            style: Style.cityDetailDescriptionStyle,
          ),
          const Divider(
            color: AppColors.black,
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget _bottomPictures(String picture, String cityName) {
    return Column(
      children: [
        Text(
          '${AppStrings.moreInText}${city.name}:',
          style: Style.cityDetailTitleStyleBold,
        ),
      ],
    );
  }
}
