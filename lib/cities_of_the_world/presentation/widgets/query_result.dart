import 'package:cities_of_the_world_demo/cities_of_the_world/presentation/state_management/query_bloc/querycities_bloc.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/presentation/widgets/error_widget.dart';
import 'package:cities_of_the_world_demo/core/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_route/auto_route.dart';

//  * Widget that shows the results of the search delegate

class QueryResult extends StatefulWidget {
  final String query;
  const QueryResult({Key key, @required this.query}) : super(key: key);

  @override
  _QueryResultState createState() => _QueryResultState();
}

class _QueryResultState extends State<QueryResult> {
  ScrollController _controller;
  int _page;
  @override
  void initState() {
    _page = 2;
    _controller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuerycitiesBloc, QuerycitiesState>(
      builder: (context, state) {
        return state.map(
          emptyState: (value) {
            return const Center(
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xff5B01B0))),
            );
          },
          loadedState: (state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20.0),
                  child: Text(
                    'Total results: ${state.results}',
                    style: GoogleFonts.roboto(fontSize: 22.0),
                  ),
                ),
                Expanded(
                  child: NotificationListener<ScrollNotification>(
                    onNotification: _handleScrollNotification,
                    child: ListView.builder(
                      itemCount: calculateListItemCount(state),
                      controller: _controller,
                      itemBuilder: (context, index) {
                        if (index >= state.cities.length) {
                          return _buildLoaderListItem();
                        } else {
                          return GestureDetector(
                            onTap: () {
                              ExtendedNavigator.of(context).pushNamed(
                                  Routes.detailPage,
                                  arguments: DetailPageArguments(
                                      city: state.cities[index]));
                            },
                            child: ListTile(
                              leading:
                                  const Icon(FontAwesomeIcons.mapMarkerAlt),
                              title: Text(
                                '${state.cities[index].name} - ${state.cities[index].country.name}',
                                style: GoogleFonts.roboto(fontSize: 16),
                              ),
                              trailing: Text('${index + 1}'),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            );
          },
          errorState: (state) {
            return ErrorDisplay(message: state.message);
          },
          loadingState: (state) {
            return const Center(
                child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xff5B01B0))));
          },
        );
      },
    );
  }

  Widget _buildLoaderListItem() {
    return const Center(
        child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xff5B01B0))));
  }

  //Calculate the length of the listview
  int calculateListItemCount(LoadedQueryState state) {
    if (state.reachedLastPage) {
      return state.cities.length;
    } else {
      return state.cities.length + 1;
    }
  }

  //handles when add event to get the data for the next page
  // based on the position of the scroll of the list view
  bool _handleScrollNotification(ScrollNotification notification) {
    final maxScroll = _controller.position.maxScrollExtent;
    final currentScroll = _controller.position.pixels;
    if (notification is ScrollEndNotification &&
        maxScroll - currentScroll <= 200) {
      context.bloc<QuerycitiesBloc>().add(
          QuerycitiesEvent.getFilteredCitiesWithCountriesAtPageEvent(
              filter: widget.query, page: _page));
      _page++;
      setState(() {});
    }
    return false;
  }
}
