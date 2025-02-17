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
    test('Two comma-separated numbers return their sum', () {
      final calculator = StringCalculator();
      expect(calculator.add("1,2"), equals(3));
      expect(calculator.add("10,20"), equals(30));
    });
    test('Multiple comma-separated numbers return their sum', () {
      final calculator = StringCalculator();
      expect(calculator.add("1,2,3"), equals(6));
      expect(calculator.add("1,2,3,4,5"), equals(15));
    });
  });
}
