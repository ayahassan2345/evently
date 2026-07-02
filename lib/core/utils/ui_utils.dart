import 'package:flutter/material.dart';

void showSnackBarExeption(BuildContext context, String contentMsg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      showCloseIcon: true,
      content: Text(contentMsg),
      duration: Duration(seconds: 2),
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0, // Inner padding for SnackBar content.
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    ),
  );
}

void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [CircularProgressIndicator()],
      );
    },
  );
}
