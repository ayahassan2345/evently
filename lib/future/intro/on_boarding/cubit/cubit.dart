import 'package:evently/future/intro/on_boarding/cubit/state.dart';
import 'package:evently/future/intro/on_boarding/model/on_boarding_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IndicatorCubit extends Cubit<IndicatorState> {
  IndicatorCubit() : super(IndicatorState(currentPage: 0));

  void onPageChanged(int value) {
    emit(state.copyWith(currentPage: value));
  }

  bool lastPage() {
    final int lastPage = onBoardingModel.length - 1;
    return state.currentPage == lastPage;
  }
}
