import 'package:evently/core/constant/l10n/app_localizations.dart';
import 'package:evently/core/constant/manager/image_manager.dart';
import 'package:evently/core/widget/main_text_field.dart';
import 'package:evently/future/create_event/cubit/create_event_cubit.dart';
import 'package:evently/future/create_event/cubit/create_event_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventTitleAndDescription extends StatelessWidget {
  const EventTitleAndDescription({super.key, required this.localization});
  final AppLocalizations localization;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.bodySmall;
    return BlocProvider(
      create: (context) {
        return CreateEventCubit();
      },
      child: BlocBuilder<CreateEventCubit, CreateEventState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              Text(localization.title, style: textTheme),
              MainTextField(
                onChanged: (value) {
                  context.read<CreateEventCubit>().selectedEventTitle(value);
                  print('state:${state.eventModel.eventTitle}');
                },
                hint: localization.eventTitle,
                prefixIcon: ImageIconManager.editNote,
              ),
              Text(localization.description, style: textTheme),
              MainTextField(
                onChanged: (value) {
                  context.read<CreateEventCubit>().selectedEventDescription(
                    value,
                  );
                },
                hint: localization.eventDescription,
                maxLines: 4,
              ),
            ],
          );
        },
      ),
    );
  }
}
