import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainTextField extends StatelessWidget {
  const MainTextField({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    required this.hint,
    this.validator,
    this.controller,
    this.obscureText,
    this.maxLines,
  });
  final String? prefixIcon;
  final Widget? suffixIcon;
  final String hint;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool? obscureText;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
                    Theme.of(context).colorScheme.background,
                    BlendMode.srcIn,
                  ),
                ),
              ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
