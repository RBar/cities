// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cities_of_the_world_demo/core/injection_third_party/injection_third_party.dart';
import 'package:http/src/client.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:hive/hive.dart';
import 'package:cities_of_the_world_demo/core/network/network_info.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/data/datasources/local_data_source.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/data/datasources/remote_data_source.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/data/repositories/cities_of_the_world_repository_imp.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/domain/repositories/c_o_w_repositories.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/domain/usecases/get_cities_with_countries_at_page.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/domain/usecases/get_filtered_cities_with_countries_at_page.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/domain/usecases/get_filtered_cities_with_countries.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/presentation/state_management/query_bloc/querycities_bloc.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/presentation/state_management/page_view_bloc/citiesoftheworld_bloc.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final placesInjectableModule = _$PlacesInjectableModule();
  g.registerLazySingleton<Client>(() => placesInjectableModule.httpClient);
  g.registerLazySingleton<DataConnectionChecker>(
      () => placesInjectableModule.dataConnectionChecker);
  g.registerLazySingleton<HiveInterface>(
      () => placesInjectableModule.hiveInterface);
  g.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(g<DataConnectionChecker>()));
  g.registerLazySingleton<PathProviderPlatform>(
      () => placesInjectableModule.pathProviderPlatform);
  g.registerLazySingleton<CitiesOfTheWorldLocalDataSource>(
      () => CitiesOfTheWorldLocalDataSourceImpl(hive: g<HiveInterface>()));
  g.registerLazySingleton<CitiesOfTheWorldRemoteDataSource>(() =>
      CitiesOfTheWorldRemoteDataSourceImpl(
          client: g<Client>(),
          localDataSource: g<CitiesOfTheWorldLocalDataSource>()));
  g.registerLazySingleton<CitiesOfTheWorldRepository>(
      () => CitiesOfTheWorldRepositoryImpl(
            localDataSource: g<CitiesOfTheWorldLocalDataSource>(),
            remoteDataSource: g<CitiesOfTheWorldRemoteDataSource>(),
            networkInfo: g<NetworkInfo>(),
            hive: g<HiveInterface>(),
          ));
  g.registerLazySingleton<GetCitiesAndCountriesAtPage>(
      () => GetCitiesAndCountriesAtPage(g<CitiesOfTheWorldRepository>()));
  g.registerLazySingleton<GetFilteredCitiesAndCountriesAtPage>(() =>
      GetFilteredCitiesAndCountriesAtPage(g<CitiesOfTheWorldRepository>()));
  g.registerLazySingleton<GetFilteredCitiesWithCountries>(
      () => GetFilteredCitiesWithCountries(g<CitiesOfTheWorldRepository>()));
  g.registerFactory<QuerycitiesBloc>(() => QuerycitiesBloc(
      filteredCitiesWithCountries: g<GetFilteredCitiesWithCountries>(),
      filteredCitiesAndCountriesAtPage:
          g<GetFilteredCitiesAndCountriesAtPage>()));
  g.registerFactory<CitiesoftheworldBloc>(() => CitiesoftheworldBloc(
      citiesAndCountriesAtPage: g<GetCitiesAndCountriesAtPage>()));
}

class _$PlacesInjectableModule extends PlacesInjectableModule {}
