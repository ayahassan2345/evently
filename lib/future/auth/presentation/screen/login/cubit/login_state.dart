class LoginObscureTextState {
  final bool obscureTextPass;

  LoginObscureTextState({
    required this.obscureTextPass,
  });
  LoginObscureTextState copyWith({bool? obscureTextPass, bool? obscureTextRePass}) {
    return LoginObscureTextState(
      obscureTextPass: obscureTextPass ?? this.obscureTextPass,
    );
  }
}
