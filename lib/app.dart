import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tofan/core/routes/app_router.dart';
import 'package:tofan/core/routes/routes.dart';
import 'package:tofan/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class TofanApp extends StatelessWidget {
  const TofanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('ar', 'YE'),
            ],
            locale: const Locale('ar', 'YE'),
            title: 'Tofan',
            debugShowCheckedModeBanner: false,
            theme: AppThemeData.lightTheme(),
            darkTheme: AppThemeData.darkTheme(),
            initialRoute: Routes.splash,
            onGenerateRoute: AppRoute.onGenerateRoute,
            // theme:
          );
        });
  }
}