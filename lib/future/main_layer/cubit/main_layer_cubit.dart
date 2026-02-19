import 'package:evently/future/main_layer/cubit/main_layer_sate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainLayerCubit extends Cubit<MainLayerSate> {
  MainLayerCubit() : super(MainLayerSate(currentIndex: 0));

  void onTap(int value) {
    emit(state.copyWith(currentIndex: value));
  }
}
