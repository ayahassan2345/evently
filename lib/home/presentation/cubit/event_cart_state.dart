class EventCartState {
  final List<int> allSelectedIndex;
  EventCartState({required this.allSelectedIndex});

  EventCartState copyWith({List<int>? allSelectedIndex}) {
    return EventCartState(
      allSelectedIndex: allSelectedIndex ?? this.allSelectedIndex,
    );
  }
}
