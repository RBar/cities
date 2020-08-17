import 'package:cities_of_the_world_demo/cities_of_the_world/presentation/state_management/query_bloc/querycities_bloc.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/presentation/widgets/error_widget.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/presentation/widgets/query_result.dart';
import 'package:cities_of_the_world_demo/core/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_fonts/google_fonts.dart';

//* Widget to search cities

class DataSearch extends SearchDelegate {
  String seleccion = '';
  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme.copyWith(
      inputDecorationTheme: theme.inputDecorationTheme.copyWith(
        hintStyle: GoogleFonts.roboto(color: Colors.white70),
      ),
      textTheme: theme.textTheme.copyWith(
        headline1: GoogleFonts.roboto(color: Colors.white),
        headline6: GoogleFonts.roboto(color: Colors.white),
      ),
      primaryColor: const Color(0xff5B01B0),
      primaryIconTheme: theme.primaryIconTheme.copyWith(color: Colors.white),
      primaryColorBrightness: Brightness.light,
    );
  }

  @override
  String get searchFieldLabel => 'Type here for search';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    } else {
      context.bloc<QuerycitiesBloc>().add(
          QuerycitiesEvent.getFilteredCitiesWithCountriesAtPageEvent(
              filter: query, page: 1));
      return QueryResult(query: query);
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    } else {
      context.bloc<QuerycitiesBloc>().add(
          QuerycitiesEvent.getFilteredCitiesWithCountriesEvent(filter: query));
      return BlocBuilder<QuerycitiesBloc, QuerycitiesState>(
        builder: (context, state) {
          return state.map(
            emptyState: (value) {
              return const Center(
                child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xff5B01B0))),
              );
            },
            loadedState: (state) {
              return ListView.builder(
                  itemCount: state.cities.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        ExtendedNavigator.of(context).pushNamed(
                            Routes.detailPage,
                            arguments:
                                DetailPageArguments(city: state.cities[index]));
                      },
                      child: ListTile(
                        leading: const Icon(FontAwesomeIcons.mapMarkerAlt),
                        title: Text(
                          state.cities[index].name,
                          style: GoogleFonts.roboto(fontSize: 16.0),
                        ),
                      ),
                    );
                  });
            },
            errorState: (state) {
              return ErrorDisplay(message: state.message);
            },
            loadingState: (state) {
              return const Center(
                child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xff5B01B0))),
              );
            },
          );
        },
      );
    }
  }
}
