extension StringToDateTime on String {
  DateTime transformInDatetime() {
    return DateTime.parse('${substring(6)}-${substring(3, 5)}-${substring(0, 2)}');
  }
}
