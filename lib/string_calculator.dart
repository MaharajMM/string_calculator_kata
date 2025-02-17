class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    }

    // Replace newlines with commas
    final normalizedInput = numbers.replaceAll('\n', ',');

    if (normalizedInput.contains(',')) {
      final parts = normalizedInput.split(',');
      return parts.map(int.parse).reduce((a, b) => a + b);
    }

    return int.parse(numbers);
  }
}
