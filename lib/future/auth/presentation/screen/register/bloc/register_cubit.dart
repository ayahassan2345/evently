import 'package:evently/future/auth/data/auth_repository.dart';
import 'package:evently/future/auth/presentation/screen/register/bloc/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterState());
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController rePassController = TextEditingController();
  void createAccount({required BuildContext context}) {
    AuthRepository.createAccountRepository(
      emailController: emailController,
      nameController: nameController,
      passController: passController,
      context: context,
    );
  }
}
