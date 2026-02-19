import 'package:evently/future/auth/register/cubit/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterObscureTextCubit extends Cubit<RegisterObscureTextState> {
  RegisterObscureTextCubit()
    : super(RegisterObscureTextState(obscureTextPass: true, obscureTextRePass: true));

  void togglePassword() {
    emit(state.copyWith(obscureTextPass: !state.obscureTextPass));
  } 
  void toggleRePassword() {
    emit(state.copyWith(obscureTextRePass: !state.obscureTextRePass));
  }
}
