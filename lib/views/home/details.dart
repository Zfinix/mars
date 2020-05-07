import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mars/core/model/nasa_rover_model.dart';
import 'package:mars/core/viewmodel/home_vm.dart';
import 'package:mars/utils/margin.dart';
import 'package:mars/utils/navigation.dart';
import 'package:provider/provider.dart';

import 'image_view.dart';

class DetailsPage extends StatefulWidget {
  final NASARoverModel nasaRoverModel;

  DetailsPage({this.nasaRoverModel, Key key}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    var provider = context.watch<HomeViewModel>();
    return Scaffold(
      
      backgroundColor: Color(0xFFFA705F),
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/bg2.png',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Material(
              color: Colors.transparent,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 30),
                children: [
                  const YMargin(100),
                  for (var photo in widget.nasaRoverModel.photos)
                    Column(
                      children: [
                        CupertinoContextMenu(
                          child: Container(
                            width: screenWidth(context),
                            height: screenHeight(context, percent: 0.25),
                            margin: EdgeInsets.only(bottom: 60),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 23),
                                    blurRadius: 46,
                                    color: Colors.black.withOpacity(0.4))
                              ],
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  photo.imgSrc,
                                ),
                              ),
                            ),
                          ),
                          actions: <Widget>[
                            CupertinoContextMenuAction(
                              child: Center(
                                child: Text('View Full Image',
                                    style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    )),
                              ),
                              onPressed: () {
                                navigate(
                                    context,
                                    ImageView(
                                      url: photo.imgSrc,
                                    ));
                              },
                            ),
                            CupertinoContextMenuAction(
                              child: Center(
                                child: Text('Share',
                                    style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    )),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ],
                    )
                ],
              ),
            ),
            Column(
              children: [

                  const YMargin(20),
                Container(
                  height: 90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                        ),
                        color: Colors.white,
                        onPressed: () => popView(context),
                        iconSize: 17,
                      ),
                      const XMargin(10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(provider.getMarsRover(),
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w900),
                              )),
                          Text('Rover',
                              style: GoogleFonts.bungeeOutline(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
