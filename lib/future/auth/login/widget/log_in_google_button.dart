import '../../../../core/constant/manager/color_manager.dart';
import '../../../../core/constant/manager/text_manager.dart';
import '../../../../core/constant/manager/image_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LogInGoogleButton extends StatelessWidget {
  const LogInGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: 57,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(ImageIconManager.google),
            SizedBox(width: 5),
            Text(
              TextManager.googleLogin,
              style: textTheme.titleSmall!.copyWith(
                color: ColorManager.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
