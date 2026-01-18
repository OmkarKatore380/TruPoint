import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

// State
class ThemeState extends Equatable {
  final ThemeData themeData;
  final String appName;
  final String logoUrl;

  const ThemeState({
    required this.themeData,
    required this.appName,
    required this.logoUrl,
  });

  @override
  List<Object?> get props => [themeData, appName, logoUrl];
}

// Cubit
class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(
    themeData: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
    appName: 'TruPoint',
    logoUrl: 'assets/logo.png',
  ));

  void updateTheme({
    required Color primaryColor,
    required String appName,
    required String logoUrl,
  }) {
    final newTheme = ThemeData(
      primaryColor: primaryColor,
      colorScheme: ColorScheme.fromSeed(seedColor: primaryColor, primary: primaryColor),
      useMaterial3: true,
      appBarTheme: AppBarTheme(backgroundColor: primaryColor),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
      ),
    );

    emit(ThemeState(
      themeData: newTheme,
      appName: appName,
      logoUrl: logoUrl,
    ));
  }
}
