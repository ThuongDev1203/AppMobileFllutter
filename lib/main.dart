import 'package:flutter/material.dart';
import 'routes/app_routes.dart';
//import 'homeScene.dart';
//import 'createAccount.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.login,
      routes: AppRoutes.routes,
      //home: Createaccount(),
      //home: HomeScreen(),
    );
  }
}
