import 'package:testcase/core/error/exceptions.dart';
import 'package:testcase/core/network/network_info.dart';
import 'package:testcase/features/movie/data/datasource/movie_remote_data_source.dart';
import 'package:testcase/features/movie/domain/entities/movie_detail.dart';
import 'package:testcase/features/movie/domain/entities/popular_movie.dart';
import 'package:testcase/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:testcase/features/movie/domain/repository/movei_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  MovieRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});
  @override
  Future<Either<Failure, PopularMovies>> getAllMovies(int page) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await remoteDataSource.getAllMovies(page));
      } on ServerException catch (e) {
        return Left(ServerFailure(e.errorMessage));
      }
    } else {
      return Left(ServerFailure("No Internet Connection"));
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getDetailMovies(int idMovies) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await remoteDataSource.getDetailMovies(idMovies));
      } on ServerException catch (e) {
        return Left(ServerFailure(e.errorMessage));
      }
    } else {
      return Left(ServerFailure("No Internet Connection"));
    }
  }
}
