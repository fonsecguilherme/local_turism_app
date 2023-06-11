import 'package:flutter/material.dart';
import 'package:local_turism/data/model/city_model.dart';
import 'package:local_turism/style/style.dart';

class CityCard extends StatelessWidget {
  final City city;

  const CityCard({
    super.key,
    required this.city,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(
          top: 35,
          left: 24,
          right: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 434,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  imageBanner(),
                  photoText(),
                ],
              ),
            ),

            //! TODO: Inserir uma listview com as fotos no widget rectangle picture
            //listViewWidget()
            //rectanglePicture()
          ],
        ),
      );

  Widget imageBanner() => Image.network(
        city.mainImage,
        fit: BoxFit.cover,
      );

  Widget photoText() => Padding(
        padding: const EdgeInsets.only(
          bottom: 29,
          left: 21,
        ),
        child: Container(
          alignment: Alignment.bottomLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                city.name,
                style: Style.bannerCityNameStyle,
              ),
              Text(
                city.cityDescription,
                style: Style.bannerCityDescriptionStyle,
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      );

  //* widgets que estava usando para testar, não finalizados
  Widget listViewWidget() => Container(
        height: 106,
        width: 320,
        color: Colors.red,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 2,
          itemBuilder: (context, index) => const Text('text'),
        ),
      );

  Widget rectanglePicture() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 24,
        bottom: 38,
        right: 12,
      ),
      child: UnconstrainedBox(
        child: Container(
          color: Colors.red,
          width: 320,
          height: 106,
          child: const Text('text'),
        ),
      ),
    );
  }
}
