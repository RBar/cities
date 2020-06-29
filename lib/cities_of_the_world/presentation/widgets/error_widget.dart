import 'package:cities_of_the_world_demo/core/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_route/auto_route.dart';

//* Widget that will be display in case of error

class ErrorDisplay extends StatefulWidget {
  final String message;
  const ErrorDisplay({
    Key key,
    @required this.message,
  }) : super(key: key);

  @override
  _ErrorDisplayState createState() => _ErrorDisplayState();
}

class _ErrorDisplayState extends State<ErrorDisplay> {
  @override
  Widget build(BuildContext context) {
    final TextStyle _textstyle = GoogleFonts.openSans(
        color: Colors.grey, fontSize: 16.0, fontWeight: FontWeight.w500);
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Icon(
                FontAwesomeIcons.redoAlt,
                size: 60.0,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 5.0,
              ),
              const SizedBox(
                height: 5.0,
              ),
              Text(
                widget.message,
                style: _textstyle,
              ),
              FlatButton(
                  highlightColor: const Color.fromRGBO(200, 213, 222, 1.0),
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  disabledColor: Colors.transparent,
                  textColor: Colors.grey,
                  onPressed: () {
                    ExtendedNavigator.of(context)
                        .pushReplacementNamed(Routes.homePage);
                  },
                  child: Text(
                    'Retry',
                    style: _textstyle,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
