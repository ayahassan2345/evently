import '../constant/manager/icon_manager.dart';
import '../constant/manager/color_manager.dart';
import 'package:flutter/material.dart';

class ChooseEventLocation extends StatelessWidget {
  const ChooseEventLocation({super.key, required this.location});
  final String location;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ColorManager.primary),
      ),
      child: Row(
        children: [
          DetailsIcon(detailsIcon: IconManager.gpsFixed),
          SizedBox(width: 5),
          Text(
            location,
            style: TextTheme.of(
              context,
            ).headlineSmall!.copyWith(color: ColorManager.primary),
          ),
          Spacer(),
          Icon(
            IconManager.arrowForwardIosRounded,
            color: ColorManager.primary,
            size: 15,
          ),
        ],
      ),
    );
  }
}

class DetailsIcon extends StatelessWidget {
  const DetailsIcon({super.key, required this.detailsIcon});
  final IconData detailsIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: ColorManager.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(detailsIcon, color: ColorManager.white),
    );
  }
}
