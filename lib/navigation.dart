import 'package:flutter/material.dart';


class ApplicationBar {
  PreferredSizeWidget appBar(context) => AppBar(
        title: Text("Пользователи"),
        actions: [
          IconButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => Settings()),
                // );
                Navigator.pushReplacementNamed(context, '/settings');
              },
              icon: Icon(Icons.settings)),
        ],
      );
}

bool isShow = false;

Widget navDrawer(context) => Drawer(
  child: ListView(
    padding: EdgeInsets.zero,
    children: [
      DrawerHeader(
          padding: EdgeInsets.zero,
          decoration: const BoxDecoration(color: Colors.white),
          child: Container(
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        opacity: 0.8,
                        image: AssetImage("assets/images/bg_drawer.jpg"),
                        fit: BoxFit.fill),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text("Пользователи",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(1.0, 1.0),
                            blurRadius: 3.0,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
      !isShow ? ListTile(
        leading: const Icon(Icons.input_rounded),
        title: const Text("Войти"),
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => Auth()),
          // );
          Navigator.pushReplacementNamed(context, '/');
        },
      ) : ListTile(
        leading: const Icon(Icons.input_rounded),
        title: const Text("Выйти", style: TextStyle(color: Colors.red),),
        onTap: () {
          isShow = false;
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => Auth()),
          // );
          Navigator.pushReplacementNamed(context, '/');
        },
      ),
      isShow ? ListTile(
        leading: const Icon(Icons.format_list_numbered_sharp),
        title: const Text("Список пользователей",),
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => UsersApp()),
          // );
          Navigator.pushReplacementNamed(context, '/users');
        },
      ): Container(),
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
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => Settings()),
          // );
          Navigator.pushNamed(context, '/settings');
        },
      ),
    ],
  ),
);