import '../../../core/constant/manager/icon_manager.dart';
import '../../../core/constant/manager/color_manager.dart';
import '../../../core/constant/manager/text_manager.dart';
import '../../../core/main/widgets/choose_event_location.dart';
import 'package:flutter/material.dart';

class EventDate extends StatelessWidget {
  const EventDate({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ColorManager.primary),
      ),
      child: Row(
        spacing: 5,
        children: [
          DetailsIcon(detailsIcon: IconManager.calendarMonth),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TextManager.date,
                style: textTheme.headlineSmall!.copyWith(
                  color: ColorManager.primary,
                ),
              ),
              Text(TextManager.time, style: textTheme.headlineSmall),
            ],
          ),
        ],
      ),
    );
  }
}
