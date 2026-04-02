import 'package:flutter/material.dart';
import 'package:islamic_app/core/setting_provider.dart';
import 'package:islamic_app/core/theme/app_theme_manager.dart';
import 'package:islamic_app/features/hadeth/hadeth_details_view.dart';
import 'package:islamic_app/features/hadeth/hadeth_view.dart';
import 'package:islamic_app/features/quran/quran_details_view.dart';
import 'package:islamic_app/features/quran/quran_view.dart';
import 'package:islamic_app/features/radio/radio_view.dart';
import 'package:islamic_app/features/sebha/sebha_view.dart';
import 'package:islamic_app/features/settings/settings_view.dart';
import 'package:islamic_app/features/splash/splash_view.dart';
import 'package:islamic_app/layout/layout_view.dart';
import 'package:islamic_app/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<SettingProvider>(
      create: (context) => SettingProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    return MaterialApp(
      title: 'Islamic App',
      debugShowCheckedModeBanner: false,
      locale: Locale(provider.currentLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppThemeManager.lightTheme,
      themeMode: provider.currentThemeMode,
      darkTheme: AppThemeManager.darkTheme,
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName: (context) => const SplashView(),
        LayoutView.routeName: (context) => const LayoutView(),
        QuranView.routeName: (context) => const QuranView(),
        HadethView.routeName: (context) => const HadethView(),
        RadioView.routeName: (context) => const RadioView(),
        SebhaView.routeName: (context) => const SebhaView(),
        SettingsView.routeName: (context) => const SettingsView(),
        QuranDetailsView.routeName: (context) => const QuranDetailsView(),
        HadethDetailsView.routeName: (context) => const HadethDetailsView(),
      },
    );
  }
}
