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
    test('Support newlines as delimiters', () {
      final calculator = StringCalculator();
      expect(calculator.add("1\n2,3"), equals(6));
      expect(calculator.add("1,2\n3"), equals(6));
    });
    test('Support custom delimiters', () {
      final calculator = StringCalculator();
      expect(calculator.add("//;\n1;2"), equals(3));
      expect(calculator.add("//.\n1.2.3"), equals(6));
    });
    test('Negative numbers throw an exception', () {
      final calculator = StringCalculator();
      expect(() => calculator.add("-1,2"), throwsA(isA<ArgumentError>()));
      expect(
          () => calculator.add("2,-4,3,-5"),
          throwsA(predicate(
              (e) => e is ArgumentError && e.message == "Negatives not allowed: -4, -5")));
    });
    test('Numbers bigger than 1000 are ignored', () {
      final calculator = StringCalculator();
      expect(calculator.add("2,1001"), equals(2));
      expect(calculator.add("1000,1"), equals(1001)); // 1000 is included
    });
    test('Support delimiters of any length', () {
      final calculator = StringCalculator();
      expect(calculator.add("//[***]\n1***2***3"), equals(6));
    });
    test('Support multiple delimiters', () {
      final calculator = StringCalculator();
      expect(calculator.add("//[*][%]\n1*2%3"), equals(6));
    });
    test('Support multiple delimiters with multiple characters', () {
      final calculator = StringCalculator();
      expect(calculator.add("//[**][%%]\n1**2%%3"), equals(6));
    });
  });
}
