import 'package:flutter/material.dart';
import 'package:local_turism/data/model/city_model.dart';
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
            left: 24,
            right: 24,
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: city.cityFacts.length,
                  itemBuilder: (context, index) => cityFact(
                    city.cityFacts[index],
                  ),
                ),
              ),
            ],
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
        backgroundColor: Colors.white,
        elevation: 0,
      );

  Widget cityFact(CityFact fact) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            fact.title,
            style: Style.cityDetailTitleStyleBold,
          ),
          Container(
            height: 340,
            color: Colors.amber,
          ),
          //Text(fact.image),
          Text(
            fact.description,
            style: Style.cityDetailDescriptionStyle,
          ),
        ],
      ),
    );
  }
}
