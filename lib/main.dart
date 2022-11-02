import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unslash/core/constant/approutes.dart';
import 'package:unslash/initialbinding.dart';
import 'package:unslash/routes.dart';

import 'core/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Images',
      theme: ThemeData(
        backgroundColor: Colors.white,
        fontFamily: 'Cairo',
        appBarTheme: const AppBarTheme(
            centerTitle: true,
            titleTextStyle: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            elevation: 0,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black),
        primarySwatch: Colors.blue,
      ),
      initialBinding: InitialBinding(),
      getPages: routes,
    );
  }
}
