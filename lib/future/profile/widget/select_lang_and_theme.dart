import '../../../core/constant/manager/icon_manager.dart';
import '../../../core/constant/manager/color_manager.dart';
import 'package:flutter/material.dart';

class SelectLangAndTheme extends StatefulWidget {
  const SelectLangAndTheme({
    super.key,
    required this.item1,
    required this.item2,
    required this.type,
  });
  final String item1;
  final String item2;
  final String type;

  @override
  State<SelectLangAndTheme> createState() => _SelectLangAndThemeState();
}

class _SelectLangAndThemeState extends State<SelectLangAndTheme> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.titleMedium!;
    final List<String> itemData = [widget.item1, widget.item2];
    var items = itemData.map((item) {
      return DropdownMenuItem(value: item, child: Text(item));
    }).toList();

    return Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.type, style: style),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: ColorManager.primary, width: 2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                selectedValue ?? itemData[0],
                style: style.copyWith(color: ColorManager.primary),
              ),
              DropdownButton(
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
                value: selectedValue,
                items: items,
                onChanged: (value) {
                  selectedValue = value;
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
