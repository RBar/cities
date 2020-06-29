import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

//Dependency injection of thrid party libraries

@module
abstract class PlacesInjectableModule {
  @lazySingleton
  Client get httpClient => Client();

  @lazySingleton
  DataConnectionChecker get dataConnectionChecker => DataConnectionChecker();
  @lazySingleton
  PathProviderPlatform get pathProviderPlatform =>
      PathProviderPlatform.instance;
  @lazySingleton
  HiveInterface get hiveInterface => Hive;
}
