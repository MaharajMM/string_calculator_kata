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
      String delimiterPart = parts[0].substring(2);

      // Check for delimiters of any length
      if (delimiterPart.startsWith('[') && delimiterPart.endsWith(']')) {
        delimiter = delimiterPart.substring(1, delimiterPart.length - 1);
      } else {
        delimiter = delimiterPart;
      }

      numbersToProcess = parts.sublist(1).join('\n');
    }

    // Replace newlines with the delimiter
    final normalizedInput = numbersToProcess.replaceAll('\n', delimiter);

    final parts =
        normalizedInput.contains(delimiter) ? normalizedInput.split(delimiter) : [numbersToProcess];

    final numberList = parts.map((p) => p.isEmpty ? 0 : int.parse(p)).toList();

    // Check for negative numbers
    final negatives = numberList.where((n) => n < 0).toList();
    if (negatives.isNotEmpty) {
      throw ArgumentError("Negatives not allowed: ${negatives.join(', ')}");
    }

    // Filter out numbers bigger than 1000
    final validNumbers = numberList.where((n) => n <= 1000).toList();

    return validNumbers.isEmpty ? 0 : validNumbers.reduce((a, b) => a + b);
  }
}
