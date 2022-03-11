part of 'movie_bloc.dart';

abstract class MovieState {
  const MovieState();

  @override
  List<Object> get props => [];
}

class MovieInitial extends MovieState {}

class MovieLoadingState extends MovieState {}

class MovieEmptyState extends MovieState {}

class MovieFailureState extends MovieState {
  final String message;

  const MovieFailureState({required this.message});
}

class NoInternetConnectionState extends MovieState {
  final String message;

  const NoInternetConnectionState({required this.message});
}

class MovieLoadedState extends MovieState {
  final List<Results> movieResult;

  const MovieLoadedState({required this.movieResult});
}

class LoadedMoreOrder extends MovieLoadedState {
  final List<Results> movieResult;

  const LoadedMoreOrder({required this.movieResult})
      : super(movieResult: movieResult);

  @override
  String toString() {
    return '''PostState {movie_list: ${movieResult.length} }''';
  }
}

class NextPageState extends MovieState {}

class LastPageState extends MovieState {}
