import 'package:evently/future/event_detail/event_detail.dart';

import '../create_event/screen/create_event.dart';
import '../../core/constant/manager/image_manager.dart';
import '../home/screen/home.dart';
import 'widget/bottom_nav_bar_item.dart';
import '../profile/screen/profile.dart';
import '../search/screen/event_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainLayer extends StatefulWidget {
  const MainLayer({super.key});
  
  @override
  State<MainLayer> createState() => _MainLayerState();
}

class _MainLayerState extends State<MainLayer> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<Widget> tabs = [EventDetail(), EventSearch(), Profile(),CreateEvent()];
    return Scaffold(
      floatingActionButton: _buildFloatingActionBtn(),
      bottomNavigationBar: _buildBottomAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: true,
      body: tabs[currentIndex],
    );
  }

  Widget _buildBottomAppBar() {
    return BottomAppBar(
      notchMargin: 5,
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) => setState(() => currentIndex = value),
        items: items,
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
