import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import '../../constant/manager/color_manager.dart';
import '../../constant/manager/image_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAnimatedToggleSwitchTheme extends StatefulWidget {
  const CustomAnimatedToggleSwitchTheme({super.key});

  @override
  State<CustomAnimatedToggleSwitchTheme> createState() =>
      _CustomAnimatedToggleSwitchThemeState();
}

class _CustomAnimatedToggleSwitchThemeState
    extends State<CustomAnimatedToggleSwitchTheme> {
  int current = 0;
  @override
  Widget build(BuildContext context) {
    final List<String> imageIcons = [
      ImageIconManager.lightTheme,
      ImageIconManager.darkTheme,
    ];
    final ToggleStyle styleBuilder = ToggleStyle(
      backgroundColor: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(30),
      borderColor: ColorManager.primary,
      indicatorColor: ColorManager.primary,
      indicatorBorder: Border.all(color: ColorManager.primary, width: 4),
      indicatorBorderRadius: BorderRadius.circular(50),
    );

    return AnimatedToggleSwitch<int>.size(
      onChanged: (i) => setState(() => current = i),
      iconBuilder: (value) {
        bool isSelected = value == current;
        return SvgPicture.asset(
          imageIcons[value],
          height: 20,
          colorFilter: ColorFilter.mode(
            isSelected ? ColorManager.white : ColorManager.primary,
            BlendMode.srcIn,
          ),
        );
      },
      styleBuilder: (i) => styleBuilder,
      current: current,
      values: List.generate(imageIcons.length, (index) => index),
      iconOpacity: 1,
      indicatorSize: const Size.fromWidth(35),
      height: 35,
      borderWidth: 2,
    );
  }
}
