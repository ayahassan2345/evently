import 'package:evently/core/constant/manager/color_manager.dart';
import 'package:evently/core/model/create_event_data.dart';
import 'package:evently/create_event/presentation/bloc/create_event_cubit.dart';
import 'package:flutter/material.dart';

class CreateEventImages extends StatelessWidget {
  final CreateEventCubit cubit;
  const CreateEventImages({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: eventImages.length,
        separatorBuilder: (context, index) {
          return SizedBox(width: 5);
        },
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              cubit.onSelectImage(index: index);
            },
            child: Container(
              height: 200,
              width: 350,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(eventImages[index])),
                border: Border.all(
                  color: cubit.selectedImage == index
                      ? ColorManager.primary
                      : ColorManager.transparent,
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          );
        },
      ),
    );
  }
}
