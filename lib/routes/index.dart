import 'package:flutter/material.dart';
import 'package:hm_shop/pages/Login/index.dart';
import 'package:hm_shop/pages/Main/index.dart';

Widget getRootWidget() {
  return MaterialApp(
    initialRoute: "/",
    title: "黑马Shop",
    routes: getRootRouters(),
  );
}

Map<String, WidgetBuilder> getRootRouters() {
  return {
    "/": (context) => MainPage(),
    "/login": (context) => LoginPage(),
  };
}