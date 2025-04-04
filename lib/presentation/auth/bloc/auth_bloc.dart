import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/const/general_state.dart';
import '../../../domain/entities/login_response/login_response.dart';
import '../../../domain/entities/result.dart';
import '../../../domain/usecase/register/register_param.dart';
import '../../../domain/usecase/register/register_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';
part 'auth_bloc.g.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RegisterUsecase registerUsecase;
  AuthBloc({
    required this.registerUsecase,
  }) : super(AuthState()) {
    on<_Register>(_register);
  }

  Future<void> _register(_Register event, emit) async {
    emit(state.copyWith(status: GeneralState.loading));
    var result = await registerUsecase.call(event.params);

    if(result is Success) {
      emit(state.copyWith(status: GeneralState.success, message: result.resultValue ?? ''));
    }else{
      emit(state.copyWith(status: GeneralState.error, message: result.errorMessage ??''));
    }
    
  }
}
