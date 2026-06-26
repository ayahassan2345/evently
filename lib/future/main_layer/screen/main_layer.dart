import 'dart:developer';

import 'package:evently/future/auth/register/screen/register.dart';
import 'package:evently/future/home/screen/home.dart';
import '../../create_event/screen/create_event.dart';
import '../../../core/constant/manager/image_manager.dart';
import '../widget/bottom_nav_bar_item.dart';
import '../../profile/screen/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainLayer extends StatefulWidget {
  const MainLayer({super.key});

  @override
  State<MainLayer> createState() => _MainLayerState();
}

class _MainLayerState extends State<MainLayer> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> tabs = [Profile(), Register(), Profile(), CreateEvent()];
    return Scaffold(
      floatingActionButton: _buildFloatingActionBtn(),
      bottomNavigationBar: _buildBottomAppBar(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: true,
      body: tabs[currentPage],
    );
  }

  Widget _buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
      notchMargin: 5,
      child: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (value) {
          log(value.toString());
          currentPage = value;
          setState(() {});
        },
        items: itemModel(context).map((item) {
          return item.itemBottomNavigationBarItem();
        }).toList(),
      ),
    );
  }

  FloatingActionButton _buildFloatingActionBtn() {
    return FloatingActionButton(
      onPressed: () {},
      child: SvgPicture.asset(ImageIconManager.addEvent),
    );
  }
}
