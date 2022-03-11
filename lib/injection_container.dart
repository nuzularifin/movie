import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:testcase/core/network/network_info.dart';
import 'package:testcase/features/authentication/data/datasource/authentication_local_data_source.dart';
import 'package:testcase/features/authentication/data/repository/authentication_repository_impl.dart';
import 'package:testcase/features/authentication/domain/repository/authentication_repository.dart';
import 'package:testcase/features/authentication/domain/usecases/get_login_usecase.dart';
import 'package:testcase/features/authentication/domain/usecases/request_register_usecase.dart';
import 'package:testcase/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:testcase/features/authentication/presentation/bloc/register_bloc.dart';
import 'package:testcase/features/movie/data/datasource/movie_remote_data_source.dart';
import 'package:testcase/features/movie/data/repository/movie_repository_impl.dart';
import 'package:testcase/features/movie/domain/repository/movei_repository.dart';
import 'package:testcase/features/movie/domain/usecase/get_all_movies_usecase.dart';
import 'package:testcase/features/movie/domain/usecase/get_detail_movie_usecase.dart';
import 'package:testcase/features/movie/presentation/bloc/movie_bloc.dart';
import 'package:testcase/features/movie/presentation/bloc/movie_detail_bloc.dart';

import 'core/network/dio_service.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //? BlocStuff
  sl.registerLazySingleton(() => MovieBloc(getAllMoviesUseCase: sl()));
  sl.registerLazySingleton(() => MovieDetailBloc(getDetailMovieUseCase: sl()));
  sl.registerLazySingleton(() => AuthenticationBloc(getLoginUseCase: sl()));
  sl.registerLazySingleton(() => RegisterBloc(requestRegisterUseCase: sl()));

  //? Datasource Stuff
  sl.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(dioService: sl()));
  sl.registerLazySingleton<AuthenticationLocalDataSource>(
      () => AuthenticationLocalDataSourceImpl());

  //? Core Stuff
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => DioService());
  // sl.registerLazySingleton(() => UserDatabase());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //? Repository Stuff
  sl.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(networkInfo: sl(), remoteDataSource: sl()));
  sl.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(authenticationLocalDataSource: sl()));

  //? Usercase Stuff
  sl.registerLazySingleton(
      () => GetLoginUseCase(authenticationRepository: sl()));
  sl.registerLazySingleton(() => GetAllMoviesUseCase(movieRepository: sl()));
  sl.registerLazySingleton(() => GetDetailMovieUseCase(movieRepository: sl()));
  sl.registerLazySingleton(
      () => RequestRegisterUseCase(authenticationRepository: sl()));
}
