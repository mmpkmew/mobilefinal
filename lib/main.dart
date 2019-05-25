import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dd/register.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Login.dart';
import 'home.dart';
import 'home_f.dart';
import 'home_friend.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Mobile Final',
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => Login(),
        "/register": (context) => RegistForm(),
        "/home": (context) => HomePage(),
        // "/profile": (context) => ProfilePage(),
        "/friend": (context) => Home(),
      },
    );
  }

}