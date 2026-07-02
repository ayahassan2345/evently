import 'package:evently/core/constant/l10n/app_localizations.dart';
import 'package:evently/core/constant/manager/icon_manager.dart';
import 'package:evently/create_event/presentation/bloc/create_event_cubit.dart';
import 'package:evently/create_event/presentation/widget/event_date_and_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DateTimeWidget extends StatelessWidget {
  final AppLocalizations localization;
  final CreateEventCubit cubit;
  const DateTimeWidget({
    super.key,
    required this.localization,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildChooseDate(context: context, cubit: cubit),
        _buildChooseTime(context: context, cubit: cubit),
      ],
    );
  }

  DateTimeWidgetStyle _buildChooseTime({
    required BuildContext context,
    required CreateEventCubit cubit,
  }) {
    return DateTimeWidgetStyle(
      timeOrDate: localization.eventTime,
      
      chooseDateOrTimeButton: "choose time",
      icon: IconManager.timerOutlined,
      onPressed: () async {
        final TimeOfDay? picked = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );
        context.read<CreateEventCubit>().chooseTime(picked: picked);
      },
    );
  }

  DateTimeWidgetStyle _buildChooseDate({
    required BuildContext context,
    required CreateEventCubit cubit,
  }) {
    return DateTimeWidgetStyle(
      timeOrDate: localization.eventData,
      chooseDateOrTimeButton: "choose date",
      icon: IconManager.calendarMonth,
      onPressed: () async {
        DateTime? picked = await showDatePicker(
          context: context,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(Duration(days: 365)),
        );
        cubit.chooseDate(picked: picked);
      },
    );
  }
}
