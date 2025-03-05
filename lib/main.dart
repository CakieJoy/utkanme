import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:utkan_me/pages/home.dart';

import 'pages/projects.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/projects': (context) => ProjectsPage(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Utkan',
      theme: ThemeData.dark(),
      //home: HomePage(),
    );
  }
}
