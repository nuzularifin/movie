import 'package:dartz/dartz.dart';
import 'package:testcase/core/error/failure.dart';
import 'package:testcase/features/movie/domain/entities/movie_detail.dart';
import 'package:testcase/features/movie/domain/entities/popular_movie.dart';

abstract class MovieRepository {
  Future<Either<Failure, PopularMovies>> getAllMovies(int page);
  Future<Either<Failure, MovieDetail>> getDetailMovies(int idMovies);
}
