import 'package:dio/dio.dart';
import 'package:testcase/core/error/exceptions.dart';
import 'package:testcase/core/network/dio_handling_response.dart';
import 'package:testcase/core/network/dio_service.dart';
import 'package:testcase/core/network/endpoint_variable.dart';
import 'package:testcase/core/utils/global_variables.dart';
import 'package:testcase/features/movie/data/models/popular_movies_model.dart';
import 'package:testcase/features/movie/domain/entities/popular_movie.dart';

abstract class MovieRemoteDataSource {
  Future<PopularMoviesModel> getAllMovies(int page);
  Future<PopularMovies> getDetailMovies(int idMovie);
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final DioService dioService;

  MovieRemoteDataSourceImpl({required this.dioService});

  @override
  Future<PopularMoviesModel> getAllMovies(int page) async {
    try {
      dioService.settingLog();
      var response = await dioService.dio.get(EndpointVariable.getAllMovies,
          queryParameters: {"page": page, "api_key": GlobalVariables.apiKey});
      if (response.statusCode == 200) {
        PopularMoviesModel popularMovies =
            PopularMoviesModel.fromJson(response.data);
        return popularMovies;
      } else {
        throw ServerException(errorMessage: 'Unknow Error', code: 500);
      }
    } on DioError catch (e) {
      throw DioHandlingResponse(e).setThrow();
    }
  }

  @override
  Future<PopularMovies> getDetailMovies(int idMovie) async {
    try {
      dioService.settingLog();
      var response = await dioService.dio.get(
          EndpointVariable.getDetailMovies + "/$idMovie",
          queryParameters: {"api_key": GlobalVariables.apiKey});
      if (response.statusCode == 200) {
        PopularMoviesModel popularMovies =
            PopularMoviesModel.fromJson(response.data);
        return popularMovies;
      } else {
        throw ServerException(errorMessage: 'Unknow Error', code: 500);
      }
    } on DioError catch (e) {
      throw DioHandlingResponse(e).setThrow();
    }
  }
}
