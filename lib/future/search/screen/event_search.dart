import '../../../core/widget/event_cart.dart';
import '../widget/search_text_form_field.dart';
import 'package:flutter/material.dart';

class EventSearch extends StatelessWidget {
  const EventSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            SearchTextFormField(),
            EventCart(),
          ],
        ),
      ),
    );
  }
}
