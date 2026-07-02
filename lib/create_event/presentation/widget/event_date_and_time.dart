import '../../../core/constant/manager/color_manager.dart';
import 'package:flutter/material.dart';

class DateTimeWidgetStyle extends StatelessWidget {
  final String timeOrDate;
  final String chooseDateOrTimeButton;
  final IconData icon;
  final void Function()? onPressed;
  const DateTimeWidgetStyle({
    super.key,
    required this.timeOrDate,
    required this.chooseDateOrTimeButton,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        Icon(icon, size: 24),
        SizedBox(width: 5),
        Text(timeOrDate, style: textTheme.headlineSmall),
        Spacer(),
        TextButton(
          onPressed: onPressed,
          child: Text(
            chooseDateOrTimeButton,
            style: textTheme.headlineSmall!.copyWith(
              color: ColorManager.primary,
            ),
          ),
        ),
      ],
    );
  }
}
