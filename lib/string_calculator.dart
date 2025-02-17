class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    }

    String delimiter = ',';
    String numbersToProcess = numbers;

    // Check for custom delimiter
    if (numbers.startsWith('//')) {
      final parts = numbers.split('\n');
      delimiter = parts[0].substring(2);
      numbersToProcess = parts.sublist(1).join('\n');
    }

    // Replace newlines with the delimiter
    final normalizedInput = numbersToProcess.replaceAll('\n', delimiter);

    if (normalizedInput.contains(delimiter)) {
      final parts = normalizedInput.split(delimiter);
      return parts.map(int.parse).reduce((a, b) => a + b);
    }

    return int.parse(numbersToProcess);
  }
}
