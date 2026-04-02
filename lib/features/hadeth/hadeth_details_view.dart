import 'package:flutter/material.dart';
import 'package:islamic_app/core/setting_provider.dart';
import 'package:islamic_app/features/hadeth/hadeth_view.dart';
import 'package:islamic_app/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HadethDetailsView extends StatefulWidget {
  static const String routeName = 'hadethDetailsView';
  const HadethDetailsView({super.key});

  @override
  State<HadethDetailsView> createState() => _HadethDetailsViewState();
}

class _HadethDetailsViewState extends State<HadethDetailsView> {
  List<String> versesList = [];
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var data = ModalRoute.of(context)!.settings.arguments as HadethData;
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
                    data.title,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.primaryColor,
                    ),
                  ),
                ],
              ),
              Divider(),
              Expanded(
                child: ListView(
                  children: [
                    Text(
                      data.bodyContent,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.primaryColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
