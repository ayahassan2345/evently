import 'package:evently/core/constant/functions/navigation.dart';
import 'package:evently/future/auth/register/screen/register.dart';
import 'package:evently/future/intro/on_boarding/cubit/on_boarding_cubit.dart';
import 'package:evently/future/intro/on_boarding/cubit/on_boarding_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constant/manager/icon_manager.dart';
import '../../../../core/constant/manager/color_manager.dart';
import '../../../../core/constant/manager/image_manager.dart';
import '../model/on_boarding_model.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return Scaffold(
      body: BlocProvider(
        create: (context) => IndicatorCubit(),
        child: BlocBuilder<IndicatorCubit, IndicatorState>(
          builder: (context, state) {
            final readCubit = context.read<IndicatorCubit>();
            return SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  spacing: 30,
                  children: [
                    _buildLogo(),
                    _buildPageView(context, controller, readCubit),
                    _buildIndicator(context, controller, readCubit, state),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildPageView(
    BuildContext context,
    PageController controller,
    IndicatorCubit readCubit,
  ) {
    return Expanded(
      child: PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        onPageChanged: readCubit.onPageChanged,
        itemCount: getOnBoardingModel(context).length,
        itemBuilder: (context, index) {
          final model = getOnBoardingModel(context)[index];
          return _buildOnBoarding(model, context);
        },
      ),
    );
  }

  Image _buildLogo() => Image.asset(ImageManager.onBoardingLogo);

  Widget _buildIndicator(
    BuildContext context,
    PageController controller,
    IndicatorCubit readCubit,
    IndicatorState state,
  ) {
    final IndicatorEffect effect = WormEffect(
      dotHeight: 8,
      dotWidth: 8,
      dotColor: Theme.of(context).colorScheme.inversePrimary,
      activeDotColor: ColorManager.primary,
    );
    void onPreviousPage() {
      controller.previousPage(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
    }

    void onNextPage() {
      controller.nextPage(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Visibility(
          visible: state.currentPage != 0,
          child: IconButton(
            onPressed: onPreviousPage,
            icon: Icon(
              IconManager.arrowBack,
              size: 30,
              color: ColorManager.primary,
            ),
          ),
        ),
        SmoothPageIndicator(
          controller: controller,
          count: getOnBoardingModel(context).length,
          effect: effect,
        ),
        IconButton(
          onPressed: () {
            readCubit.lastPage(context)
                ? pushReplacement(context, Register())
                : onNextPage();
          },
          icon: Icon(
            IconManager.arrowForward,
            size: 30,
            color: ColorManager.primary,
          ),
        ),
      ],
    );
  }

  Widget _buildOnBoarding(OnBoardingModel model, BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(model.imagePath),
          SizedBox(height: 30),
          Text(
            model.title,
            style: textTheme.titleMedium!.copyWith(color: ColorManager.primary),
          ),
          SizedBox(height: 30),
          Text(model.body, style: textTheme.headlineSmall),
        ],
      ),
    );
  }
}
