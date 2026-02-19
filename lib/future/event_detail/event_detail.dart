import 'package:evently/core/constant/l10n/app_localizations.dart';
import '../../core/constant/manager/color_manager.dart';
import 'widget/custom_card_detail.dart';
import 'widget/custom_map.dart';
import 'widget/description.dart';
import '../../core/constant/manager/image_manager.dart';
import '../../core/widget/choose_event_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EventDetail extends StatelessWidget {
  const EventDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final localization = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: _buildAppBar(textTheme, localization),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            spacing: 15,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildEventDetailsImage(),
              _buildEventDetailsTitle(textTheme, localization),
              EventDate(),
              ChooseEventLocation(location: localization.userLocation),
              CustomMap(),
              Description(),
            ],
          ),
        ),
      ),
    );
  }

  Text _buildEventDetailsTitle(
    TextTheme textTheme,
    AppLocalizations localization,
  ) {
    return Text(
      localization.event,
      style: textTheme.titleSmall!.copyWith(color: ColorManager.primary),
    );
  }

  ClipRRect _buildEventDetailsImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(ImageManager.bookClub, height: 203),
    );
  }

  AppBar _buildAppBar(TextTheme textTheme, AppLocalizations localization) {
    return AppBar(
      title: Text(localization.eventDetails),
      actions: [
        SvgPicture.asset(ImageIconManager.edit),
        SizedBox(width: 10),
        SvgPicture.asset(ImageIconManager.delete),
      ],
      actionsPadding: EdgeInsets.symmetric(horizontal: 10),
    );
  }
}
