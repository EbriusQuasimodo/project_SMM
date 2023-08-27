import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_smm/shared/api/login_api/data_source/login_remote_data.dart';
import 'package:project_smm/shared/api/login_api/repository/login_repository.dart';
import 'package:project_smm/shared/lib/errors/failure/failure.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginEvent>((event, emit) async {
      emit(AuthLoadingState());
      final re = await LoginRepository.login(
          LoginParams(login: event.login, password: event.password));
      re.fold((l) {
        if (l is UnAuthFailure) {
          emit(UnAuthState(message: l.error));
        } else if (l is ServerFailure) {
          emit(AuthFailedState(message: l.error));
        }
      }, (r) => emit(AuthDoneState(token: r.user!.token)));
    });
  }
}
