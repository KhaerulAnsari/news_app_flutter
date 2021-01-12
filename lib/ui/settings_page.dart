import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app_flutter/widgets/platform_widget.dart';

class SettingsPage extends StatelessWidget {
  static const String settingsTitle = "Settings";
  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(settingsTitle),
      ),
      body: _buildList(context),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(settingsTitle),
      ),
      child: _buildList(context),
    );
  }

  Widget _buildList(BuildContext context) {
    return ListView(
      children: <Widget>[
        Material(
          child: ListTile(
            title: Text("Dark Theme"),
            trailing: Switch.adaptive(
                value: false,
                onChanged: (value) {
                  defaultTargetPlatform == TargetPlatform.iOS
                      ? showCupertinoDialog(
                          context: context,
                          builder: (context) {
                            return CupertinoAlertDialog(
                              title: Text("Cominf Soon!"),
                              content: Text("This Feature will be Coming Soon!"),
                              actions: [
                                CupertinoDialogAction(
                                  child: Text("Ok"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          },
                        )
                      : showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Coming Soon!"),
                              content:
                                  Text("This feature will be coming soon!"),
                              actions: [
                                FlatButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Ok"),
                                ),
                              ],
                            );
                          });
                }),
          ),
        ),
      ],
    );
  }
}
