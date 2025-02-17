class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    }

    List<String> delimiters = [','];
    String numbersToProcess = numbers;

    // Check for custom delimiters
    if (numbers.startsWith('//')) {
      final parts = numbers.split('\n');
      String delimiterPart = parts[0].substring(2);

      if (delimiterPart.startsWith('[') && delimiterPart.endsWith(']')) {
        // Extract delimiters of any length
        final regex = RegExp(r'\[(.*?)\]');
        final matches = regex.allMatches(delimiterPart);
        delimiters = matches.map((match) => match.group(1)!).toList();
      } else {
        delimiters = [delimiterPart];
      }

      numbersToProcess = parts.sublist(1).join('\n');
    }

    // Replace all delimiters with a common one
    String processedInput = numbersToProcess;
    for (final delimiter in delimiters) {
      processedInput = processedInput.replaceAll(delimiter, ',');
    }
    processedInput = processedInput.replaceAll('\n', ',');

    final parts = processedInput.split(',');
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
