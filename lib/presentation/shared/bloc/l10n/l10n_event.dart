part of 'l10n_bloc.dart';

@freezed
class L10nEvent with _$L10nEvent {
  const factory L10nEvent.getLanguage() = _GetLanguage;
  const factory L10nEvent.changeLanguage(String language) = _ChangeLanguage;
}