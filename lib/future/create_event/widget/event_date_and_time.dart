import '../../../core/constant/manager/color_manager.dart';
import 'package:flutter/material.dart';

class EventDateAndTime extends StatelessWidget {
  final String dataAndTime;
  final String chooseDateAndTime;
  final IconData icon;
  final void Function()? onPressed;
  const EventDateAndTime({
    super.key,
    required this.dataAndTime,
    required this.chooseDateAndTime,
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
        Text(dataAndTime, style: textTheme.headlineSmall),
        Spacer(),
        TextButton(
          onPressed: onPressed,
          child: Text(
            chooseDateAndTime,
            style: textTheme.headlineSmall!.copyWith(
              color: ColorManager.primary,
            ),
          ),
        ),
      ],
    );
  }
}
