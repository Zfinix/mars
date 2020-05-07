import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mars/utils/navigation.dart';
import 'package:mars/views/home/home.dart';

class Splash extends StatefulWidget {
  Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    loadSplash();
    super.initState();
  }

  loadSplash() async {
    await Future.delayed(Duration(seconds: 4));

   navigateReplace(context, HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/bg.png',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Center(
              child: Container(
                width: 170,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Mars',
                        style: GoogleFonts.bungeeOutline(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 27,
                          ),
                        )),
                    Text('Rovers',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w900
                          ),
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
