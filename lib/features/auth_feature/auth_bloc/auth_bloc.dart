
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginEvent>((event, emit) async {
      emit(AuthLoadingState());
      if (event.login == 'admin' && event.password == '66962tgv') {
        const token = 'adeq9awo8ue80237403qw4u02q4';
        emit(AuthDoneState(token: token));
      } else {
        emit(AuthFailedState(message: 'Неверный логин или пароль'));
      }
    });

    on<AuthStartEvent>((event, emit) {
      emit(AuthStartState());
    });
  }
}
