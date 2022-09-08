extension ListFormating on List<String> {
  String formatWayPoints() {
    String result = "";
    for (int i = 0; i <length; i++) {
      if (i == 0) {
        result = "place_id:${this[i]}";
      } else {
        result += "|place_id:${this[i]}";
      }
    }
    return result;
  }
}