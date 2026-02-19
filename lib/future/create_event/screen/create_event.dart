import 'package:evently/core/constant/l10n/app_localizations.dart';
import '../../../core/constant/manager/icon_manager.dart';
import '../../../core/constant/manager/color_manager.dart';
import '../../../core/widget/main_button.dart';
import '../../../core/widget/main_text_field.dart';
import '../widget/event_date_and_time.dart';
import '../../../core/widget/choose_event_location.dart';
import '../../../core/constant/manager/image_manager.dart';
import '../../../core/widget/categories.dart';
import 'package:flutter/material.dart';

class CreateEvent extends StatelessWidget {
  const CreateEvent({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(localization.createEvent)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCreateEventImage(),
              _buildCategories(context),
              _buildEventTextFormField(context, localization),
              _buildEventDateAndTime(localization),
              Text(
                localization.location,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              ChooseEventLocation(location: localization.chooseLocation),
              MainButton(text: localization.createEvent, onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }

  Categories _buildCategories(BuildContext context) {
    return Categories(
      borderColor: ColorManager.primary,
      selectedBgColor: ColorManager.primary,
      selectedIconColor: Theme.of(context).colorScheme.primary,
      selectedTextColor: Theme.of(context).colorScheme.primary,
      unSelectedBgColor: Theme.of(context).colorScheme.primary,
      unSelectedIconColor: ColorManager.primary,
      unSelectedTextColor: ColorManager.primary,
    );
  }

  ClipRRect _buildCreateEventImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(ImageManager.bookClub, height: 203),
    );
  }

  Column _buildEventDateAndTime(AppLocalizations localization) {
    return Column(
      children: [
        EventDateAndTime(
          dataAndTime: localization.eventData,
          chooseDateAndTime: localization.chooseDate,
          icon: IconManager.calendarMonth,
        ),
        EventDateAndTime(
          dataAndTime: localization.eventTime,
          chooseDateAndTime: localization.chooseTime,
          icon: IconManager.timerOutlined,
        ),
      ],
    );
  }

  Column _buildEventTextFormField(
    BuildContext context,
    AppLocalizations localization,
  ) {
    final textTheme = Theme.of(context).textTheme.headlineSmall;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Text(localization.title, style: textTheme),
        MainTextField(
          hint: localization.eventTitle,
          prefixIcon: ImageIconManager.editNote,
        ),
        Text(localization.description, style: textTheme),
        MainTextField(hint: localization.eventDescription, maxLines: 4),
      ],
    );
  }
}
