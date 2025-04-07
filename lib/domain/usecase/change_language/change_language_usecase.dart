import 'package:flutter/widgets.dart';

import '../../entities/result.dart';
import '../../repository/localization_repository.dart';
import '../usecase.dart';

class ChangeLanguageUsecase implements UseCase<Result<Locale>, String> {
  final LocalizationRepository _localizationRepository;

  ChangeLanguageUsecase({
    required LocalizationRepository localizationRepository,
  }) : _localizationRepository = localizationRepository;

  @override
  Future<Result<Locale>> call(String params) async {
    return await _localizationRepository.changeLanguage(params);
  }
}
