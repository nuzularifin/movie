import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:testcase/core/error/failure.dart';
import 'package:testcase/core/usecases/usecases.dart';
import 'package:testcase/features/movie/domain/entities/movie_detail.dart';
import 'package:testcase/features/movie/domain/repository/movei_repository.dart';

class GetDetailMovieUseCase extends UseCase<MovieDetail, GetDetailMovieParams> {
  final MovieRepository movieRepository;

  GetDetailMovieUseCase({required this.movieRepository});
  @override
  Future<Either<Failure, MovieDetail>> call(GetDetailMovieParams params) async {
    return await movieRepository.getDetailMovies(params.idMovie);
  }
}

class GetDetailMovieParams extends Equatable {
  final int idMovie;

  const GetDetailMovieParams({required this.idMovie});

  @override
  List<Object?> get props => [idMovie];
}
