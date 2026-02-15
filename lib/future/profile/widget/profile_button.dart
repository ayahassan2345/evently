import '../../../core/constant/manager/icon_manager.dart';
import '../../../core/constant/manager/color_manager.dart';
import '../../../core/constant/manager/text_manager.dart';
import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: 56,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Color(0XFFFF5659),
          side: BorderSide(color: ColorManager.transparent)
        ),
        child: Row(
          spacing: 10,
          children: [
            Icon(IconManager.logout, color: Colors.white, size: 25),
            Text(
              TextManager.logout,
              style: textTheme.headlineLarge!.copyWith(
                color: ColorManager.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
