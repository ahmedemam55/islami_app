import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_app/core/setting_provider.dart';
import 'package:islamic_app/features/quran/quran_view.dart';
import 'package:islamic_app/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class QuranDetailsView extends StatefulWidget {
  static const String routeName = 'quranDetailsView';
  const QuranDetailsView({super.key});

  @override
  State<QuranDetailsView> createState() => _QuranDetailsViewState();
}

class _QuranDetailsViewState extends State<QuranDetailsView> {
  List<String> versesList = [];
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var data = ModalRoute.of(context)!.settings.arguments as Suradata;
    var lang = AppLocalizations.of(context)!;
    var provider = Provider.of<SettingProvider>(context);

    if (versesList.isEmpty) {
      loadQuranData(data.suraNumber);
    }
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(provider.getBackGroundImage()),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(title: Text(lang.islami), centerTitle: true),
        body: Container(
          margin: const EdgeInsets.only(
            top: 30,
            bottom: 80,
            left: 30,
            right: 30,
          ),
          padding: EdgeInsets.only(top: 10, bottom: 80, left: 30, right: 30),
          decoration: BoxDecoration(
            color: provider.isDark()
                ? Color(0xFF141A2E).withOpacity(0.8)
                : Colors.white.withOpacity(0.8),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'سورة ${data.suraName} ',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.primaryColor,
                    ),
                  ),
                  SizedBox(width: 15),
                  Icon(
                    Icons.play_circle_fill_rounded,
                    color: provider.isDark()
                        ? theme.primaryColor
                        : Colors.black,
                  ),
                ],
              ),
              Divider(),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        "{${index + 1}} ${versesList[index]}",
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.primaryColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    );
                  },
                  itemCount: versesList.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> loadQuranData(String suraNamber) async {
    String content = await rootBundle.loadString(
      'assets/files/$suraNamber.txt',
    );
    versesList = content.split('\n');
    setState(() {});
  }
}
