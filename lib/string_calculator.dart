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

    final parts =
        normalizedInput.contains(delimiter) ? normalizedInput.split(delimiter) : [numbersToProcess];

    final numberList = parts.map(int.parse).toList();

    // Check for negative numbers
    final negatives = numberList.where((n) => n < 0).toList();
    if (negatives.isNotEmpty) {
      throw ArgumentError("Negatives not allowed: ${negatives.join(', ')}");
    }

    return numberList.reduce((a, b) => a + b);
  }
}
