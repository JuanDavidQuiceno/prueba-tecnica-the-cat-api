import 'package:app/flavors.dart';
import 'package:app/src/common/bloc/auth/auth_bloc.dart';
import 'package:app/src/common/bloc/theme/theme_cubit.dart';
import 'package:app/src/common/theme/theme.dart';
import 'package:app/src/feature/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (_, state) {
          return MaterialApp(
            title: FlavorsConfig.title,
            debugShowCheckedModeBanner: false,
            initialRoute: SplashScreen.routeName,
            home: const SplashScreen(),
            theme: AppThemes.light,
            darkTheme: AppThemes.dark,
            themeMode: state,
            // mantener escala de fuente
            builder: (_, child) {
              return MediaQuery(
                data: MediaQuery.of(
                  context,
                ).copyWith(textScaler: TextScaler.noScaling),
                child: child!,
              );
            },
          );
        },
      ),
    );
  }
}
