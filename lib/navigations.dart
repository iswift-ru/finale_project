import 'package:flutter/material.dart';
import 'package:finale_project/themes/global_theme.dart';

import 'package:finale_project/navigations.dart';
import 'package:finale_project/auth.dart';
import 'package:finale_project/users_app.dart';
import 'package:finale_project/user_app.dart';
import 'package:finale_project/settings.dart';


final _messengerKey = GlobalKey<ScaffoldMessengerState>();


class ApplicationBar {
  PreferredSizeWidget appBar(context) => AppBar(
        title: Text("Пользователи"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Settings()),
                );
                // Navigator.pushNamed(context, '/settings');
              },
              icon: Icon(Icons.settings)),
        ],
      );
}

Widget navDrawer(context) => Drawer(
  child: ListView(
    padding: EdgeInsets.zero,
    children: [
      DrawerHeader(
          padding: EdgeInsets.zero,
          decoration: const BoxDecoration(color: Colors.white),
          child: Container(
            child: Stack(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        opacity: 0.8,
                        image: AssetImage("assets/images/bg_drawer.jpg"),
                        fit: BoxFit.fill),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text("Пользователи",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
      ListTile(
        leading: const Icon(Icons.input_rounded),
        title: const Text("Войти"),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Auth()),
          );

          // Navigator.pushNamed(context, '/');
        },
      ),
      ListTile(
        leading: const Icon(Icons.format_list_numbered_sharp),
        title: const Text("Список пользователей",),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UsersApp()),
          );
          // Navigator.pushNamed(context, '/users');
        },
      ),
      // ListTile(
      //   leading: const Icon(Icons.format_list_numbered_sharp),
      //   title: const Text("Пользователь",),
      //   onTap: () {
      //     Navigator.pushNamed(context, '/user');
      //   },
      // ),
      const Divider(),
      const Padding(
        padding: EdgeInsets.only(right: 20.0),
        child: Align(
          alignment: Alignment.topRight,
          child: Text(
            "Профиль",
            style: TextStyle(color: Colors.blueGrey, fontSize: 12),
          ),
        ),
      ),
      ListTile(
        leading: const Icon(Icons.settings),
        title: const Text("Настройки"),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Settings()),
          );
          // Navigator.pushNamed(context, '/settings');
        },
      ),
    ],
  ),
);