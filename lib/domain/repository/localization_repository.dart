import 'package:flutter/material.dart';

import '../entities/result.dart';

abstract interface class LocalizationRepository {
  Future<Result<Locale>> getLanguage();
  Future<Result<Locale>> changeLanguage(String language);
}