extension FormatterDuration on Duration {
  String toTime() {
    final minutes = (inMinutes % 60).toString();
    final seconds = (inSeconds % 60).toString();
    return '${minutes.padLeft(2, '0')}:${seconds.padLeft(2, '0')}';
  }
}

extension FormatterDouble on double {
  String toTime() {
    final minutes = (this / 60).floor().toString();
    final seconds = (this % 60).floor().toString();
    return '${minutes.padLeft(2, '0')}:${seconds.padLeft(2, '0')}';
  }
}
