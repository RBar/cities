import 'package:cities_of_the_world_demo/cities_of_the_world/domain/entities/city_entity.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/domain/entities/gg_photo.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/domain/repositories/c_o_w_repositories.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/domain/usecases/get_gg_photo.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/presentation/pages/detail_page.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/presentation/state_management/page_view_bloc/citiesoftheworld_bloc.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/presentation/utils/get_google_image.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/presentation/widgets/error_widget.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/presentation/widgets/loading_widget.dart';
import 'package:cities_of_the_world_demo/core/error/failures.dart';
import 'package:cities_of_the_world_demo/injection.dart';
import 'package:dartz/dartz.dart' as dartz;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PageViewWidget extends StatefulWidget {
  const PageViewWidget({Key key}) : super(key: key);

  @override
  _PageViewWidgetState createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  ScrollController _controller;
  int _page;
  @override
  void initState() {
    _controller = ScrollController();
    _page = 1;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_page == 1) {
      context.bloc<CitiesoftheworldBloc>().add(
          const CitiesoftheworldEvent.getCitiesWithCountriesAtPageEvent(
              page: 1));
      _page++;
    }
    return _blocContent();
  }

  Widget _blocContent() {
    return BlocBuilder<CitiesoftheworldBloc, CitiesoftheworldState>(
      builder: (context, state) {
        final Size size = MediaQuery.of(context).size;
        return state.map(emptyState: (state) {
          return LoadingPhotoWidget(
              width: size.width * 0.7, height: size.height * 0.5);
        }, loadedState: (state) {
          return Container(
            width: size.width,
            height: size.height * 0.5,
            constraints: const BoxConstraints(maxHeight: 400),
            child: NotificationListener<ScrollNotification>(
              onNotification: _handleScrollNotification,
              child: ListView.builder(
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  itemCount: calculateListItemCount(state),
                  itemBuilder: (context, index) {
                    if (index >= state.cities.length) {
                      return _buildLoaderListItem();
                    } else {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: _card(size, state.cities[index]),
                      );
                    }
                  }),
            ),
          );
        }, errorState: (state) {
          return ErrorDisplay(
            message: state.message,
          );
        }, loadingState: (state) {
          return LoadingPhotoWidget(
              width: size.width * 0.7, height: size.height * 0.5);
        });
      },
    );
  }

  Widget _buildLoaderListItem() {
    return const Center(
      child: CupertinoActivityIndicator(),
    );
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification &&
        _controller.position.extentAfter == 0 &&
        _page != 2) {
      context.bloc<CitiesoftheworldBloc>().add(
          CitiesoftheworldEvent.getCitiesWithCountriesAtPageEvent(page: _page));
      _page++;
      setState(() {});
    } else if (notification is ScrollEndNotification && _page == 2) {
      context.bloc<CitiesoftheworldBloc>().add(
          CitiesoftheworldEvent.getCitiesWithCountriesAtPageEvent(page: _page));
      _page++;
    }
    return false;
  }

  int calculateListItemCount(LoadedState state) {
    if (state.rachedLastPage) {
      return state.cities.length;
    } else {
      return state.cities.length + 1;
    }
  }

  Widget _card(Size size, City city) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
          return DetailPage(city: city);
        }));
      },
      child: Container(
        width: (size.width * 0.7 > 400) ? 400 : size.width * 0.7,
        child: Stack(
          children: [
            _image(city, size),
            Positioned(
              top: 20,
              right: 30,
              child: Text(
                '# ${city.id.toString()}',
                style: const TextStyle(
                    fontFamily: 'Ingleby',
                    color: CupertinoColors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w800),
              ),
            ),
            Positioned(
                bottom: 60,
                left: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: size.width * 0.6,
                      child: Text(
                        city.name,
                        overflow: TextOverflow.clip,
                        style: const TextStyle(
                            fontFamily: 'Ingleby',
                            color: CupertinoColors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: [
                        const Icon(
                          FontAwesomeIcons.mapMarkerAlt,
                          color: CupertinoColors.white,
                          size: 16.0,
                        ),
                        const SizedBox(
                          width: 2.0,
                        ),
                        Text(
                          city.country.name,
                          style: const TextStyle(
                              fontFamily: 'Ingleby',
                              color: CupertinoColors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget _image(City city, Size size) {
    final repository = getIt<CitiesOfTheWorldRepository>();

    final String cityinfo = '${city.name} ${city.country.name}';
    return FutureBuilder<dartz.Either<Failure, GGPhoto>>(
      future: GetGGPhoto(repository).call(GGPhotoParams(place: cityinfo)),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return snapshot.data.fold((failure) => Container(), (ggPhoto) {
            return Container(
              width: (size.width * 0.7 > 400) ? 400 : size.width * 0.7,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  boxShadow: [
                    BoxShadow(
                        color: CupertinoColors.black.withOpacity(0.26),
                        offset: const Offset(2, 2),
                        blurRadius: 3)
                  ]),
              height: 400,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40.0),
                child: Image(
                  image: NetworkImage(Utils().getggplacesImage(ggPhoto)),
                  fit: BoxFit.cover,
                ),
              ),
            );
          });
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
