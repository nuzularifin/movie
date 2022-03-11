import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:testcase/features/movie/domain/entities/results.dart';
import 'package:testcase/features/movie/domain/usecase/get_all_movies_usecase.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetAllMoviesUseCase getAllMoviesUseCase;

  MovieBloc({required this.getAllMoviesUseCase}) : super(MovieInitial()) {
    on<MovieEvent>((event, emit) async {
      if (event is GetAllMoviesEvent) {
        emit(MovieLoadingState());
        var result =
            await getAllMoviesUseCase(GetAllMoviesParams(page: event.page));
        result.fold((failure) {
          if (failure.message == 'No Internet Connection') {
            emit(NoInternetConnectionState(message: failure.message));
          } else {
            emit(MovieFailureState(message: failure.message));
          }
        }, (success) {
          if (success.results!.isEmpty) {
            emit(MovieEmptyState());
          } else {
            emit(MovieLoadedState(movieResult: success.results!));
          }
        });
      } else if (event is RefreshGetMovies) {
        emit(MovieLoadingState());
        Future.delayed(const Duration(milliseconds: 2000), () {
          add(GetAllMoviesEvent(page: 1));
        });
      }
    });
  }
}
