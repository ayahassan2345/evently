import '../../../core/constant/manager/text_manager.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(TextManager.descriptionHead, style: textTheme.headlineSmall),
        Text(TextManager.descriptionBody, style: textTheme.headlineSmall),
      ],
    );
  }
}
