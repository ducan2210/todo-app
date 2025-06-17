import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'language_event.dart';
import 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(const LanguageState(locale: Locale('en'))) {
    on<ChangeLanguage>((event, emit) {
      emit(LanguageState(locale: event.locale));
    });
  }
}
