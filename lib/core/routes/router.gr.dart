// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/presentation/pages/home_page.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/presentation/pages/detail_page.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/domain/entities/city_entity.dart';

abstract class Routes {
  static const homePage = '/';
  static const detailPage = '/detail-page';
  static const all = {
    homePage,
    detailPage,
  };
}

class Router extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.homePage:
        return MaterialPageRoute<dynamic>(
          builder: (context) => HomePage(),
          settings: settings,
        );
      case Routes.detailPage:
        if (hasInvalidArgs<DetailPageArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<DetailPageArguments>(args);
        }
        final typedArgs = args as DetailPageArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) =>
              DetailPage(key: typedArgs.key, city: typedArgs.city),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//DetailPage arguments holder class
class DetailPageArguments {
  final Key key;
  final City city;
  DetailPageArguments({this.key, @required this.city});
}

// *************************************************************************
// Navigation helper methods extension
// **************************************************************************

extension RouterNavigationHelperMethods on ExtendedNavigatorState {
  Future pushHomePage() => pushNamed(Routes.homePage);

  Future pushDetailPage({
    Key key,
    @required City city,
  }) =>
      pushNamed(
        Routes.detailPage,
        arguments: DetailPageArguments(key: key, city: city),
      );
}
