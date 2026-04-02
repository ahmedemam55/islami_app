import 'package:flutter/material.dart';
import 'package:islamic_app/features/quran/quran_view.dart';

class SuraTitleWidget extends StatelessWidget {
  final Suradata data;

  const SuraTitleWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            data.suraNumber,
            style: theme.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 35, child: VerticalDivider()),
        Expanded(
          child: Text(
            data.suraName,
            style: theme.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
