import 'package:evently/future/auth/register/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ObscureTextCubit extends Cubit<ObscureTextState> {
  ObscureTextCubit()
    : super(ObscureTextState(obscureTextPass: false, obscureTextRePass: false));

  void onPressed() {
    print('object');
    emit(state.copyWith(obscureTextPass: !state.obscureTextPass));
  }
  // void onPressed() {
  //   emit(state.copyWith(obscureTextPass: !state.obscureTextPass));
  // }
}
