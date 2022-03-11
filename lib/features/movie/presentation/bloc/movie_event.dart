part of 'movie_bloc.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}

class GetAllMoviesEvent extends MovieEvent {
  final int page;

  const GetAllMoviesEvent({required this.page});
}

class GetAllMoviesNextPageEvent extends MovieEvent {
  final int page;

  const GetAllMoviesNextPageEvent({required this.page});
}

class RefreshGetMovies extends MovieEvent {}
