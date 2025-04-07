part of 'l10n_bloc.dart';

@freezed
abstract class L10nState with _$L10nState {
  const factory L10nState({
    @Default(GeneralState.initial) GeneralState status,
    @Default(Locale('id')) Locale locale
  }) = _L10nState;
}
