class ObscureTextState {
  final bool obscureTextPass;
  final bool obscureTextRePass;

  ObscureTextState({required this.obscureTextPass, required this.obscureTextRePass});
  ObscureTextState copyWith({bool? obscureTextPass, bool? obscureTextRePass}) {
    return ObscureTextState(
      obscureTextPass: obscureTextPass ?? this.obscureTextPass,
      obscureTextRePass: obscureTextRePass ?? this.obscureTextPass,
    );
  }
}
