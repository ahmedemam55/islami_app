import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:islamic_app/core/setting_provider.dart';
import 'package:islamic_app/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatefulWidget {
  static const String routeName = 'settingsView';
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  List<String> _language = ['English', 'عربي'];
  List<String> _theme = ['Light', 'Dark'];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var lang = AppLocalizations.of(context)!;
    var provider = Provider.of<SettingProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(lang.language, style: theme.textTheme.bodyLarge),
          SizedBox(height: 20),
          CustomDropdown<String>(
            // hintText: 'Select job role',
            items: _language,
            initialItem: provider.currentLanguage == 'en'
                ? _language[0]
                : _language[1],
            onChanged: (value) {
              if (value == 'English') {
                provider.changeCurrentLanguage('en');
              }
              if (value == 'عربي') {
                provider.changeCurrentLanguage('ar');
              }
            },
            decoration: CustomDropdownDecoration(
              closedFillColor: provider.isDark()
                  ? Color(0xFF141A2E)
                  : Colors.white,
              expandedFillColor: provider.isDark()
                  ? Color(0xFF141A2E)
                  : Colors.white,
              closedSuffixIcon: Icon(
                Icons.arrow_drop_down,
                color: provider.isDark() ? theme.primaryColor : Colors.black,
              ),
              expandedSuffixIcon: Icon(
                Icons.arrow_drop_up,
                color: provider.isDark() ? theme.primaryColor : Colors.black,
              ),
            ),
          ),
          SizedBox(height: 40),
          Text(lang.theme_mode, style: theme.textTheme.bodyLarge),
          SizedBox(height: 20),
          CustomDropdown<String>(
            // hintText: 'Select job role',
            items: _theme,
            initialItem: provider.currentThemeMode == ThemeMode.light
                ? _theme[0]
                : _theme[1],
            onChanged: (value) {
              if (value == 'Light') {
                provider.changeCurrentThemeMode(ThemeMode.light);
              }
              if (value == 'Dark') {
                provider.changeCurrentThemeMode(ThemeMode.dark);
              }
            },

            decoration: CustomDropdownDecoration(
              closedFillColor: provider.isDark()
                  ? Color(0xFF141A2E)
                  : Colors.white,
              expandedFillColor: provider.isDark()
                  ? Color(0xFF141A2E)
                  : Colors.white,
              closedSuffixIcon: Icon(
                Icons.arrow_drop_down,
                color: provider.isDark() ? theme.primaryColor : Colors.black,
              ),
              expandedSuffixIcon: Icon(
                Icons.arrow_drop_up,
                color: provider.isDark() ? theme.primaryColor : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
