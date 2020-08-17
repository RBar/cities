import 'package:flutter/material.dart';

//* widget that is display when the  photos of the homescreen are loading

class LoadingPhotoWidget extends StatelessWidget {
  final double width;
  final double height;
  const LoadingPhotoWidget(
      {Key key, @required this.width, @required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: const Image(
          image: AssetImage('assets/no-image.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
