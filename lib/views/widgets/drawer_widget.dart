import 'package:flutter/material.dart';
import 'package:local_turism/commons/app_strings.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({super.key});

  final Uri _linkedinUrl =
      Uri.parse('https://www.linkedin.com/in/devfonsecguilherme/');

  final Uri _referencesUrl = Uri.parse(
      'https://docs.google.com/document/d/1J3wZqjC-x6h4sXs93ZkHLcI-mF6GoTtrt4JAW-G2hE8/edit?usp=sharing');

  static const drawerKey = Key('drawerKey');

  @override
  Widget build(BuildContext context) {
    return Drawer(
      key: DrawerWidget.drawerKey,
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('References'),
          ),
          ListTile(
            title: const Text(AppStrings.drawerMainScreenText),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: const Text(AppStrings.drawerReferencesText),
            onTap: () => _launchUrl(_referencesUrl),
          ),
          ListTile(
            title: const Text(AppStrings.drawerAboutMeText),
            onTap: () => _launchUrl(_linkedinUrl),
          ),
        ],
      ),
    );
  }

  void _launchUrl(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not reach $url';
    }
  }
}
