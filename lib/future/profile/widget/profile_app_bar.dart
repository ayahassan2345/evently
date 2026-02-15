import '../../../core/constant/manager/color_manager.dart';
import '../../../core/constant/manager/text_manager.dart';
import '../../../core/constant/manager/image_manager.dart';
import '../../../core/constant/theme/text_theme.dart';
import 'package:flutter/material.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final BoxDecoration decoration = BoxDecoration(
      color: ColorManager.primary,
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(64)),
    );
    // final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.only(bottom: 16, left: 16, right: 16, top: 40),
      width: double.infinity,
      decoration: decoration,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(100),
              bottomRight: Radius.circular(100),
              topRight: Radius.circular(100),
            ),
            child: Image.asset(ImageManager.route, height: 120),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(TextManager.userName, style: textThemeDark.titleLarge),
                Text(TextManager.userEmail, style: textThemeDark.headlineSmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
