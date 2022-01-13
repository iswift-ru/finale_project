import 'package:flutter/material.dart';
import 'package:finale_project/navigation.dart';
import 'package:finale_project/themes/global_theme.dart';

import 'auth.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  var appBar = ApplicationBar();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
          appBar: appBar.appBar(context),
          drawer: navDrawer(context),
          body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/users.png'),
                  alignment: Alignment.topCenter,
                  fit: BoxFit.fitWidth,
                  opacity: 0.6,
                )
            ),
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(children: [
                const SizedBox(height: 200,),
                Text("Настройки",
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline2,),
                const SizedBox(height: 60,),
                SwitchListTile(
                  value: themeSett.themeBrightness,
                  onChanged: (bool newValue) {
                    setState(() {
                      themeSett.themeBrightness = !themeSett.themeBrightness;
                      isLightTheme.add(!newValue);
                    });
                  },
                  title: const Text('Тёмная тема'),
                ),
                const SizedBox(height: 60,),
              ],
              ),
            ),
          ));
  }
}