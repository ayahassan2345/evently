import 'package:evently/future/home/cubit/event_cart_cubit.dart';
import 'package:evently/future/home/cubit/event_cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constant/manager/color_manager.dart';
import '../constant/manager/image_manager.dart';
import '../../future/home/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EventCart extends StatelessWidget {
  const EventCart({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocProvider(
      create: (context) {
        return EventCartCubit();
      },
      child: Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(bottom: 120),
                itemCount: getCartModel(context).length,
                itemBuilder: (context, index) {
                  return _buildHomeCart(textTheme, index, context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHomeCart(TextTheme textTheme, int index, BuildContext context) {
    final model = getCartModel(context)[index];
    final DecorationImage image = DecorationImage(
      image: AssetImage(model.cartImage),
      fit: BoxFit.fitWidth,
    );
    final BoxDecoration decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      image: image,
      border: BoxBorder.all(color: ColorManager.primary, width: 2),
    );
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
        width: double.infinity,
        height: 200,
        padding: EdgeInsets.all(8),
        decoration: decoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCartDate(textTheme, index, context),
            _buildCartTitle(textTheme, index, context),
          ],
        ),
      ),
    );
  }

  Card _buildCartTitle(TextTheme textTheme, int index, BuildContext context) {
    final model = getCartModel(context)[index];
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.antiAlias,
      color: Theme.of(context).colorScheme.primary,
      child: InkWell(
        onTap: () {},
        splashColor: ColorManager.primaryHighLight,
        child: Ink(
          padding: EdgeInsets.all(8),
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                child: Text(model.carttitle, style: textTheme.bodyLarge),
              ),
              BlocBuilder<EventCartCubit, EventCartState>(
                builder: (context, state) {
                  final readCubit = context.read<EventCartCubit>();
                  final indexExist = state.allSelectedIndex.contains(index);
                  return IconButton(
                    onPressed: readCubit.onFavourateClicked(index),
                    icon: SvgPicture.asset(
                      indexExist
                          ? ImageIconManager.selectedLove
                          : ImageIconManager.unselectedLove,
                      colorFilter: ColorFilter.mode(
                        ColorManager.primary,
                        BlendMode.srcIn,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildCartDate(
    TextTheme textTheme,
    int index,
    BuildContext context,
  ) {
    final model = getCartModel(context)[index];
    final BoxDecoration decoration = BoxDecoration(
      color: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(8),
    );
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: decoration,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            model.cartDay,
            style: textTheme.titleMedium!.copyWith(color: ColorManager.primary),
          ),
          Text(
            model.cartMonth,
            style: textTheme.bodyLarge!.copyWith(color: ColorManager.primary),
          ),
        ],
      ),
    );
  }
}
