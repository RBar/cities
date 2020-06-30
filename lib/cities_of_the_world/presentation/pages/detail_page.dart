import 'package:cities_of_the_world_demo/cities_of_the_world/domain/entities/city_entity.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/presentation/widgets/city_info_widget.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/presentation/widgets/map_tab_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

//* Page to see the datails of a City

class DetailPage extends StatefulWidget {
  final City city;
  const DetailPage({Key key, @required this.city}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with TickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    _controller = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(FontAwesomeIcons.chevronLeft),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: const Color(0xff5B01B0),
        title: Center(
            child: Text(
          widget.city.name,
          overflow: TextOverflow.ellipsis,
          style:
              GoogleFonts.roboto(fontSize: 26.0, fontWeight: FontWeight.w500),
        )),
      ),
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            body: TabBarView(
              children: [
                InfoTabWidget(
                  city: widget.city,
                ),
                MapTabWidget(
                  city: widget.city,
                ),
              ],
            ),
            bottomNavigationBar: TabBar(
              labelPadding: const EdgeInsets.symmetric(),
              tabs: [
                Tab(
                  icon: Column(
                    children: [
                      const Icon(FontAwesomeIcons.table),
                      Text(
                        'City info',
                        style: GoogleFonts.roboto(),
                      )
                    ],
                  ),
                ),
                Tab(
                  icon: Column(
                    children: [
                      const Icon(FontAwesomeIcons.mapMarkedAlt),
                      Text('Map view', style: GoogleFonts.roboto())
                    ],
                  ),
                ),
              ],
              labelColor: const Color(0xff5B01B0),
              unselectedLabelColor: const Color.fromRGBO(186, 202, 207, 1.0),
              indicatorColor: Colors.transparent,
            ),
            backgroundColor: Colors.white,
          ),
        ),
      )),
    );
  }
}
