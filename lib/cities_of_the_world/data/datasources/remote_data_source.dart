import 'dart:convert';

import 'package:cities_of_the_world_demo/cities_of_the_world/data/datasources/local_data_source.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/data/models/responsedata/response_model.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/domain/entities/response.dart';
import 'package:cities_of_the_world_demo/core/error/exceptions.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

abstract class CitiesOfTheWorldRemoteDataSource {
  Future<ResponseDataClass> getFilteredCitiesWithCountries(String filter);
  Future<ResponseDataClass> getCitiesAndCountriesAtPage(int page);
  Future<ResponseDataClass> getFilteredCitiesAndCountriesAtPage(
      int page, String filter);
}

//lazysingleton is for dependency injection purposes

@LazySingleton(as: CitiesOfTheWorldRemoteDataSource)
class CitiesOfTheWorldRemoteDataSourceImpl
    extends CitiesOfTheWorldRemoteDataSource {
  final http.Client client;
  final CitiesOfTheWorldLocalDataSource localDataSource;
  CitiesOfTheWorldRemoteDataSourceImpl(
      {@required this.client, @required this.localDataSource});
  @override
  Future<ResponseDataClass> getCitiesAndCountriesAtPage(int page) async {
    return getResponseDataClass(
        'http://connect-demo.mobile1.io/square1/connect/v1/city?page=${page.toString()}&include=country',
        page);
  }

  @override
  Future<ResponseDataClass> getFilteredCitiesWithCountries(
      String filter) async {
    return getResponseDataClass(
        'http://connect-demo.mobile1.io/square1/connect/v1/city?filter[0][name][contains]=$filter&include=country',
        null);
  }

  @override
  Future<ResponseDataClass> getFilteredCitiesAndCountriesAtPage(
      int page, String filter) async {
    return getResponseDataClass(
        'http://connect-demo.mobile1.io/square1/connect/v1/city?filter[0][name][contains]=$filter&page=$page&include=country',
        null);
  }

  Future<ResponseDataClass> getResponseDataClass(String url, int page) async {
    final response = await client.get(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    ); //get the data from the api
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body); //decode the data
      final responseDataClassModel = ResponseDataClassModel.fromJson(
          decodeData['data'] as Map<String,
              dynamic>); //transform the data to responsedataclass model
      if (page != null) {
        localDataSource.cacheResponseData(
            responseDataClassModel, page); //cached the data
      }
      return responseDataClassModel
          .toDomain(); //transform the model to a domain responsedataclass and return it
    } else {
      throw ServerException(); // if error throw a ServerException
    }
  }
}
