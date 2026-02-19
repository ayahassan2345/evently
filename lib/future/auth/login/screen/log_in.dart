import 'package:evently/core/constant/l10n/app_localizations.dart';
import 'package:evently/future/auth/login/cubit/login_cubit.dart';
import 'package:evently/future/auth/login/cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constant/manager/icon_manager.dart';
import '../../../../core/widget/custom_animated_toggle_switch_lang.dart';
import '../../../../core/widget/main_button.dart';
import '../../../../core/widget/main_text_field.dart';
import '../../auth_widget/validator_function.dart';
import '../widget/log_in_google_button.dart';
import '../../password/screen/password.dart';
import '../../../../core/constant/functions/navigation.dart';
import '../../../../core/constant/manager/image_manager.dart';
import '../../register/screen/register.dart';
import '../widget/custom_divider.dart';
import '../../auth_widget/have_account.dart';
import '../../../../core/constant/manager/color_manager.dart';
import '../../../main_layer/screen/main_layer.dart';
import 'package:flutter/material.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final localization = AppLocalizations.of(context)!;
    final formKey = GlobalKey<FormState>();
    final passController = TextEditingController();
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginObscureTextCubit(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              spacing: 24,
              children: [
                _buildLogo(),
                _buildCustomTextField(
                  formKey,
                  context,
                  textTheme,
                  passController,
                  localization,
                ),
                _buildLoginButton(context, formKey, localization),
                _buildHaveAcc(context, localization),
                _buildDivider(textTheme, localization),
                LogInGoogleButton(),
                CustomAnimatedToggleSwitchLang(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  HaveAccount _buildHaveAcc(
    BuildContext context,
    AppLocalizations localization,
  ) {
    return HaveAccount(
      haveAcc: localization.dontHaveAcc,
      createAcc: localization.createAcc,
      onTap: () {
        push(context, Register());
      },
    );
  }

  MainButton _buildLoginButton(
    BuildContext context,
    GlobalKey<FormState> formKey,
    AppLocalizations localization,
  ) {
    return MainButton(
      text: localization.logIn,
      onPressed: () {
        formKey.currentState!.validate()
            ? pushReplacement(context, MainLayer())
            : null;
      },
    );
  }

  Center _buildLogo() => Center(child: Image.asset(ImageManager.splashLogo));

  Row _buildDivider(TextTheme textTheme, AppLocalizations localization) {
    return Row(
      children: [
        CustomDivider(),
        Text(
          localization.or,
          style: textTheme.headlineSmall!.copyWith(color: ColorManager.primary),
        ),
        CustomDivider(),
      ],
    );
  }

  Widget _buildCustomTextField(
    GlobalKey<FormState> formKey,
    BuildContext context,
    TextTheme textTheme,
    TextEditingController passController,
    AppLocalizations localization,
  ) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        spacing: 16,
        children: [
          MainTextField(
            validator: emailValidator,
            prefixIcon: ImageIconManager.emailIicon,
            hint: localization.emailHint,
          ),
          BlocBuilder<LoginObscureTextCubit, LoginObscureTextState>(
            builder: (context, state) {
              final readCubit = context.read<LoginObscureTextCubit>();
              return MainTextField(
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
              );
            },
          ),
          _buildForgetPass(context, textTheme, localization),
        ],
      ),
    );
  }

  InkWell _buildForgetPass(
    BuildContext context,
    TextTheme textTheme,
    AppLocalizations localization,
  ) {
    return InkWell(
      onTap: () {
        push(context, Password());
      },
      child: Text(
        localization.forgetPass,
        style: textTheme.headlineSmall!.copyWith(
          decoration: TextDecoration.underline,
          decorationColor: ColorManager.primary,
          color: ColorManager.primary,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
