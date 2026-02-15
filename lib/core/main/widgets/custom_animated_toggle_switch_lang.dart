import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import '../../constant/manager/color_manager.dart';
import '../../constant/manager/image_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAnimatedToggleSwitchLang extends StatefulWidget {
  const CustomAnimatedToggleSwitchLang({super.key});

  @override
  State<CustomAnimatedToggleSwitchLang> createState() =>
      _CustomAnimatedToggleSwitchLangState();
}

class _CustomAnimatedToggleSwitchLangState
    extends State<CustomAnimatedToggleSwitchLang> {
  int current = 0;
  @override
  Widget build(BuildContext context) {
    final List<String> imageIcons = [ImageIconManager.ar, ImageIconManager.en];
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
        return SvgPicture.asset(imageIcons[value], height: 20);
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
