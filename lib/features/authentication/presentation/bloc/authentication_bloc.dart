import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:testcase/core/error/failure.dart';
import 'package:testcase/features/authentication/domain/usecases/get_login_usecase.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final GetLoginUseCase getLoginUseCase;
  AuthenticationBloc({required this.getLoginUseCase})
      : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) async {
      if (event is RequestLoginEvent) {
        emit(AuthenticationLoadingState());
        var status = await getLoginUseCase(
            GetLoginParams(username: event.username, password: event.password));
        status.fold((failure) {
          emit(AuthenticationFailedState(message: failure.message));
        }, (success) {
          emit(AuthenticationSuccessState());
        });
      }
    });
  }
}
