import 'package:cities_of_the_world_demo/cities_of_the_world/data/models/pagination/pagination_model.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/data/models/responsedata/response_model.dart';
import 'package:cities_of_the_world_demo/core/widgets/app_widget.dart';
import 'package:cities_of_the_world_demo/injection.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

import 'cities_of_the_world/data/models/city/city_model.dart';
import 'cities_of_the_world/data/models/country/country_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appPath = await PathProviderPlatform.instance
      .getApplicationDocumentsPath(); //get a path for the local data base
  Hive.init(appPath); // initialize the local data base
  configureInjection(Environment.prod); // for dependency injection purposes
  //Registration of adapters for cache purposes
  Hive.registerAdapter(CityModelAdapter());
  Hive.registerAdapter(CountryModelAdapter());
  Hive.registerAdapter(PaginationModelAdapter());
  Hive.registerAdapter(ResponseDataClassModelAdapter());

  runApp(const AppWidget()); //run app widget (/lib/core/widget/app_widget.dart)
}
