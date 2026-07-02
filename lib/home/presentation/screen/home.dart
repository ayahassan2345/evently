import '../../../core/widget/event_cart.dart';
import '../widget/home_app_bar.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [HomeAppBar(), EventCart()]));
  }
}
