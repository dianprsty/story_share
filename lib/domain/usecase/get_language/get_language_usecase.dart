import 'package:flutter/material.dart';

import '../../entities/result.dart';
import '../../repository/localization_repository.dart';
import '../usecase.dart';

class GetLanguageUsecase implements UseCase<Result<Locale>, void> {
  final LocalizationRepository _localizationRepository;

  GetLanguageUsecase({required LocalizationRepository localizationRepository})
    : _localizationRepository = localizationRepository;
  @override
  Future<Result<Locale>> call(void params) async {
    return await _localizationRepository.getLanguage();
  }
}
