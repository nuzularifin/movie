import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:testcase/core/error/failure.dart';
import 'package:testcase/core/utils/global_function.dart';
import 'package:testcase/features/authentication/data/datasource/authentication_local_data_source.dart';
import 'package:testcase/features/authentication/domain/usecases/get_login_usecase.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationLocalDataSource authenticationLocalDataSource;
  final GetLoginUseCase getLoginUseCase;

  AuthenticationBloc({
    required this.getLoginUseCase,
    required this.authenticationLocalDataSource,
  }) : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) async {
      if (event is RequestLoginEvent) {
        emit(AuthenticationLoadingState());

        if (event.username.isEmpty && event.password.isEmpty) {
          emit(const AuthenticationFailedState(
              message:
                  'Form tidak boleh kosong, mohon cek kembali data yang anda inputkan'));
        } else if (event.username.isEmpty) {
          emit(const AuthenticationFailedState(
              message: 'Email tidak boleh kosong'));
        } else if (event.password.isEmpty) {
          emit(const AuthenticationFailedState(
              message: 'Password tidak boleh kosong'));
        } else if (!GlobalFunction().checkingValidateEmail(event.username)) {
          emit(const AuthenticationFailedState(message: 'Email tidak valid'));
        } else {
          var status = await getLoginUseCase(GetLoginParams(
              username: event.username, password: event.password));
          status.fold((failure) {
            emit(AuthenticationFailedState(message: failure.message));
          }, (success) async {
            await authenticationLocalDataSource.saveStatusLogin(true);
            emit(AuthenticationSuccessState());
          });
        }
      }
    });
    on<CheckingStatusLoginEvent>((event, emit) async {
      if (event is CheckingStatusLoginEvent) {
        bool authenticateLogin = false;
        authenticateLogin =
            await authenticationLocalDataSource.checkStatusLogin();
        if (authenticateLogin) {
          emit(OpenDashboardState());
        } else {
          emit(OpenLoginState());
        }
      }
    });
  }
}
