import 'package:evently/future/home/cubit/event_cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventCartCubit extends Cubit<EventCartState> {
  EventCartCubit() : super(EventCartState(allSelectedIndex: []));
  dynamic onFavourateClicked(int index) {
    state.allSelectedIndex.contains(index)
        ? state.allSelectedIndex.remove(index)
        : state.allSelectedIndex.add(index);
  }
}
