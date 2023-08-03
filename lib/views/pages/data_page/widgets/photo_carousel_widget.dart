import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:local_turism/data/models/city_model.dart';
import 'package:local_turism/style/app_colors.dart';
import 'package:local_turism/style/style.dart';
import 'package:local_turism/views/widgets/photo_widget.dart';

class PhotoCarouselWidget extends StatefulWidget {
  final City city;

  const PhotoCarouselWidget({super.key, required this.city});

  @override
  State<PhotoCarouselWidget> createState() => _PhotoCarouselWidgetState();
}

class _PhotoCarouselWidgetState extends State<PhotoCarouselWidget> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  static const Key carouselKey = Key('carouselKey');
  static const Key dotsKey = Key('dotsKey');

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(
          left: 12,
          right: 12,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            carouselWidget(),
            dotsWidget(),
          ],
        ),
      );

  Widget carouselWidget() => CarouselSlider.builder(
        key: carouselKey,
        carouselController: _controller,
        itemCount: widget.city.mainImages.length,
        options: CarouselOptions(
          height: 434,
          enlargeCenterPage: false,
          viewportFraction: 1.0,
          onPageChanged: (index, reason) {
            setState(() {
              _current = index;
            });
          },
        ),
        itemBuilder: (context, index, realIndex) {
          return GestureDetector(
            onTap: () {
              City city = widget.city;
              context.go('/detailScreen', extra: city);
            },
            child: Stack(
              children: [
                Positioned.fill(
                  child: PhotoWidget(
                    image: widget.city.mainImages[index],
                  ),
                ),
                photoText(),
              ],
            ),
          );
        },
      );

  Widget dotsWidget() => Row(
        key: dotsKey,
        mainAxisAlignment: MainAxisAlignment.start,
        children: widget.city.mainImages.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              width: 12.0,
              height: 12.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 18.0, horizontal: 4.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? AppColors.white
                          : AppColors.darkGrey)
                      .withOpacity(_current == entry.key ? 0.9 : 0.4)),
            ),
          );
        }).toList(),
      );

  Widget photoText() => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: const EdgeInsets.only(
            top: 4,
            bottom: 29,
            left: 21,
          ),
          constraints: const BoxConstraints(minHeight: 0.0),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black,
              ],
            ),
          ),
          alignment: Alignment.bottomLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                widget.city.name,
                style: Style.bannerCityNameStyle,
              ),
              Text(
                widget.city.cityDescription,
                style: Style.bannerCityDescriptionStyle,
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      );
}
