import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/generated/l10n/app_localizations.dart';
import '../../../core/utils/locale_utils.dart';
import '../bloc/l10n/l10n_bloc.dart';

class FlagIconWidget extends StatelessWidget {
  const FlagIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: BlocBuilder<L10nBloc, L10nState>(
        builder: (context, state) {
          return DropdownButtonHideUnderline(
            child: DropdownButton(
              icon: Center(
                child: Text(
                  Localization.getFlag(state.locale.languageCode),
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              items:
                  AppLocalizations.supportedLocales.map((Locale locale) {
                    final flag = Localization.getFlag(locale.languageCode);
                    return DropdownMenuItem(
                      value: locale,
                      child: Center(
                        child: Text(
                          flag,
                          style: Theme.of(context).textTheme.headlineMedium,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }).toList(),
              onChanged: (locale) {
                context.read<L10nBloc>().add(
                  L10nEvent.changeLanguage(locale?.languageCode ?? 'id'),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
