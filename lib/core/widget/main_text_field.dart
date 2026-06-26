import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainTextField extends StatelessWidget {
  final void Function(String)? onChanged;
  final String? prefixIcon;
  final Widget? suffixIcon;
  final String hint;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool? obscureText;
  final int? maxLines;
  const MainTextField({
    this.onChanged,
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    required this.hint,
    this.validator,
   this.controller,
    this.obscureText,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      obscureText: obscureText ?? false,
      controller: controller,
      validator: validator,
      maxLines: obscureText == true ? 1 : maxLines,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: prefixIcon == null
            ? null
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  prefixIcon!,
                  height: 18,
                  width: 18,
                  fit: BoxFit.contain,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.surface,
                    BlendMode.srcIn,
                  ),
                ),
              ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
