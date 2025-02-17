import 'package:test/test.dart';
import '../lib/string_calculator.dart';

void main() {
  group('StringCalculator', () {
    test('Empty string returns 0', () {
      final calculator = StringCalculator();
      expect(calculator.add(""), equals(0));
    });

    test('Single number returns the number itself', () {
      final calculator = StringCalculator();
      expect(calculator.add("1"), equals(1));
      expect(calculator.add("42"), equals(42));
    });
  });
}
