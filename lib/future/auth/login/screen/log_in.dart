import '../../../../core/constant/manager/icon_manager.dart';
import '../../../../core/main/widgets/custom_animated_toggle_switch_lang.dart';
import '../../../../core/main/widgets/main_button.dart';
import '../../../../core/main/widgets/main_text_field.dart';
import '../../auth_widget/validator_function.dart';
import '../widget/log_in_google_button.dart';
import '../../password/screen/password.dart';
import '../../../../core/constant/functions/navigation.dart';
import '../../../../core/constant/manager/image_manager.dart';
import '../../register/screen/register.dart';
import '../widget/custom_divider.dart';
import '../../auth_widget/have_account.dart';
import '../../../../core/constant/manager/color_manager.dart';
import '../../../../core/constant/manager/text_manager.dart';
import '../../../main_layer/main_layer.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController passController;
  bool obscureText = true;
  @override
  void initState() {
    passController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            spacing: 24,
            children: [
              _buildLogo(),
              _buildCustomTextField(),
              _buildLoginButton(context),
              _buildHaveAcc(context),
              _buildDivider(textTheme),
              LogInGoogleButton(),
              CustomAnimatedToggleSwitchLang(),
            ],
          ),
        ),
      ),
    );
  }

  HaveAccount _buildHaveAcc(BuildContext context) {
    return HaveAccount(
      haveAcc: TextManager.dontHaveAcc,
      createAcc: TextManager.createAcc,
      onTap: () {
        push(context, Register());
      },
    );
  }

  MainButton _buildLoginButton(BuildContext context) {
    return MainButton(
      text: TextManager.logIn,
      onPressed: () {
        formKey.currentState!.validate()
            ? pushReplacement(context, MainLayer())
            : null;
      },
    );
  }

  Center _buildLogo() => Center(child: Image.asset(ImageManager.splashLogo));

  Row _buildDivider(TextTheme textTheme) {
    return Row(
      children: [
        CustomDivider(),
        Text(
          TextManager.or,
          style: textTheme.headlineSmall!.copyWith(color: ColorManager.primary),
        ),
        CustomDivider(),
      ],
    );
  }

  _buildForgetPass() {
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () {
        push(context, Password());
      },
      child: Text(
        TextManager.forgetPass,
        style: textTheme.headlineSmall!.copyWith(
          decoration: TextDecoration.underline,
          decorationColor: ColorManager.primary,
          color: ColorManager.primary,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }

  _buildCustomTextField() {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        spacing: 16,
        children: [
          MainTextField(
            validator: emailValidator,
            prefixIcon: ImageIconManager.emailIicon,
            hint: TextManager.emailHint,
          ),
          MainTextField(
            obscureText: obscureText,
            controller: passController,
            validator: passValidator,
            prefixIcon: ImageIconManager.passIcon,
            hint: TextManager.passHint,
            suffixIcon: IconButton(
              onPressed: () => setState(() {
                obscureText = !obscureText;
              }),
              icon: Icon(
                obscureText
                    ? IconManager.visibilityOff
                    : IconManager.visibility,
              ),
            ),
          ),
          _buildForgetPass(),
        ],
      ),
    );
  }
}
