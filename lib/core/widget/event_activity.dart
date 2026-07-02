import 'package:evently/core/constant/manager/color_manager.dart';
import 'package:evently/create_event/presentation/bloc/create_event_cubit.dart';
import '../model/create_event_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EventActivity extends StatelessWidget {
  final CreateEventCubit cubit;
  const EventActivity({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return SizedBox(width: 10);
        },
        itemCount: activities.length,
        itemBuilder: (context, index) {
          List<String> activityName = activities.keys.toList();
          List<String> activityIcon = activities.values.toList();
          final BoxDecoration decoration = BoxDecoration(
            color: cubit.selectedActivity == index
                ? ColorManager.primary
                : ColorManager.white,
            borderRadius: BorderRadius.circular(46),
            border: BoxBorder.all(color: ColorManager.primary, width: 1.5),
          );
          return InkWell(
            onTap: () {
              cubit.onSelectActivity(index: index);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: decoration,
              child: Row(
                children: [
                  SvgPicture.asset(
                    activityIcon[index],
                    colorFilter: ColorFilter.mode(
                      cubit.selectedActivity == index
                          ? ColorManager.white
                          : ColorManager.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                  SizedBox(width: 4),
                  Text(
                    activityName[index],
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: cubit.selectedActivity == index
                          ? ColorManager.white
                          : ColorManager.primary,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
