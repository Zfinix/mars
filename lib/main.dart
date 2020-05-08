import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'core/services/providerRegistrar.dart';
import 'views/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Platform.isIOS ? Colors.white : Color(0xFFFA705F),
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor:
          Platform.isIOS ? Colors.white : Color(0xFFFA705F),
    ));
    return MultiProvider(
      providers: registerProviders,
      child: MaterialApp(
        title: 'Mars Rovers',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.cabinTextTheme(
            Theme.of(context).textTheme,
          ),
          primarySwatch: Colors.red,
          primaryColor: Color(0xFFFA705F),
          backgroundColor: Color(0xFFFA705F), // status bar color
          brightness: Brightness.light, // status bar brightness
        ),
        home: Splash(),
      ),
    );
  }
}
