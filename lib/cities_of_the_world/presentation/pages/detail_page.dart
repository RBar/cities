import 'package:cities_of_the_world_demo/cities_of_the_world/domain/entities/city_entity.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/presentation/widgets/city_info_widget.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/presentation/widgets/map_tab_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff5B01B0),
        title: Center(
            child: Expanded(
          child: Text(
            widget.city.name,
            overflow: TextOverflow.ellipsis,
            style:
                GoogleFonts.roboto(fontSize: 26.0, fontWeight: FontWeight.w500),
          ),
        )),
      ),
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [_tabbar(), _tabBarView(size)],
        ),
      )),
    );
  }

  TabBar _tabbar() {
    return TabBar(
      controller: _controller,
      labelPadding: const EdgeInsets.symmetric(),
      tabs: [
        Tab(
          icon: Text(
            'City Info',
            style:
                GoogleFonts.roboto(fontSize: 22.0, fontWeight: FontWeight.w500),
          ),
        ),
        Tab(
          icon: Text('Map View',
              style: GoogleFonts.roboto(
                  fontSize: 22.0, fontWeight: FontWeight.w500)),
        ),
      ],
      labelColor: const Color(0xff5B01B0),
      indicatorPadding: const EdgeInsets.symmetric(horizontal: 20.0),
      unselectedLabelColor: const Color.fromRGBO(186, 202, 207, 1.0),
      indicatorWeight: 3.0,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: const Color(0xff5B01B0),
    );
  }

  Widget _tabBarView(Size size) {
    return Expanded(
      child: TabBarView(controller: _controller, children: [
        InfoTabWidget(
          city: widget.city,
        ),
        MapTabWidget(
          city: widget.city,
        ),
      ]),
    );
  }
}
