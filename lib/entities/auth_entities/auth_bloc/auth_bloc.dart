import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_smm/shared/api/login_api/data_source/login_remote_data.dart';
import 'package:project_smm/shared/api/login_api/repository/login_repository.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginEvent>((event, emit) async {
      emit(AuthLoadingState());
final re = await LoginRepository.login(LoginParams(login: event.login, password: event.password));
print(re.user!.token);
      if (event.login == 'admin' && event.password == '66962tgv') {
        const token = 'adeq9awo8ue80237403qw4u02q4';
        emit(AuthDoneState(token: token));
      } else {
        emit(AuthFailedState(message: 'Неверный логин или пароль'));
      }
    });
  }
}
