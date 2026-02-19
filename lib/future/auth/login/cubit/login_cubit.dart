import 'package:evently/future/auth/login/cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginObscureTextCubit extends Cubit<LoginObscureTextState> {
  LoginObscureTextCubit() : super(LoginObscureTextState(obscureTextPass: true));

  void togglePassword() {
    emit(state.copyWith(obscureTextPass: !state.obscureTextPass));
  }
}
