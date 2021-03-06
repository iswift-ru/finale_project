import 'dart:async';

import 'package:flutter/material.dart';
import 'package:finale_project/themes/global_theme.dart';

import 'package:finale_project/navigation.dart';
import 'package:finale_project/settings.dart';
import 'package:finale_project/users_app.dart';
import 'package:finale_project/user_app.dart';


StreamController<bool> isLightTheme = StreamController();

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      initialData: true,
      stream: isLightTheme.stream,
      builder: (context, snapshot) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: globalTheme(snapshot.data!),
          // theme: snapshot.data! ? ThemeData.light() : ThemeData.dark(),
          // home: Auth(),
          initialRoute: '/',
          routes: {
            '/': (BuildContext context) => const Auth(),
            '/user': (BuildContext context) =>  const UserApp(),
            '/users': (BuildContext context) => const UsersApp(),
            '/settings': (BuildContext context) => const Settings(),
          },
        );
      }
    );
  }
}

class AuthData {
  String phone = "";
  String pass = "";
}

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final _formKey = GlobalKey<FormState>();
  AuthData authData = AuthData();

  checkAuth() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      if (authData.phone == "9991234567" && authData.pass == "qwerty")
        {
          return true;
        }
      else
        {
          return false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    const borderStyle = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(36)),
        borderSide: BorderSide(color: const Color(0xFFbbbbbb), width: 2));

    const linkTextStyle = TextStyle(
        fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF0079D0));

    final ButtonStyle buttonStyle =
        TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);

    var appBar = ApplicationBar();

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
            )),
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 200,
                  ),
                  const Text(
                    '?????????????? ?????????? ?? ???????? 10 ????????\n???????????? ????????????????',
                    style: TextStyle(
                        fontSize: 16, color: Color.fromRGBO(0, 0, 0, 0.6)),
                    textAlign: TextAlign.center,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              filled: true,
                              fillColor: Color(0xFFeceff1),
                              enabledBorder: borderStyle,
                              focusedBorder: borderStyle,
                              errorBorder: borderStyle,
                              focusedErrorBorder: borderStyle,
                              labelText: '??????????????',
                              labelStyle: TextStyle(color: Colors.teal),
                              errorStyle: TextStyle(color: Color(0xFF760D03),)
                          ),
                          onSaved: (value) {
                            if (value != null) {
                              authData.phone = value.toString();
                            } else {
                              authData.phone = "";
                            }
                          },
                          initialValue: "",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return '?????????? ????????????????, ?? ?????????? ????????????';
                            }
                            // return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              filled: true,
                              fillColor: Color(0xFFeceff1),
                              enabledBorder: borderStyle,
                              focusedBorder: borderStyle,
                              errorBorder: borderStyle,
                              focusedErrorBorder: borderStyle,
                              labelText: '????????????',
                              labelStyle: TextStyle(color: Colors.teal),
                              errorStyle: TextStyle(color: Color(0xFF760D03),)
                          ),
                          onSaved: (value) {
                            if (value != null) {
                              authData.pass = value.toString();
                            } else {
                              authData.pass = "";
                            }
                          },
                          initialValue: "",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return '???????????? ???? 4 ????????????????';
                            }
                            // return null;
                          },
                        ),
                        const SizedBox(
                          height: 28,
                        ),
                        SizedBox(
                            width: 154,
                            height: 42,
                            child: ElevatedButton(
                              onPressed: () {
                                if (checkAuth() == null || !checkAuth()) {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                            title: const Text("???????????? ??????????"),
                                            content: const Text(
                                                '?????????????????? ???????????????????????? ?????????? ????????????'),
                                            actions: <Widget>[
                                              ElevatedButton(
                                                child: const Text('??????????????'),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          ));
                                } else {
                                  isShow = true;
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(builder: (context) => UsersApp()),
                                  // );
                                  Navigator.pushReplacementNamed(context, '/users');
                                }
                              },
                              child: const Text('??????????'),
                              style: ElevatedButton.styleFrom(
                                  primary:
                                      Theme.of(context).colorScheme.primary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadiusDirectional.circular(36.0),
                                  )),
                            )),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 62,
                  ),
                  InkWell(
                    child: Text(
                      '??????????????????????',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    child: Text(
                      '???????????? ????????????',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "???????????????? ????????????:\n9991234567 : qwerty",
                    style: TextStyle(
                        color: Color(0xFF760D03),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ));
  }
}