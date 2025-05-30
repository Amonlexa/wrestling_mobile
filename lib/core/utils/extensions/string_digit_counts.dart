extension StringDigitExtensions on String {
  int digitCount() {
    return replaceAll(RegExp(r'[^0-9]'), '').length;
  }
}