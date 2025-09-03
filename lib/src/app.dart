import 'package:app/src/common/theme/theme.dart';
import 'package:app/src/feature/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dev Catbreeds',
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      home: const SplashScreen(),
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      themeMode: ThemeMode.light,
      // mantener escala de fuente
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: TextScaler.noScaling),
          child: child!,
        );
      },
      localizationsDelegates: const [
        // GlobalMaterialLocalizations.delegate,
        // GlobalCupertinoLocalizations.delegate,
        // GlobalWidgetsLocalizations.delegate,
      ],
      // supportedLocales: localizationDelegate.supportedLocales,
      // locale: localizationDelegate.currentLocale,
    );
  }
}
