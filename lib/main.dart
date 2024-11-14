import 'package:flutter/material.dart';
import 'package:store_app/screens/Home_page.dart';
import 'package:store_app/screens/UbdateProductPage.dart';

void main() {
  runApp(const StorApp());
}

class StorApp extends StatelessWidget {
  const StorApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id: (context) =>const HomePage(),
        Ubdateproductpage.id:(context)=> Ubdateproductpage(),
      },
      initialRoute: HomePage.id,
    );
  }
}
