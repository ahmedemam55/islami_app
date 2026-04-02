import 'package:flutter/material.dart';
import 'package:islamic_app/core/setting_provider.dart';
import 'package:islamic_app/features/hadeth/hadeth_view.dart';
import 'package:islamic_app/features/quran/quran_view.dart';
import 'package:islamic_app/features/radio/radio_view.dart';
import 'package:islamic_app/features/sebha/sebha_view.dart';
import 'package:islamic_app/features/settings/settings_view.dart';
import 'package:islamic_app/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  static const String routeName = 'layoutView';

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int selectedIndex = 0;
  List<Widget> screenList = [
    QuranView(),
    HadethView(),
    SebhaView(),
    RadioView(),
    SettingsView(),
  ];
  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;
    var provider = Provider.of<SettingProvider>(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(provider.getBackGroundImage()),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(title: Text(lang.islami), centerTitle: true),
        body: screenList[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              icon: const ImageIcon(AssetImage('assets/images/icon_quran.png')),
              label: lang.quran,
            ),
            BottomNavigationBarItem(
              icon: const ImageIcon(
                AssetImage('assets/images/icon_hadeth.png'),
              ),
              label: lang.hadith,
            ),
            BottomNavigationBarItem(
              icon: const ImageIcon(AssetImage('assets/images/icon_sebha.png')),
              label: lang.tasbeh,
            ),
            BottomNavigationBarItem(
              icon: const ImageIcon(AssetImage('assets/images/icon_radio.png')),
              label: lang.radio,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.settings),
              label: lang.settings,
            ),
          ],
        ),
      ),
    );
  }
}
