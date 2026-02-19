import 'package:evently/core/constant/enums/app_theme.dart';
import 'package:evently/core/theme_cubit/theme_cubit.dart';
import 'package:evently/core/theme_cubit/theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constant/manager/icon_manager.dart';
import '../../../core/constant/manager/color_manager.dart';
import 'package:flutter/material.dart';

class SelectedTheme extends StatelessWidget {
  const SelectedTheme({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.titleMedium!;
    return Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Theme', style: style),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: ColorManager.primary, width: 2),
          ),
          child: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    state.selectedValue.name,
                    style: style.copyWith(color: ColorManager.primary),
                  ),
                  _buildDropDown(context: context, state: state),
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
    required ThemeState state,
  }) {
    List<AppTheme> items = [AppTheme.light, AppTheme.dark];
    return DropdownButton(
      value: state.selectedValue,
      items: items.map((item) {
        return DropdownMenuItem(value: item, child: Text(item.name));
      }).toList(),
      onChanged: (value) {
        context.read<ThemeCubit>().getTheme(value);
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
