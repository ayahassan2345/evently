import 'package:evently/core/constant/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final localization = AppLocalizations.of(context)!;
    return Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(localization.descriptionHead, style: textTheme.headlineSmall),
        Text(localization.descriptionBody, style: textTheme.headlineSmall),
      ],
    );
  }
}
