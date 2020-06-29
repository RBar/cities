import 'package:cities_of_the_world_demo/cities_of_the_world/presentation/widgets/data_search_widge.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//* Widget for the Homescreen to show a Search Box

class SearchBoxWidget extends StatelessWidget {
  const SearchBoxWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        showSearch(context: context, delegate: DataSearch());
      },
      child: Container(
        margin: const EdgeInsets.all(20.0),
        width: size.width,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.20),
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              Expanded(
                  flex: 10,
                  child: Text(
                    'Tap here for search',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: (size.width > 500) ? 16 : 14.0,
                        fontWeight: FontWeight.w500),
                  )),
              const Expanded(
                  flex: 2,
                  child: Icon(
                    FontAwesomeIcons.search,
                    color: Color(0xff5B01B0),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
