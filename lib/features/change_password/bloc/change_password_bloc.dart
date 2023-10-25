
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_smm/entities/types/login_model/login_model.dart';
import 'package:project_smm/features/change_password/api/data_source/change_password_remote_data.dart';
import 'package:project_smm/features/change_password/api/repository/change_password_repository.dart';
import 'package:project_smm/shared/lib/errors/failure/failure.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordBloc() : super(ChangePasswordInitial()) {
    on<ChangePersonPasswordEvent>((event, emit) async {
      emit(ChangePasswordLoadingState());
      final re = await ChangePasswordRepository.changePassword(
          ChangePasswordParams(oldPassword: event.oldPassword, newPassword: event.newPassword));
      re.fold((l) {
        if (l is UnAuthFailure) {
          emit(UnAuthState(message: l.error));
        } else if (l is ServerFailure) {
          emit(ChangePasswordFailedState(message: l.error));
        }
      }, (r) => emit(ChangePasswordDoneState(user: r.user, )));
    });
  }
}
