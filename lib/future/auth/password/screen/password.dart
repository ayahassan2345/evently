import '../../../../core/constant/manager/text_manager.dart';
import '../../../../core/constant/manager/image_manager.dart';
import '../../../../core/main/widgets/main_button.dart';
import 'package:flutter/material.dart';

class Password extends StatelessWidget {
  const Password({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(TextManager.forgetPass)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 24,
          children: [_buildforgerPassImg(), _buildForgetPassButton()],
        ),
      ),
    );
  }

  MainButton _buildForgetPassButton() =>
      MainButton(text: TextManager.resetPassword, onPressed: () {});

  Image _buildforgerPassImg() =>
      Image.asset(ImageManager.forgetPass, height: 361, width: 361);
}
