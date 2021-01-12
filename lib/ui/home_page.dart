import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_flutter/ui/article_list_page.dart';
import 'package:news_app_flutter/ui/settings_page.dart';
import 'package:news_app_flutter/widgets/platform_widget.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNavIndex = 0;
  static const String _headlineText = "Headline";

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }

  List<BottomNavigationBarItem> _bottomNavbarItems = [
    BottomNavigationBarItem (
      icon: Icon(Platform.isIOS ? CupertinoIcons.news : Icons.public),
      title: Text(_headlineText),
    ),
    BottomNavigationBarItem (
      icon: Icon(Platform.isIOS ? CupertinoIcons.settings : Icons.settings),
      title: Text(SettingsPage.settingsTitle)
    ),
  ];

  void _onBottomNavTapped(int index) {
    setState(() {
      _bottomNavIndex = index;
    });
  }

  List<Widget> _listWidget = [
    ArticleListPage(),
    SettingsPage(),
  ];

  Widget _buildIos(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: _bottomNavbarItems,
      ),
      tabBuilder: (context,index) {
        return _listWidget[index];
      },
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      body: _listWidget[_bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavIndex,
        items: _bottomNavbarItems,
        onTap: _onBottomNavTapped,
      ),
      );
  }

}
