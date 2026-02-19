import 'package:evently/future/auth/register/cubit/register_cubit.dart';
import 'package:evently/future/auth/register/cubit/register_state.dart';
import 'package:evently/core/constant/l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constant/functions/navigation.dart';
import '../../../../core/constant/manager/icon_manager.dart';
import '../../../../core/constant/manager/image_manager.dart';
import '../../../../core/widget/custom_animated_toggle_switch_lang.dart';
import '../../../../core/widget/main_button.dart';
import '../../../../core/widget/main_text_field.dart';
import '../../auth_widget/validator_function.dart';
import '../../login/screen/log_in.dart';
import '../../../../core/constant/manager/color_manager.dart';
import '../../auth_widget/have_account.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController passController = TextEditingController();
    final TextEditingController rePassController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    final localization = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: _buildAppBar(context),
      body: BlocProvider(
        create: (BuildContext context) {
          return RegisterObscureTextCubit();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            spacing: 12,
            children: [
              _buildLogo(),
              _buildCustomTextField(
                passController,
                rePassController,
                formKey,
                localization,
              ),
              _buildRegisterButton(context, formKey, localization),
              _buildHaveAcc(context, localization),
              CustomAnimatedToggleSwitchLang(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCustomTextField(
    TextEditingController passController,
    TextEditingController rePassController,
    GlobalKey<FormState> formKey,
    AppLocalizations localization,
  ) {
    return BlocBuilder<RegisterObscureTextCubit, RegisterObscureTextState>(
      builder: (context, state) {
        final readCubit = context.read<RegisterObscureTextCubit>();
        return Form(
          key: formKey,
          child: Column(
            spacing: 16,
            children: [
              MainTextField(
                validator: userValidator,
                hint: localization.userHint,
                prefixIcon: ImageIconManager.nameIcon,
              ),
              MainTextField(
                validator: emailValidator,
                prefixIcon: ImageIconManager.emailIicon,
                hint: localization.emailHint,
              ),
              MainTextField(
                obscureText: state.obscureTextPass,
                controller: passController,
                validator: passValidator,
                prefixIcon: ImageIconManager.passIcon,
                hint: localization.passHint,
                suffixIcon: IconButton(
                  onPressed: readCubit.togglePassword,
                  icon: Icon(
                    state.obscureTextPass
                        ? IconManager.visibilityOff
                        : IconManager.visibility,
                  ),
                ),
              ),
              MainTextField(
                obscureText: state.obscureTextRePass,
                controller: rePassController,
                validator: (value) => rePassValidator(
                  passController: passController,
                  rePassController: rePassController,
                  value: value,
                ),
                prefixIcon: ImageIconManager.passIcon,
                hint: localization.rePassHint,
                suffixIcon: IconButton(
                  onPressed: readCubit.toggleRePassword,
                  icon: Icon(
                    state.obscureTextRePass
                        ? IconManager.visibilityOff
                        : IconManager.visibility,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  HaveAccount _buildHaveAcc(
    BuildContext context,
    AppLocalizations localization,
  ) {
    return HaveAccount(
      haveAcc: localization.haveAcc,
      createAcc: localization.logIn,
      onTap: () {
        pushReplacement(context, LogIn());
      },
    );
  }

  MainButton _buildRegisterButton(
    BuildContext context,
    GlobalKey<FormState> formKey,
    AppLocalizations localization,
  ) {
    return MainButton(
      text: localization.createAcc,
      onPressed: () {
        formKey.currentState!.validate()
            ? pushReplacement(context, LogIn())
            : null;
      },
    );
  }

  Widget _buildLogo() => Image.asset(ImageManager.splashLogo);

  AppBar _buildAppBar(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(IconManager.arrowBack),
        color: ColorManager.primary,
      ),
      title: Text(
        AppLocalizations.of(context)!.register,
        style: textTheme.headlineLarge!.copyWith(color: ColorManager.primary),
      ),
      centerTitle: true,
    );
  }
}
