import 'package:evently/future/main_layer/cubit/main_layer_cubit.dart';
import 'package:evently/future/main_layer/cubit/main_layer_sate.dart';
import 'package:evently/test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../create_event/screen/create_event.dart';
import '../../../core/constant/manager/image_manager.dart';
import '../widget/bottom_nav_bar_item.dart';
import '../../profile/screen/profile.dart';
import '../../search/screen/event_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainLayer extends StatelessWidget {
  const MainLayer({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> tabs = [Profile(), EventSearch(), Profile(), CreateEvent()];
    return BlocProvider(
      create: (context) {
        return MainLayerCubit();
      },
      child: BlocBuilder<MainLayerCubit, MainLayerSate>(
        builder: (context, state) {
          return Scaffold(
            floatingActionButton: _buildFloatingActionBtn(),
            bottomNavigationBar: _buildBottomAppBar(context, state),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            extendBody: true,
            body: tabs[state.currentIndex],
          );
        },
      ),
    );
  }

  Widget _buildBottomAppBar(BuildContext context, MainLayerSate state) {
    final readCubit = context.read<MainLayerCubit>();
    return BottomAppBar(
      notchMargin: 5,
      child: BottomNavigationBar(
        currentIndex: state.currentIndex,
        onTap: readCubit.onTap,
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
