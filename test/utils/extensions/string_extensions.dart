import 'package:flutter_test/flutter_test.dart';
import 'package:muvver_jera_teste/utils/extensions/string_extensions.dart';

void main() {
  test(
      "deve retornar um Datetime quando a função de extensão .transformInDatetime() for chamada",
      () async {
    // Arraje
    String dateString = "09/09/2022";

    // Act
    DateTime dateTime = dateString.transformInDatetime();

    // Assert
    expect(dateTime, isA<DateTime>());
  });
}
