import 'package:evently/core/constant/l10n/app_localizations.dart';
import '../../../core/constant/manager/color_manager.dart';
import '../../../core/constant/manager/image_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchTextFormField extends StatefulWidget {
  const SearchTextFormField({super.key});

  @override
  State<SearchTextFormField> createState() => _SearchTextFormFieldState();
}

class _SearchTextFormFieldState extends State<SearchTextFormField> {
  
  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: TextFormField(
          decoration: InputDecoration(
            hint: Text(
              localization.searchEvent,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge!.copyWith(color: ColorManager.primary),
            ),
            prefixIcon: Padding(
              padding: const EdgeInsetsDirectional.only(start: 12, end: 8),
              child: SvgPicture.asset(ImageManager.search),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: ColorManager.primary),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: ColorManager.primary),
            ),
          ),
        ),
      ),
    );
  }
}
