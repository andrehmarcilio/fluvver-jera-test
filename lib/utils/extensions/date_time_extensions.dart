extension DateTimeFormating on DateTime {
  String formatBr() {
    return "${day.toString().padLeft(2, "0")}/${month.toString().padLeft(2, "0")}/$year";
  }
}
