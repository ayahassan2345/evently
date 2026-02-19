class RegisterObscureTextState {
  final bool obscureTextPass;
  final bool obscureTextRePass;

  RegisterObscureTextState({
    required this.obscureTextPass,
    required this.obscureTextRePass,
  });
  RegisterObscureTextState copyWith({bool? obscureTextPass, bool? obscureTextRePass}) {
    return RegisterObscureTextState(
      obscureTextPass: obscureTextPass ?? this.obscureTextPass,
      obscureTextRePass: obscureTextRePass ?? this.obscureTextRePass,
    );
  }
}
