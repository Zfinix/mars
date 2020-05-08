import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mars/core/viewmodel/home_vm.dart';
import 'package:mars/utils/margin.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var provider = context.watch<HomeViewModel>();
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/bg2.png',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Container(
              height: screenHeight(context),
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(28.0),
                        child: Text('Discover',
                            style: GoogleFonts.cabin(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800),
                            )),
                      ),
                      const YMargin(20),
                      provider.tabs()[provider.selectedIndex],
                      const YMargin(40),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 28.0),
                        child: Row(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () => provider.selectedIndex = 0,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  if (provider.selectedIndex == 0)
                                    CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 4,
                                    ),
                                  if (provider.selectedIndex == 0)
                                    const XMargin(10),
                                  Text('Curiosity',
                                      style: GoogleFonts.cabin(
                                        textStyle: TextStyle(
                                            color: provider.selectedIndex == 0
                                                ? Colors.white
                                                : Colors.white24,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w800),
                                      )),
                                ],
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () => provider.selectedIndex = 1,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  if (provider.selectedIndex == 1)
                                    CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 4,
                                    ),
                                  if (provider.selectedIndex == 1)
                                    const XMargin(10),
                                  Text('Spirit',
                                      style: GoogleFonts.cabin(
                                        textStyle: TextStyle(
                                            color: provider.selectedIndex == 1
                                                ? Colors.white
                                                : Colors.white24,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w800),
                                      )),
                                ],
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () => provider.selectedIndex = 2,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  if (provider.selectedIndex == 2)
                                    CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 4,
                                    ),
                                  if (provider.selectedIndex == 2)
                                    const XMargin(10),
                                  Text('Opportunity',
                                      style: GoogleFonts.cabin(
                                        textStyle: TextStyle(
                                            color: provider.selectedIndex == 2
                                                ? Colors.white
                                                : Colors.white24,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w800),
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      YMargin(screenHeight(context, percent: 0.07)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 60,
                            decoration: BoxDecoration(
                              color: Color(0xFFFA705F),
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFFB23C2F).withOpacity(0.5),
                                  blurRadius: 66,
                                  offset: Offset(0, 43),
                                )
                              ],
                            ),
                            width: screenWidth(context, percent: 0.8),
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              onPressed: () =>
                                  provider.selectCameraModal(context),
                              child: Text(
                                  provider?.selectedCamera?.name ??
                                      'Choose a Camera',
                                  style: GoogleFonts.cabin(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w800),
                                  )),
                            ),
                          ),
                        ],
                      ),
                      const YMargin(30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 60,
                            decoration: BoxDecoration(
                              color: Color(0xFFFA705F),
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFFB23C2F).withOpacity(0.5),
                                  blurRadius: 66,
                                  offset: Offset(0, 43),
                                )
                              ],
                            ),
                            width: screenWidth(context, percent: 0.8),
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              onPressed: () => provider.selectDate(context),
                              child: Text(
                                  provider.selectedDate != null
                                      ? '${DateFormat("MMMM, d y").format(provider.selectedDate)}'
                                      : 'CHOOSE A DATE',
                                  style: GoogleFonts.cabin(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w800),
                                  )),
                            ),
                          ),
                        ],
                      ),
                      const YMargin(30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          provider.isLoading
                              ? SpinKitRipple(
                                  color: Colors.white.withOpacity(0.7),
                                  size: 50.0,
                                )
                              : FlatButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  onPressed: provider?.selectedCamera != null &&
                                          provider?.selectedDate != null
                                      ? () => provider.getPhotos(context)
                                      : null,
                                  child: Text(
                                      provider.selectedDate != null
                                          ? 'EXPLORE PHOTOS'
                                          : 'SELECT DATE',
                                      style: GoogleFonts.cabin(
                                        textStyle: TextStyle(
                                            color: provider?.selectedCamera !=
                                                        null &&
                                                    provider?.selectedDate !=
                                                        null
                                                ? Colors.white
                                                : Colors.white38,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w800),
                                      )),
                                ),
                        ],
                      ),const YMargin(30),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Curiosity extends StatelessWidget {
  const Curiosity({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 58.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Mars',
                  style: GoogleFonts.bungeeOutline(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                    ),
                  )),
              Text('CURIOSITY',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 43,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w900),
                  )),
            ],
          ),
        ),
        Container(
          height: screenHeight(context, percent: 0.4),
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            children: [
             
              XMargin(Platform.isIOS ? 40 : 80),
              Image.asset(
                'assets/images/curiosity.png',
                fit: BoxFit.cover,
                height: screenHeight(context, percent: 0.4),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Spirit extends StatelessWidget {
  const Spirit({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 58.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const YMargin(40),
              Text('Mars',
                  style: GoogleFonts.bungeeOutline(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                    ),
                  )),
              Text('SPIRIT',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 43,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w900),
                  )),
            ],
          ),
        ),
        Container(
          height: screenHeight(context, percent: 0.356),
          margin: EdgeInsets.only(top: 30),
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            children: [
              XMargin(Platform.isIOS ? 80 : 100),
              Image.asset(
                'assets/images/spirit.png',
                fit: BoxFit.cover,
                height: screenHeight(context, percent: 0.3),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Opportunity extends StatelessWidget {
  const Opportunity({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 58.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const YMargin(40),
              Text('Mars',
                  style: GoogleFonts.bungeeOutline(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                    ),
                  )),
              Text('OPPORTUNITY',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 41,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w900),
                  )),
            ],
          ),
        ),
        Container(
          height: screenHeight(context, percent: 0.4),
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            children: [
              XMargin(Platform.isIOS ? 40 : 60),
              Image.asset(
                'assets/images/curiosity.png',
                fit: BoxFit.cover,
                height: screenHeight(context, percent: 0.4),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
