import '../../../../core/constant/manager/color_manager.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Divider(endIndent: 25, indent: 25, color: ColorManager.primary),
    );
  }
}
