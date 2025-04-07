import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/service/theme_service.dart';

part 'theme_event.dart';
part 'theme_state.dart';
part 'theme_bloc.freezed.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final ThemeService _themeService;

  ThemeBloc(this._themeService)
      : super(ThemeState(themeMode: _themeService.getTheme())) {
    on<_LoadTheme>((event, emit) {
      emit(ThemeState(themeMode: _themeService.getTheme()));
    });

    on<_ToggleTheme>((event, emit) async {
       _themeService.toggleTheme();
      emit(ThemeState(themeMode: _themeService.getTheme()));
    });
  }
}
