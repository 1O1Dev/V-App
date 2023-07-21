String formatNumber(int number) {
  if (number >= 1000 && number < 1000000) {
    return '${(number / 1000).toStringAsFixed(0)}k';
  } else if (number >= 1000000 && number < 1000000000) {
    return '${(number / 1000000).toStringAsFixed(0)}M';
  } else if (number >= 1000000000) {
    return '${(number / 1000000000).toStringAsFixed(0)}B';
  } else {
    return number.toString();
  }
}
