import 'dart:async';
import 'dart:convert';

import 'package:finale_project/task.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:finale_project/themes/global_theme.dart';

import 'package:finale_project/navigations.dart';
import 'package:finale_project/auth.dart';
import 'package:finale_project/users_app.dart';
import 'package:finale_project/user_app.dart';
import 'package:finale_project/settings.dart';



Future<User> fetchUser(int idUser) async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/Users/$idUser'));

  if (response.statusCode == 200) {
    return User.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load User');
  }
}

class User {

  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;
  final Address address;
  final Company company;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
    required this.address,
    required this.company,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      website: json['website'],
      address: Address.fromJson(json['address']),
      company: Company.fromJson(json['company']),
    );
  }
}


class Address {

  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'],
      suite: json['suite'],
      city: json['city'],
      zipcode: json['zipcode'],
      geo: Geo.fromJson(json['geo']),
    );
  }
}


class Geo {
  final String lat;
  final String lng;


  Geo({
    required this.lat,
    required this.lng,

  });

  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(
      lat: json['lat'],
      lng: json['lng'],
    );
  }
}


class Company {

  final String name;
  final String catchPhrase;
  final String bs;


  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: json['name'],
      catchPhrase: json['catchPhrase'],
      bs: json['bs'],
    );
  }
}



class UserApp extends StatefulWidget {
  const UserApp({Key? key}) : super(key: key);

  @override
  _UserAppState createState() => _UserAppState();
}

class _UserAppState extends State<UserApp> {
  late Future<User> futureUser;
  late int userId;

  @override
  void initState() {
    super.initState();
    // futureUser = fetchUser();
  }

  var appBar = ApplicationBar();

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as Map;

    if (arguments == null) arguments['idUser'] == 0;
    futureUser = fetchUser(arguments['idUser']);
    userId = arguments['idUser'];

    return MaterialApp(
      theme: globalTheme(),
      routes: {
        '/user': (BuildContext context) =>  const UserApp(),
      },
      home: Scaffold(
        appBar: appBar.appBar(context),
        drawer: navDrawer(context),
        body: FutureBuilder<User>(
          future: futureUser,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Color(0xffdddddd),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "${snapshot.data!.name} (${snapshot.data!.username})",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text.rich(
                            TextSpan(text: "Эл. почта:",
                                style: const TextStyle(color: Colors.black, fontSize: 16),
                                children: <TextSpan>[
                                  TextSpan(text: " ${snapshot.data!.email}", style: const TextStyle(fontWeight: FontWeight.bold)),
                                ]
                            )
                        ),
                        SizedBox(height: 5),
                        Text.rich(
                            TextSpan(text: "Телефон:",
                                style: const TextStyle(color: Colors.black, fontSize: 16),
                                children: <TextSpan>[
                                  TextSpan(text: " ${snapshot.data!.phone}", style: const TextStyle(fontWeight: FontWeight.bold)),
                                ]
                            )
                        ),
                        SizedBox(height: 5),
                        Text.rich(
                            TextSpan(text: "Сайт:",
                                style: const TextStyle(color: Colors.black, fontSize: 16),
                                children: <TextSpan>[
                                  TextSpan(text: " ${snapshot.data!.website}", style: const TextStyle(fontWeight: FontWeight.bold)),
                                ]
                            )
                        ),
                        SizedBox(height: 30,),
                        const Text("Адрес",
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),),
                        SizedBox(height: 5,),
                        Text.rich(TextSpan(
                            text: "${snapshot.data!.address.zipcode}, ",
                            style: const TextStyle(
                                color: Colors.black, fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(
                                text: " ${snapshot.data!.address.city}",
                                style: const TextStyle(),
                              ),
                              TextSpan(
                                text:
                                    ", ${snapshot.data!.address.street}, ${snapshot.data!.address.suite}",
                                style: const TextStyle(),
                              ),
                            ]
                        ),),
                        SizedBox(height: 5,),
                        Text.rich(
                            TextSpan(text: "Координаты:",
                                style: const TextStyle(color: Colors.black, fontSize: 16),
                                children: <TextSpan>[
                                  TextSpan(text: " ${snapshot.data!.address.geo.lat}, ${snapshot.data!.address.geo.lng}",
                                      style: const TextStyle(fontWeight: FontWeight.bold)),
                                ]
                            )
                        ),
                        SizedBox(height: 30,),
                        const Text(
                          "Компания",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5,),
                        Text.rich(
                            TextSpan(text: "Название:",
                                style: const TextStyle(color: Colors.black, fontSize: 16),
                                children: <TextSpan>[
                                  TextSpan(text: " ${snapshot.data!.company.name}", style: const TextStyle(fontWeight: FontWeight.bold)),
                                ]
                            )
                        ),
                        SizedBox(height: 5,),
                        Text.rich(
                            TextSpan(text: "Слоган:",
                                style: const TextStyle(color: Colors.black, fontSize: 16),
                                children: <TextSpan>[
                                  TextSpan(text: " ${snapshot.data!.company.catchPhrase}", style: const TextStyle(fontWeight: FontWeight.bold)),
                                ]
                            )
                        ),
                        SizedBox(height: 5,),
                        Text.rich(
                            TextSpan(text: "BS:",
                                style: const TextStyle(color: Colors.black, fontSize: 16),
                                children: <TextSpan>[
                                  TextSpan(text: " ${snapshot.data!.company.bs}", style: const TextStyle(fontWeight: FontWeight.bold)),
                                ]
                            ),
                        ),
                        SizedBox(height: 20,),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => UsersApp()),
                              );
                              // Navigator.pushNamed(context, '/users',);
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => UsersApp(),),);
                            },
                          child: Text("Вернуться к списку"),
                            ),
                        SizedBox(height: 20,),
                      ],
                    ),
                  ),
                  Container(
                    child: TaskApp(userId: userId),
                  ),
                  SizedBox(height: 20),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Center(
                  child: CircularProgressIndicator(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
