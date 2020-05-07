import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageView extends StatefulWidget {
  final url;
  ImageView({Key key, this.url}) : super(key: key);

  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          constraints: BoxConstraints.expand(),
          child: PhotoView(
            imageProvider: NetworkImage(widget?.url),
          )),
    );
  }
}
