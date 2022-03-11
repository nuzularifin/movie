import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testcase/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:testcase/features/authentication/presentation/bloc/register_bloc.dart';
import 'package:testcase/features/authentication/presentation/login_pages.dart';
import 'package:testcase/features/movie/presentation/bloc/movie_bloc.dart';
import 'package:testcase/features/movie/presentation/bloc/movie_detail_bloc.dart';
import 'injection_container.dart' as di;

void main() async {
  await di.init();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<MovieBloc>(
        create: (context) => MovieBloc(getAllMoviesUseCase: di.sl())),
    BlocProvider<MovieDetailBloc>(
        create: (context) => MovieDetailBloc(getDetailMovieUseCase: di.sl())),
    BlocProvider<AuthenticationBloc>(
        create: (context) => AuthenticationBloc(getLoginUseCase: di.sl())),
    BlocProvider<RegisterBloc>(
        create: (context) => RegisterBloc(requestRegisterUseCase: di.sl()))
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Movie DB',
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MovieListPages(),
      home: const LoginPages(),
    );
  }
}
