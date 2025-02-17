class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    }

    final delimiterInfo = _extractDelimiters(numbers);
    final List<String> delimiters = delimiterInfo.delimiters;
    final String numbersToProcess = delimiterInfo.numbersToProcess;

    // Parse numbers
    final numberList = _parseNumbers(numbersToProcess, delimiters);

    // Check for negative numbers
    _validateNoNegatives(numberList);

    // Filter out numbers bigger than 1000
    final validNumbers = numberList.where((n) => n <= 1000).toList();

    return validNumbers.isEmpty ? 0 : validNumbers.reduce((a, b) => a + b);
  }

  // Extract delimiters and return remaining numbers
  _DelimiterInfo _extractDelimiters(String input) {
    List<String> delimiters = [','];
    String numbersToProcess = input;

    if (input.startsWith('//')) {
      final parts = input.split('\n');
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

    return _DelimiterInfo(delimiters, numbersToProcess);
  }

  // Parse numbers using the delimiters
  List<int> _parseNumbers(String input, List<String> delimiters) {
    // Replace all delimiters with a common one
    String processedInput = input;
    for (final delimiter in delimiters) {
      processedInput = processedInput.replaceAll(delimiter, ',');
    }
    processedInput = processedInput.replaceAll('\n', ',');

    final parts = processedInput.split(',');
    return parts.map((p) => p.isEmpty ? 0 : int.parse(p)).toList();
  }

  // Validate that there are no negative numbers
  void _validateNoNegatives(List<int> numbers) {
    final negatives = numbers.where((n) => n < 0).toList();
    if (negatives.isNotEmpty) {
      throw ArgumentError("Negatives not allowed: ${negatives.join(', ')}");
    }
  }
}

class _DelimiterInfo {
  final List<String> delimiters;
  final String numbersToProcess;

  _DelimiterInfo(this.delimiters, this.numbersToProcess);
}
