import 'package:flutter/material.dart';
import 'package:local_turism/core/commons/app_strings.dart';
import 'package:local_turism/core/features/widgets/custom_app_bar.dart';
import 'package:local_turism/core/models/city_model.dart';
import 'package:local_turism/core/commons/style.dart';
import 'package:local_turism/core/features/city_detail_page/widgets/city_fact_widget.dart';
import 'package:local_turism/core/features/widgets/photo_widget.dart';
import 'package:local_turism/core/features/widgets/temperature_widget.dart';

class CityDetailPage extends StatefulWidget {
  final City city;

  const CityDetailPage({
    super.key,
    required this.city,
  });

  static Key appBarKey = const Key('appBar');
  static Key cityFactKey = const Key('cityFact');
  static Key bottomWidgetKey = const Key('bottomWidget');
  static Key horizontalListViewKey = const Key('horizontalListViewKey');
  static Key verticalListViewKey = const Key('verticalListViewKey');
  static Key expandedImageKey = const Key('expandedImageKey');

  @override
  State<CityDetailPage> createState() => _CityDetailPageState();
}

class _CityDetailPageState extends State<CityDetailPage> {
  int _index = 0;
  String _image =
      'http://experimentemaceio.com.br/wp-content/uploads/2022/05/17-11-2021-Artesanato-Pajucara-Turismo-SEMTEL-Por-Emile-Valoes_3.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: CustomAppBarWidget(
          title: widget.city.name,
          actions: [
            TemperatureWidget(woeid: widget.city.woeid),
          ],
        ),
      ),
      body: _body(),
    );
  }


  Widget _body() => SafeArea(
        child: IndexedStack(
          index: _index,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ListView.builder(
                key: CityDetailPage.verticalListViewKey,
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
            ),
            _expandedImageWidget(),
          ],
        ),
      );

  Widget _expandedImageWidget() => Container(
        key: CityDetailPage.expandedImageKey,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 400,
              maxWidth: 400,
            ),
            child: Image.network(
              _image,
            ),
          ),
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
          key: CityDetailPage.horizontalListViewKey,
          scrollDirection: Axis.horizontal,
          itemCount: photosList.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: GestureDetector(
                onLongPress: () {
                  setState(() {
                    _index = 1;
                    _image = photosList[index];
                  });
                },
                onLongPressEnd: (details) {
                  setState(() {
                    _index = 0;
                  });
                },
                child: SizedBox(
                  width: 140,
                  height: 140,
                  child: PhotoWidget(
                    key: Key('photo$index'),
                    image: photosList[index],
                  ),
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
