import 'package:finale_project/user_app.dart';
import 'package:finale_project/users_app.dart';
import 'package:flutter/material.dart';
import 'package:finale_project/navigations.dart';
import 'package:finale_project/auth.dart';
import 'package:finale_project/themes/global_theme.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  bool _isSelected = false;
  var appBar = ApplicationBar();

  @override
  Widget build(BuildContext context) {

    final ButtonStyle buttonStyle =
      TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);

    return MaterialApp(
      theme: globalTheme(),
      home: Scaffold(
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
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(height: 200,),
                Text("Настройки",
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline2,),
                SizedBox(height: 60,),
                SwitchListTile(
                  value: themeSett.themeBrightness,
                  onChanged: (bool newValue) {
                    setState(() {
                      themeSett.themeBrightness = !themeSett.themeBrightness;
                      globalTheme();
                    });
                  },
                  title: Text('Тёмная тема'),
                ),
                SizedBox(height: 60,),
              ],
              ),
            ),
          )),
    );
  }
}