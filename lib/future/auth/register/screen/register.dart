import '../../../../core/constant/functions/navigation.dart';
import '../../../../core/constant/manager/icon_manager.dart';
import '../../../../core/constant/manager/image_manager.dart';
import '../../../../core/constant/manager/text_manager.dart';
import '../../../../core/main/widgets/custom_animated_toggle_switch_lang.dart';
import '../../../../core/main/widgets/main_button.dart';
import '../../../../core/main/widgets/main_text_field.dart';
import '../../auth_widget/validator_function.dart';
import '../../login/screen/log_in.dart';
import '../../../../core/constant/manager/color_manager.dart';
import '../../auth_widget/have_account.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passController;
  late TextEditingController rePassController;
  bool obscureText = true;
  bool obscureTextRePass = true;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passController = TextEditingController();
    rePassController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passController.dispose();
    rePassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 12,
          children: [
            _buildLogo(),
            _buildCustomTextField(),
            _buildRegisterButton(context),
            _buildHaveAcc(context),
            CustomAnimatedToggleSwitchLang(),
          ],
        ),
      ),
    );
  }

  Form _buildCustomTextField() {
    return Form(
      key: _formKey,
      child: Column(
        spacing: 16,
        children: [
          MainTextField(
            validator: userValidator,
            hint: TextManager.userHint,
            prefixIcon: ImageIconManager.nameIcon,
          ),
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
            obscureText: obscureTextRePass,
            controller: rePassController,
            validator: (value) => rePassValidator(
              passController: passController,
              rePassController: rePassController,
              value: value,
            ),
            prefixIcon: ImageIconManager.passIcon,
            hint: TextManager.rePassHint,
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
        ],
      ),
    );
  }

  HaveAccount _buildHaveAcc(BuildContext context) {
    return HaveAccount(
      haveAcc: TextManager.haveAcc,
      createAcc: TextManager.logIn,
      onTap: () {
        pushReplacement(context, LogIn());
      },
    );
  }

  MainButton _buildRegisterButton(BuildContext context) {
    return MainButton(
      text: TextManager.createAcc,
      onPressed: () {
        _formKey.currentState!.validate()
            ? pushReplacement(context, LogIn())
            : null;
      },
    );
  }

  _buildLogo() => Image.asset(ImageManager.splashLogo);

  AppBar _buildAppBar() {
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
        TextManager.register,
        style: textTheme.headlineLarge!.copyWith(color: ColorManager.primary),
      ),
      centerTitle: true,
    );
  }
}
