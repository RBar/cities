import 'package:cities_of_the_world_demo/cities_of_the_world/presentation/widgets/page_view_widget.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/presentation/widgets/search_box_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        Container(
            width: double.infinity,
            height: double.infinity,
            child: _mainColumn(size)),
        _square1Logo(),
      ]),
    );
  }

  Widget _square1Logo() {
    return Positioned(
      top: 20,
      right: 0,
      child: Container(
          width: 100,
          height: 100,
          child: const Image(image: AssetImage('assets/logo.png'))),
    );
  }

  Widget _mainColumn(Size size) {
    return Container(
      width: size.width,
      height: size.height,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SafeArea(child: Container()),
            Container(width: size.width, height: 220, child: _header(size)),
            const SearchBoxWidget(),
            const SizedBox(
              height: 20.0,
            ),
            _citiesText(size),
            const SizedBox(
              height: 10.0,
            ),
            const PageViewWidget(),
            const SizedBox(
              height: 70,
            ),
          ],
        ),
      ),
    );
  }

  Widget _citiesText(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        width: size.width,
        child: const Text(
          'All Cities',
          textAlign: TextAlign.start,
          style: TextStyle(
              color: Colors.black, fontSize: 26.0, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _header(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Expanded(
              flex: 5,
              child: RichText(
                text: const TextSpan(
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 50.0,
                        fontWeight: FontWeight.w800),
                    children: [
                      TextSpan(text: 'Cities of the\n'),
                      TextSpan(
                        text: 'World',
                        style: TextStyle(
                            color: Color(0xff5B01B0),
                            fontSize: 50.0,
                            fontWeight: FontWeight.w800),
                      ),
                    ]),
              )),
          Expanded(
            flex: 4,
            child: SvgPicture.asset(
              'assets/world.svg',
            ),
          ),
        ],
      ),
    );
  }
}
