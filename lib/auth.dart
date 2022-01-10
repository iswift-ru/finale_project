import 'package:flutter/material.dart';
import 'package:finale_project/themes/global_theme.dart';

import 'package:finale_project/navigations.dart';
import 'package:finale_project/auth.dart';
import 'package:finale_project/users_app.dart';
import 'package:finale_project/user_app.dart';
import 'package:finale_project/settings.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: globalTheme(),
      home: Auth(),
      // initialRoute: '/',
      // routes: {
      //   '/': (BuildContext context) => const Auth(),
      //   '/user': (BuildContext context) =>  const UserApp(),
      //   '/users': (BuildContext context) => const UsersApp(),
      //   '/settings': (BuildContext context) => const Settings(),
      // },
    );
  }
}


class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {

    const borderStyle = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(36)),
        borderSide: BorderSide(
            color: const Color(0xFFbbbbbb), width: 2
        )
    );

    const linkTextStyle = TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Color(0xFF0079D0));

    final ButtonStyle buttonStyle =
    TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);

    var appBar = ApplicationBar();

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
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: SingleChildScrollView(
              child: Column(children: [
                // const SizedBox(width: 110, height: 84, child: Image(image: AssetImage('assets/dart-logo.png'),),),
                SizedBox(height: 200,),
                const Text('Введите логин в виде 10 цифр\nномера телефона',
                  style: TextStyle(fontSize: 16, color: Color.fromRGBO(0, 0, 0, 0.6)),
                  textAlign: TextAlign.center,),

                SizedBox(height: 20,),
                const TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFeceff1),
                    enabledBorder: borderStyle,
                    focusedBorder: borderStyle,
                    labelText: '9991234567',
                  ),
                ),
                SizedBox(height: 20,),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFeceff1),
                    enabledBorder: borderStyle,
                    focusedBorder: borderStyle,
                    labelText: 'Пароль',
                  ),
                ),
                SizedBox(height: 28,),
                SizedBox(width: 154, height: 42, child:
                ElevatedButton(onPressed: () {},
                  child: Text('Войти'),
                  style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.circular(36.0),
                      )
                  ),
                )
                ),
                SizedBox(height: 62,),
                InkWell(child: Text('Регистрация', style: Theme.of(context).textTheme.bodyText2,), onTap: () {},),
                SizedBox(height: 20,),
                InkWell(child: Text('Забыли пароль', style: Theme.of(context).textTheme.bodyText2,), onTap: () {},),
              ],
              ),
            ),
          )),
    );
  }
}