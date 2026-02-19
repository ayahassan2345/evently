class IndicatorState {
  final int currentPage;

  IndicatorState({required this.currentPage});

  IndicatorState copyWith({int? currentPage,}) {
    return IndicatorState(currentPage: currentPage ?? this.currentPage);
  }
}
