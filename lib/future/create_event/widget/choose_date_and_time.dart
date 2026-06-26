import 'package:evently/core/constant/l10n/app_localizations.dart';
import 'package:evently/core/constant/manager/icon_manager.dart';
import 'package:evently/future/create_event/cubit/create_event_cubit.dart';
import 'package:evently/future/create_event/cubit/create_event_state.dart';
import 'package:evently/future/create_event/widget/event_date_and_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseDateAndTime extends StatefulWidget {
  const ChooseDateAndTime({super.key, required this.localization});

  final AppLocalizations localization;

  @override
  State<ChooseDateAndTime> createState() => _ChooseDateAndTimeState();
}

class _ChooseDateAndTimeState extends State<ChooseDateAndTime> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return CreateEventCubit();
      },
      child: BlocBuilder<CreateEventCubit, CreateEventState>(
        builder: (context, state) {
          return Column(
            children: [
              _buildChooseDate(context: context, state: state),
              _buildChooseTime(context: context, state: state),
            ],
          );
        },
      ),
    );
  }

  EventDateAndTime _buildChooseTime({
    required BuildContext context,
    required CreateEventState state,
  }) {
    return EventDateAndTime(
      dataAndTime: widget.localization.eventTime,
      chooseDateAndTime: state.eventModel.time,
      icon: IconManager.timerOutlined,
      onPressed: () async {
        final TimeOfDay? picked = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );
        context.read<CreateEventCubit>().selectedTime(picked);
      },
    );
  }

  EventDateAndTime _buildChooseDate({
    required BuildContext context,
    required CreateEventState state,
  }) {
    return EventDateAndTime(
      dataAndTime: widget.localization.eventData,
      chooseDateAndTime: state.eventModel.date,
      icon: IconManager.calendarMonth,
      onPressed: () async {
        DateTime? picked = await showDatePicker(
          context: context,
          firstDate: DateTime.now(),
          lastDate: DateTime(2100),
        );
        context.read<CreateEventCubit>().selectedDate(picked);
        //selectedDate = picked;
      },
    );
  }
}
