import 'package:evently/core/constant/l10n/app_localizations.dart';
import 'package:evently/core/constant/manager/image_manager.dart';
import 'package:evently/core/widget/main_text_field.dart';
import 'package:evently/create_event/presentation/bloc/create_event_cubit.dart';
import 'package:evently/create_event/presentation/bloc/create_event_state.dart';
import 'package:evently/create_event/presentation/widget/date_time_widget.dart';
import 'package:evently/create_event/presentation/widget/create_event_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../core/widget/main_button.dart';
import '../../../core/widget/choose_event_location.dart';
import '../../../core/widget/event_activity.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme.bodySmall;
    return BlocProvider(
      create: (context) {
        return CreateEventCubit();
      },
      child: BlocBuilder<CreateEventCubit, CreateEventState>(
        builder: (context, state) {
          var cubit = context.read<CreateEventCubit>();
          return Scaffold(
            appBar: AppBar(title: Text(localization.createEvent)),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    CreateEventImages(cubit: cubit),
                    EventActivity(cubit: cubit),
                    Text(localization.title, style: textTheme),
                    MainTextField(
                      onChanged: (value) {
                        cubit.eventTitle(eventTitle: value);
                      },
                      hint: localization.eventTitle,
                      prefixIcon: ImageIconManager.editNote,
                    ),
                    Text(localization.description, style: textTheme),
                    MainTextField(
                      onChanged: (value) {
                        context.read<CreateEventCubit>().eventDescription(
                          eventDescription: value,
                        );
                      },
                      hint: localization.eventDescription,
                      maxLines: 4,
                    ),
                    DateTimeWidget(localization: localization, cubit: cubit),
                    Text(
                      localization.location,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Location(location: localization.chooseLocation),
                    MainButton(
                      text: localization.createEvent,
                      onPressed: () {
                        context.read<CreateEventCubit>().onCreateEvent();
                      },
                    ),
                    Gap(150),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
