import 'package:flutter/material.dart';

pushReplacement(BuildContext context, Widget screen) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (BuildContext context) => screen),
  );
}

push(BuildContext context, Widget screen) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (BuildContext context) => screen),
  );
}

pop(BuildContext context) {
  Navigator.pop(context);
}
