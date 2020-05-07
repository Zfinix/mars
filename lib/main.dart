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
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
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
  backgroundColor: Colors.red, // status bar color
  brightness: Brightness.light, // status bar brightness
        ),
        home: Splash(),
      ),
    );
  }
}
