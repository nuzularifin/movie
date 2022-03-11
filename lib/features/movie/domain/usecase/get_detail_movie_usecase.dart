import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:testcase/core/error/failure.dart';
import 'package:testcase/core/usecases/usecases.dart';
import 'package:testcase/features/movie/domain/entities/movie_detail.dart';

class GetDetailMovieUseCase
    extends UseCase<MovieDetails, GetDetailMovieParams> {
  @override
  Future<Either<Failure, MovieDetails>> call(GetDetailMovieParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}

class GetDetailMovieParams extends Equatable {
  final int idMovie;

  const GetDetailMovieParams({required this.idMovie});

  @override
  List<Object?> get props => [idMovie];
}
