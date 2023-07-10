import 'package:flutter/material.dart';
import 'package:local_turism/commons/app_strings.dart';
import 'package:local_turism/data/model/city_model.dart';
import 'package:local_turism/style/app_colors.dart';
import 'package:local_turism/style/style.dart';
import 'package:local_turism/views/pages/city_detail_page/widgets/city_fact_widget.dart';
import 'package:local_turism/views/widgets/photo_widget.dart';

class CityDetailPage extends StatefulWidget {
  final City city;

  const CityDetailPage({super.key, required this.city});

  static Key appBarKey = const Key('appBar');
  static Key cityFactKey = const Key('cityFact');
  static Key bottomWidgetKey = const Key('bottomWidget');

  @override
  State<CityDetailPage> createState() => _CityDetailPageState();
}

class _CityDetailPageState extends State<CityDetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: _appBar(),
        ),
        body: _body(),
      ),
    );
  }

  Widget _appBar() => AppBar(
        key: CityDetailPage.appBarKey,
        title: Text(
          widget.city.name,
          style: Style.appBarTextStyle,
        ),
        centerTitle: true,
        backgroundColor: AppColors.white,
        elevation: 0,
      );

  Widget _body() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ListView.builder(
          itemCount: widget.city.cityFacts.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 14),
                CityFactWidget(widget.city.cityFacts[index],
                    key: CityDetailPage.cityFactKey),
                Visibility(
                  visible: _isLastitem(widget.city.cityFacts, index),
                  child: Column(
                    key: CityDetailPage.bottomWidgetKey,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _bottomText(widget.city.name),
                      _photoSlider(context, widget.city.extraImages),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      );

  Widget _bottomText(String cityName) {
    return Column(
      children: [
        Text(
          '${AppStrings.moreInText}${widget.city.name}:',
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
