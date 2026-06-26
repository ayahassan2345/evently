import 'package:evently/core/constant/l10n/app_localizations.dart';
import 'package:evently/future/create_event/cubit/create_event_cubit.dart';
import 'package:evently/future/create_event/cubit/create_event_state.dart';
import 'package:evently/future/create_event/widget/choose_date_and_time.dart';
import 'package:evently/future/create_event/widget/create_event_images.dart';
import 'package:evently/future/create_event/widget/event_title_and_description.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constant/manager/color_manager.dart';
import '../../../core/widget/main_button.dart';
import '../../../core/widget/choose_event_location.dart';
import '../../../core/widget/categories.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (context) {
        return CreateEventCubit();
      },
      child: Scaffold(
        appBar: AppBar(title: Text(localization.createEvent)),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          child: SingleChildScrollView(
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 200, child: CreateEventImages()),
                Column(
                  children: [
                    _buildCategories(context),
                    EventTitleAndDescription(localization: localization),
                    ChooseDateAndTime(localization: localization),
                    Text(
                      localization.location,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    ChooseEventLocation(location: localization.chooseLocation),
                    _buildCreateEventButton(localization),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCreateEventButton(AppLocalizations localization) {
    return BlocBuilder<CreateEventCubit, CreateEventState>(
      builder: (context, state) {
        return MainButton(
          text: localization.createEvent,
          onPressed: () {
            context.read<CreateEventCubit>().createEvent();
          },
        );
      },
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
}
