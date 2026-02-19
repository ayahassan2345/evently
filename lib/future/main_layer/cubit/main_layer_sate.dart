class MainLayerSate {
  final int currentIndex;

  MainLayerSate({required this.currentIndex});
  MainLayerSate copyWith({int? currentIndex}) {
    return MainLayerSate(currentIndex: currentIndex ?? this.currentIndex);
  }
}
