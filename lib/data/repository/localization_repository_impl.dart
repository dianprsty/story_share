import 'dart:ui';

import '../../domain/entities/result.dart';
import '../../domain/repository/localization_repository.dart';
import '../datasource/local/localization_local_datasource.dart';

class LocalizationRepositoryImpl implements LocalizationRepository {
  final LocalizationLocalDataSource _localizationLocalDataSource;

  LocalizationRepositoryImpl({
    required LocalizationLocalDataSource localizationLocalDataSource,
  }) : _localizationLocalDataSource = localizationLocalDataSource;

  @override
  Future<Result<Locale>> getLanguage() async {
    String language = await _localizationLocalDataSource.getLanguage();
    return Result.success(_stringToLocale(language));
  }

  @override
  Future<Result<Locale>> changeLanguage(String language) async {
    String lang = await _localizationLocalDataSource.changeLanguage(language);
    return Result.success(_stringToLocale(lang));
  }

  Locale _stringToLocale(String language) {
    return language == 'en'
        ? const Locale('en', 'US')
        : const Locale('id', 'ID');
  }
}
