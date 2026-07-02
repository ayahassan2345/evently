import 'package:evently/core/constant/l10n/app_localizations.dart';
import 'package:evently/future/auth/presentation/screen/register/bloc/register_cubit.dart';
import 'package:evently/future/auth/presentation/screen/register/bloc/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/constant/functions/navigation.dart';
import '../../../../../../core/constant/manager/icon_manager.dart';
import '../../../../../../core/constant/manager/image_manager.dart';
import '../../../../../../core/widget/custom_animated_toggle_switch_lang.dart';
import '../../../../../../core/widget/main_button.dart';
import '../../../../../../core/widget/main_text_field.dart';
import '../../../widget/validator_function.dart';
import '../../login/screen/log_in.dart';
import '../../../../../../core/constant/manager/color_manager.dart';
import '../../../widget/have_account.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool obscureText = false;
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final localization = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: _buildAppBar(context),
      body: BlocBuilder<RegisterCubit, RegisterState>(
        builder: (context, state) {
          var cubit = context.read<RegisterCubit>();
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                spacing: 12,
                children: [
                  _buildLogo(),
                  _buildCustomTextField(
                    formKey: formKey,
                    localization: localization,
                    cubit: cubit,
                  ),
                  _buildRegisterButton(context, formKey, localization, cubit),
                  _buildHaveAcc(context, localization),
                  CustomAnimatedToggleSwitchLang(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCustomTextField({
    required GlobalKey<FormState> formKey,
    required AppLocalizations localization,
    required RegisterCubit cubit,
  }) {
    return Form(
      key: formKey,
      child: Column(
        spacing: 16,
        children: [
          MainTextField(
            validator: nameValidator,
            hint: localization.userHint,
            prefixIcon: ImageIconManager.nameIcon,
            controller: cubit.nameController,
          ),
          MainTextField(
            controller: cubit.emailController,
            validator: emailValidator,
            prefixIcon: ImageIconManager.emailIicon,
            hint: localization.emailHint,
          ),
          MainTextField(
            obscureText: obscureText,
            controller: cubit.passController,
            validator: passValidator,
            prefixIcon: ImageIconManager.passIcon,
            hint: localization.passHint,
            suffixIcon: IconButton(
              onPressed: () {
                obscureText = !obscureText;
                setState(() {});
              },
              icon: Icon(
                obscureText
                    ? IconManager.visibilityOff
                    : IconManager.visibility,
              ),
            ),
          ),
          MainTextField(
            obscureText: obscureText,
            controller: cubit.rePassController,
            validator: (value) => rePassValidator(
              passController: cubit.passController,
              rePassController: cubit.rePassController,
              value: value,
            ),
            prefixIcon: ImageIconManager.passIcon,
            hint: localization.rePassHint,
            suffixIcon: IconButton(
              onPressed: () {
                obscureText = !obscureText;
              },
              icon: Icon(
                obscureText
                    ? IconManager.visibilityOff
                    : IconManager.visibility,
              ),
            ),
          ),
        ],
      ),
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

  Widget _buildRegisterButton(
    BuildContext context,
    GlobalKey<FormState> formKey,
    AppLocalizations localization,
    RegisterCubit cubit,
  ) {
    return MainButton(
      text: localization.createAcc,
      onPressed: () {
        if (formKey.currentState!.validate()) {
          cubit.createAccount(context: context);
        } else {
          return;
        }
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
