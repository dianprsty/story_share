import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/constant/general_state.dart';
import '../../../domain/entities/result.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../domain/usecase/login/login_param.dart';
import '../../../domain/usecase/login/login_usecase.dart';
import '../../../domain/usecase/logout/logout_usecase.dart';
import '../../../domain/usecase/register/register_param.dart';
import '../../../domain/usecase/register/register_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RegisterUsecase registerUsecase;
  final LoginUsecase loginUsecase;
  final LogoutUsecase logoutUsecase;

  AuthBloc({
    required this.registerUsecase,
    required this.loginUsecase,
    required this.logoutUsecase,
  }) : super(AuthState()) {
    on<_Register>(_register);
    on<_Login>(_login);
    on<_Logout>(_logout);
  }

  Future<void> _register(_Register event, emit) async {
    emit(state.copyWith(status: GeneralState.loading));
    var result = await registerUsecase.call(event.params);

    if (result is Success) {
      emit(
        state.copyWith(
          status: GeneralState.success,
          message: result.resultValue ?? '',
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: GeneralState.error,
          message: result.errorMessage ?? '',
        ),
      );
    }
  }

  Future<void> _login(_Login event, emit) async {
    emit(state.copyWith(status: GeneralState.loading));
    var result = await loginUsecase.call(event.params);

    if (result is Success) {
      emit(
        state.copyWith(
          status: GeneralState.success,
          userEntity: result.resultValue!,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: GeneralState.error,
          message: result.errorMessage ?? '',
        ),
      );
    }
  }

  Future<void> _logout(_Logout event, emit) async {
    emit(state.copyWith(status: GeneralState.loading));

    await logoutUsecase.call(null);

    emit(AuthState());
  }
}
