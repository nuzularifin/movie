part of 'movie_detail_bloc.dart';

abstract class MovieDetailState extends Equatable {
  const MovieDetailState();

  @override
  List<Object> get props => [];
}

class MovieDetailInitial extends MovieDetailState {}

class MovieDetailLoadingState extends MovieDetailState {}

class MovieDetailFailureState extends MovieDetailState {
  final String message;

  const MovieDetailFailureState({required this.message});
}

class DetailNoInternetConnectionState extends MovieDetailState {
  final String message;

  const DetailNoInternetConnectionState({required this.message});
}

class MovieDetailLoadedState extends MovieDetailState {
  final MovieDetail movieDetail;

  const MovieDetailLoadedState({required this.movieDetail});
}
