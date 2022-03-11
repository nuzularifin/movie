import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testcase/features/movie/presentation/bloc/movie_bloc.dart';
import 'package:testcase/features/movie/presentation/bloc/movie_detail_bloc.dart';
import 'package:testcase/features/movie/presentation/movie_list_pages.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

void main() async {
  await di.init();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<MovieBloc>(
        create: (context) => MovieBloc(getAllMoviesUseCase: di.sl())),
    BlocProvider<MovieDetailBloc>(
        create: (context) => MovieDetailBloc(getDetailMovieUseCase: di.sl()))
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Movie DB',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MovieListPages(),
    );
  }
}
