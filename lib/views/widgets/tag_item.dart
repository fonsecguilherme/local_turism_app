import 'package:flutter/material.dart';
import 'package:local_turism/style/app_colors.dart';
import 'package:local_turism/style/style.dart';

class TagItemWidget extends StatelessWidget {
  final List<String> tagsList;

  const TagItemWidget({
    super.key,
    required this.tagsList,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: tagsList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Container(
              height: 22,
              decoration: const BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadiusDirectional.all(
                  Radius.circular(8),
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    tagsList[index],
                    textAlign: TextAlign.center,
                    style: Style.tagStyle,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
