extension StringExtensions on String {
  double toDouble() {
    // Remove all non-numeric characters except the decimal point
    String cleanString = replaceAll(RegExp(r'[^0-9.]'), '');
    return double.tryParse(cleanString) ?? 0.0;
  }
}
