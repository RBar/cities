import 'package:cities_of_the_world_demo/cities_of_the_world/data/datasources/local_data_source.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/data/datasources/remote_data_source.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/domain/entities/response.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/domain/repositories/c_o_w_repositories.dart';
import 'package:cities_of_the_world_demo/core/network/network_info.dart';
import 'package:dartz/dartz.dart';
import 'package:cities_of_the_world_demo/core/error/failures.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

//Implementation of the repository

@LazySingleton(as: CitiesOfTheWorldRepository)
class CitiesOfTheWorldRepositoryImpl implements CitiesOfTheWorldRepository {
  final CitiesOfTheWorldLocalDataSource localDataSource;
  final CitiesOfTheWorldRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo; //checks internet connection
  final HiveInterface hive; //for local storage purposes

  CitiesOfTheWorldRepositoryImpl(
      {@required this.localDataSource,
      @required this.remoteDataSource,
      @required this.networkInfo,
      @required this.hive});

  @override
  Future<Either<Failure, ResponseDataClass>> getFilteredCitiesWithCountries(
      String filter) async {
    return _GetRemoteAndLocalCitiesWithCountry().getFiltereddata(
        networkInfo: networkInfo,
        remoteDataSource: remoteDataSource,
        type: 'no page',
        page: 0,
        filter: filter);
  }

  @override
  Future<Either<Failure, ResponseDataClass>> getCitiesAndCountriesAtPage(
      int page) async {
    return _GetRemoteAndLocalCitiesWithCountry().getdata(
        hive: hive,
        networkInfo: networkInfo,
        boxKeyName: 'page${page.toString()}',
        localDataSource: localDataSource,
        remoteDataSource: remoteDataSource,
        page: page,
        type: 'page');
  }

  @override
  Future<Either<Failure, ResponseDataClass>>
      getFilteredCitiesAndCountriesAtPage(int page, String filter) async {
    return _GetRemoteAndLocalCitiesWithCountry().getFiltereddata(
        networkInfo: networkInfo,
        remoteDataSource: remoteDataSource,
        type: 'page',
        page: page,
        filter: filter);
  }
}

class _GetRemoteAndLocalCitiesWithCountry {
  Future<Either<Failure, ResponseDataClass>> getdata({
    @required HiveInterface hive,
    @required NetworkInfo networkInfo,
    @required String boxKeyName,
    @required CitiesOfTheWorldLocalDataSource localDataSource,
    @required CitiesOfTheWorldRemoteDataSource remoteDataSource,
    @required String type,
    @required int page,
  }) async {
    try {
      final box = await hive.openBox('cities'); //open the ''data base''
      if (box.containsKey(boxKeyName)) {
        //check if the 'data base'' contains the requested information
        try {
          final ResponseDataClass response =
              await localDataSource.getLocalCitiesAndCountriesAtPage(page);
          return Right(response);
        } catch (e) {
          return const Left(CacheFailure());
        }
      } else {
        if (await networkInfo.isConnected) {
          // check if the user have internet connection
          try {
            final ResponseDataClass response =
                await remoteDataSource.getCitiesAndCountriesAtPage(page);
            return Right(response);
          } catch (e) {
            return const Left(ServerFailure());
          }
        } else {
          return const Left(ConnectionFailure());
        }
      }
    } catch (e) {
      return const Left(UnexpectedFailure());
    }
  }

  Future<Either<Failure, ResponseDataClass>> getFiltereddata({
    @required NetworkInfo networkInfo,
    @required CitiesOfTheWorldRemoteDataSource remoteDataSource,
    @required String type,
    @required int page,
    @required String filter,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        // check if the user have internet connection
        try {
          if (type == 'page') {
            //check if the usecase is Atpage or not
            final ResponseDataClass response = await remoteDataSource
                .getFilteredCitiesAndCountriesAtPage(page, filter);
            return Right(response);
          } else {
            final ResponseDataClass response =
                await remoteDataSource.getFilteredCitiesWithCountries(filter);
            return Right(response);
          }
        } catch (e) {
          return const Left(ServerFailure());
        }
      } else {
        return const Left(ConnectionFailure());
      }
    } catch (e) {
      return const Left(UnexpectedFailure());
    }
  }
}
