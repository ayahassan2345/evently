import '../../../core/constant/manager/color_manager.dart';
import 'package:flutter/material.dart';

class HaveAccount extends StatelessWidget {
  const HaveAccount({
    super.key,
    required this.haveAcc,
    required this.createAcc,
    this.onTap,
  });
  final String haveAcc;
  final String createAcc;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.headlineSmall;
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: haveAcc, style: textTheme),
          WidgetSpan(child: SizedBox(width: 4)),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: InkWell(
              onTap: onTap,
              child: Text(
                createAcc,
                style: textTheme!.copyWith(
                  decoration: TextDecoration.underline,
                  decorationColor: ColorManager.primary,
                  color: ColorManager.primary,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
