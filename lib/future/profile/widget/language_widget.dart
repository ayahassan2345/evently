import 'package:evently/core/config/bloc/theme_lang_cubit.dart';
import 'package:evently/core/config/bloc/theme_lang_state.dart';
import 'package:evently/core/constant/enums/app_language.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constant/manager/icon_manager.dart';
import '../../../core/constant/manager/color_manager.dart';
import 'package:flutter/material.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.titleMedium!;
    return Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Language', style: style),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: ColorManager.primary, width: 2),
          ),
          child: BlocBuilder<ThemeLangCubit, ThemeLangState>(
            builder: (context, state) {
              var cubit = context.read<ThemeLangCubit>();
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    cubit.selectedLanguage.name,
                    style: style.copyWith(color: ColorManager.primary),
                  ),
                  _buildDropDown(context: context, cubit: cubit),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  DropdownButton<dynamic> _buildDropDown({
    required BuildContext context,
    required ThemeLangCubit cubit,
  }) {
    List<AppLanguage> items = [AppLanguage.en, AppLanguage.ar];
    return DropdownButton(
      value: cubit.selectedLanguage,
      items: items.map((item) {
        return DropdownMenuItem(value: item, child: Text(item.name));
      }).toList(),
      onChanged: (value) {
        context.read<ThemeLangCubit>().onChangeLanguage(value);
      },
      borderRadius: BorderRadius.circular(8),
      dropdownColor: Theme.of(context).colorScheme.primary,
      padding: EdgeInsets.symmetric(horizontal: 10),
      icon: Icon(
        IconManager.arrowDropDownRounded,
        size: 40,
        color: ColorManager.primary,
      ),
      style: Theme.of(context).textTheme.headlineMedium,
      underline: SizedBox(),
    );
  }
}
