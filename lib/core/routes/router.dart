import 'package:auto_route/auto_route_annotations.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/presentation/pages/detail_page.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/presentation/pages/home_page.dart';

// Handles the pages routes of the app

@MaterialAutoRouter(generateNavigationHelperExtension: true)
class $Router {
  @initial
  HomePage homePage; // Initial page of the app
  DetailPage detailPage;
}
