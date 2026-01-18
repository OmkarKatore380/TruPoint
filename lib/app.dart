import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trupoint/config/routes.dart';
import 'package:trupoint/config/themes.dart';
import 'package:trupoint/features/auth/auth_cubit.dart';
import 'package:trupoint/services/firebase/auth_service.dart';

class TruPointApp extends StatelessWidget {
  const TruPointApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => AuthCubit(AuthService()))],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'TruPoint',
        theme: AppThemes.lightTheme,
        routerConfig: AppRoutes.router,
      ),
    );
  }
}
