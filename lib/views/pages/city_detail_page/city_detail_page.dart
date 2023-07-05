import 'package:flutter/material.dart';
import 'package:local_turism/commons/app_strings.dart';
import 'package:local_turism/data/model/city_model.dart';
import 'package:local_turism/style/app_colors.dart';
import 'package:local_turism/style/style.dart';
import 'package:local_turism/views/widgets/photo_widget.dart';

class CityDetailPage extends StatelessWidget {
  final City city;

  const CityDetailPage({super.key, required this.city});

  static Key appBarKey = const Key('appBar');
  static Key cityFactKey = const Key('cityFact');
  static Key bottomWidgetKey = const Key('bottomWidget');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: _appBar(),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
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
                  Visibility(
                    visible: _isLastitem(city.cityFacts, index),
                    child: Column(
                      key: bottomWidgetKey,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _bottomText(city.name),
                        _photoSlider(context, city.extraImages),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _appBar() => AppBar(
        key: appBarKey,
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
      key: cityFactKey,
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
  }

  Widget _cityFactImage(String image) => SizedBox(
        height: 340,
        child: PhotoWidget(image: image),
      );

  Widget _bottomText(String cityName) {
    return Column(
      children: [
        Text(
          '${AppStrings.moreInText}${city.name}:',
          style: Style.cityDetailTitleStyleBold,
        ),
      ],
    );
  }

  Widget _photoSlider(BuildContext context, List<String> photosList) {
    return Padding(
      padding: const EdgeInsets.only(top: 13, bottom: 47),
      child: SizedBox(
        height: 140,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: photosList.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: SizedBox(
                width: 140,
                height: 140,
                child: PhotoWidget(
                  image: photosList[index],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  bool _isLastitem(List<CityFact> list, int index) {
    if (list[index] == list.last) {
      return true;
    } else {
      return false;
    }
  }
}
