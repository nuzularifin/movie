import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:testcase/core/error/failure.dart';
import 'package:testcase/core/usecases/usecases.dart';
import 'package:testcase/features/movie/domain/entities/popular_movie.dart';
import 'package:testcase/features/movie/domain/repository/movei_repository.dart';

class GetAllMoviesUseCase extends UseCase<PopularMovies, GetAllMoviesParams> {
  final MovieRepository movieRepository;

  GetAllMoviesUseCase({required this.movieRepository});
  @override
  Future<Either<Failure, PopularMovies>> call(GetAllMoviesParams params) async {
    return await movieRepository.getAllMovies(params.page);
  }
}

class GetAllMoviesParams extends Equatable {
  final int page;

  const GetAllMoviesParams({required this.page});

  @override
  List<Object?> get props => [page];
}
