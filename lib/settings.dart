import 'package:flutter/material.dart';
import 'package:finale_project/navigations.dart';
import 'package:finale_project/pizza_theme_app.dart';
import 'package:finale_project/themes/global_theme.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  bool _isSelected = false;
  var pizzaBar = PizzaAppBar();

  @override
  Widget build(BuildContext context) {

    final ButtonStyle buttonStyle =
    TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);

    return MaterialApp(
      theme: globalTheme(),
      home: Scaffold(
          appBar: pizzaBar.appBar(context),
          drawer: navDrawer(context),
          body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background.jpg'),
                  fit: BoxFit.cover,
                  opacity: 0.6,
                )
            ),
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(height: 60,),
                Text("Настройки",
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline2,),
                SizedBox(height: 60,),
                SwitchListTile(
                  value: _isSelected,
                  onChanged: (bool newValue) {
                    setState(() {
                      _isSelected = !_isSelected;
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