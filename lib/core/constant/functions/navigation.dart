import 'package:flutter/material.dart';

void pushReplacement(BuildContext context, Widget screen) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (BuildContext context) => screen),
  );
}

void push(BuildContext context, Widget screen) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (BuildContext context) => screen),
  );
}

void pop(BuildContext context) {
  Navigator.pop(context);
}
