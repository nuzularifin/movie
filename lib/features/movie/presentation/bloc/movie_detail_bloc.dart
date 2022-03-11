import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:testcase/features/movie/domain/entities/movie_detail.dart';
import 'package:testcase/features/movie/domain/usecase/get_detail_movie_usecase.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetDetailMovieUseCase getDetailMovieUseCase;

  MovieDetailBloc({required this.getDetailMovieUseCase})
      : super(MovieDetailInitial()) {
    on<MovieDetailEvent>((event, emit) async {
      if (event is GetDetailMovieEvent) {
        emit(MovieDetailLoadingState());
        var response = await getDetailMovieUseCase(
            GetDetailMovieParams(idMovie: event.idMovie));

        response.fold((failure) {
          if (failure.message == 'No Internet Connection') {
            emit(DetailNoInternetConnectionState(message: failure.message));
          } else {
            emit(MovieDetailFailureState(message: failure.message));
          }
        }, (success) {
          emit(MovieDetailLoadedState(movieDetail: success));
        });
      } else if (event is RefreshDetailMovieEvent) {
        emit(MovieDetailLoadingState());
        Future.delayed(const Duration(milliseconds: 2000), () {
          add(GetDetailMovieEvent(idMovie: event.idMovie));
        });
      }
    });
  }
}
