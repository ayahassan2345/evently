import 'package:evently/core/constant/manager/color_manager.dart';
import 'package:evently/core/constant/manager/image_manager.dart';
import 'package:evently/future/create_event/cubit/create_event_cubit.dart';
import 'package:evently/future/create_event/cubit/create_event_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateEventImages extends StatefulWidget {
  const CreateEventImages({super.key});

  @override
  State<CreateEventImages> createState() => _CreateEventImagesState();
}

class _CreateEventImagesState extends State<CreateEventImages> {
  int isSelected = -1;
  List<String> eventImages = [
    ImageManager.club_0,
    ImageManager.club_1,
    ImageManager.club_2,
    ImageManager.club_3,
    ImageManager.club_4,
    ImageManager.club_5,
    ImageManager.club_6,
    ImageManager.club_7,
    ImageManager.club_8,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return CreateEventCubit();
      },
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: eventImages.length,
        separatorBuilder: (context, index) {
          return SizedBox(width: 5);
        },
        itemBuilder: (context, index) {
          return BlocBuilder<CreateEventCubit, CreateEventState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    isSelected = index;
                  });
                  context.read<CreateEventCubit>().selectedImage(
                    eventImages[index],
                  );
                },
                child: Container(
                  height: 200,
                  width: 350,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(eventImages[index]),
                    ),
                    border: Border.all(
                      color: isSelected == index
                          ? ColorManager.primary
                          : ColorManager.transparent,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
