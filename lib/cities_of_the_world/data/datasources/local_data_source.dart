import 'package:cities_of_the_world_demo/cities_of_the_world/data/models/responsedata/response_model.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/domain/entities/response.dart';
import 'package:cities_of_the_world_demo/core/error/exceptions.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

abstract class CitiesOfTheWorldLocalDataSource {
  Future<void> cacheResponseData(ResponseDataClassModel response,
      int page); //cache the responseDataClassModel in local database
  Future<ResponseDataClass> getLocalCitiesAndCountriesAtPage(
      int page); // get the responsedataclass from the local database
}

//@lazysingleton is for dependency injection purposes
@LazySingleton(as: CitiesOfTheWorldLocalDataSource)
class CitiesOfTheWorldLocalDataSourceImpl
    extends CitiesOfTheWorldLocalDataSource {
  final HiveInterface hive; // local database

  CitiesOfTheWorldLocalDataSourceImpl({@required this.hive});

  @override
  Future<void> cacheResponseData(
      ResponseDataClassModel response, int page) async {
    //Open the local data base
    //put the response inside data base
    //close data base
    //if error then throw exception
    try {
      final box = await hive.openBox('cities');
      await box.put('page${page.toString()}', response);
      await box.close();
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<ResponseDataClass> getLocalCitiesAndCountriesAtPage(int page) async {
    return getResponseModel('page${page.toString()}');
  }

  Future<ResponseDataClass> getResponseModel(String boxKeyName) async {
    //open local database
    //get the data from the data base
    //transform the data from model responsedataclass to a domain responsedataclass
    //close database
    //return responsedataclass
    //if error throw cache exception

    try {
      final box = await hive.openBox('cities');

      final ResponseDataClassModel responseModel =
          await box.get(boxKeyName) as ResponseDataClassModel;

      final ResponseDataClass responseDataClass = responseModel.toDomain();
      await box.close();
      return responseDataClass;
    } catch (e) {
      throw CacheException();
    }
  }
}
