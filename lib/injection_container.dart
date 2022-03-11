import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:testcase/core/network/network_info.dart';
import 'package:testcase/features/authentication/domain/usecases/get_login_usecase.dart';
import 'package:testcase/features/movie/data/datasource/movie_remote_data_source.dart';
import 'package:testcase/features/movie/data/repository/movie_repository_impl.dart';
import 'package:testcase/features/movie/domain/repository/movei_repository.dart';
import 'package:testcase/features/movie/domain/usecase/get_all_movies_usecase.dart';
import 'package:testcase/features/movie/presentation/bloc/movie_bloc.dart';

import 'core/network/dio_service.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //? BlocStuff
  sl.registerLazySingleton(() => MovieBloc(getAllMoviesUseCase: sl()));

  //? Datasource Stuff
  sl.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(dioService: sl()));

  //? Core Stuff
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => DioService());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //? Repository Stuff
  sl.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(networkInfo: sl(), remoteDataSource: sl()));

  //? Usercase Stuff
  sl.registerLazySingleton(
      () => GetLoginUseCase(authenticationRepository: sl()));
  sl.registerLazySingleton(() => GetAllMoviesUseCase(movieRepository: sl()));
}
