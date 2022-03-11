import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:testcase/features/authentication/domain/usecases/request_register_usecase.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RequestRegisterUseCase requestRegisterUseCase;
  RegisterBloc({required this.requestRegisterUseCase})
      : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) async {
      if (event is RequestRegisterEvent) {
        emit(RegisterLoadingState());

        if (event.username.isEmpty) {
          emit(RegisterFailedState(message: 'username tidak boleh kosong'));
        } else if (event.password.isEmpty) {
          emit(RegisterFailedState(message: 'password tidak boleh kosong'));
        } else {
          var user = await requestRegisterUseCase(RequestRegisterParams(
              username: event.username, password: event.password));
          user.fold((failure) {
            emit(RegisterFailedState(message: failure.message));
          }, (r) {
            emit(RegisterSuccessState());
          });
        }
      }
    });
  }
}
