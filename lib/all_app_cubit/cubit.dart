// @dart=2.9
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_projects/shared/network/local/cache_helper.dart';
import 'states.dart';

class AllAppCubit extends Cubit<AllAppStates> {
  AllAppCubit() : super(AppInitialStates());

  static AllAppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  bool isDark = false;
  ThemeMode appMode = ThemeMode.dark;

  void changeAppMode({bool fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(AllAppChangeThemeMode());
    } else {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(AllAppChangeThemeMode());
      });
    }
  }
}
