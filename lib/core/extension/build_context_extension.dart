import 'package:flutter/material.dart';

import '../generated/l10n/app_localizations.dart';

extension ContextExtensions on BuildContext {
  void showSnackBar(String message, {bool success = true}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: success ? Colors.green : Colors.red,
      ),
    );
  }

  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
