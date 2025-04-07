import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/constant/general_state.dart';
import '../../../../domain/usecase/change_language/change_language_usecase.dart';
import '../../../../domain/usecase/get_language/get_language_usecase.dart';

part 'l10n_event.dart';
part 'l10n_state.dart';
part 'l10n_bloc.freezed.dart';

class L10nBloc extends Bloc<L10nEvent, L10nState> {
  final GetLanguageUsecase getLanguageUsecase;
  final ChangeLanguageUsecase changeLanguageUsecase;
  L10nBloc({
    required this.getLanguageUsecase,
    required this.changeLanguageUsecase,
  }) : super(L10nState()) {
    on<_ChangeLanguage>(_changeLanguage);
    on<_GetLanguage>(_getLanguage);
  }

  void _getLanguage(_GetLanguage event, Emitter<L10nState> emit) async {
    emit(state.copyWith(status: GeneralState.loading));

    var result = await getLanguageUsecase.call(null);

    emit(
      state.copyWith(
        status: GeneralState.success,
        locale: result.resultValue ?? Locale('id'),
      ),
    );
  }

  void _changeLanguage(_ChangeLanguage event, Emitter<L10nState> emit) async {
    emit(state.copyWith(status: GeneralState.loading));

    var result = await changeLanguageUsecase.call(event.language);

    emit(
      state.copyWith(
        status: GeneralState.success,
        locale: result.resultValue ?? Locale('id'),
      ),
    );
  }
}
