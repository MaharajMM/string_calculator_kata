# String Calculator TDD Kata in Dart

This repository contains my implementation of the String Calculator TDD Kata in Dart, following Test-Driven Development principles.

## Overview

The String Calculator is a simple utility that parses string inputs containing numbers and returns their sum, following specific rules for delimiter handling, input validation, and edge cases.

## Requirements

The kata was implemented incrementally, following these requirements:

1. Create an empty `add` method that returns 0 for an empty string
2. Support single numbers (e.g., "1" should return 1)
3. Support two comma-separated numbers (e.g., "1,2" should return 3)
4. Support multiple comma-separated numbers
5. Allow newlines as delimiters (e.g., "1\n2,3" should return 6)
6. Support custom delimiters (e.g., "//;\n1;2" should return 3)
7. Throw an exception for negative numbers with the message "Negatives not allowed: [negatives]"
8. Ignore numbers larger than 1000
9. Support delimiters of any length (e.g., "//[***]\n1***2***3" should return 6)
10. Support multiple delimiters (e.g., "//[*][%]\n1*2%3" should return 6)
11. Support multiple delimiters with multiple characters (e.g., "//[**][%%]\n1**2%%3" should return 6)

## Project Structure

```
string_calculator_kata/
├── lib/
│   └── string_calculator.dart  # Main implementation
├── test/
│   └── string_calculator_test.dart  # Test suite
└── pubspec.yaml  # Dependencies
```

## Setup and Running Tests

### Prerequisites

- Dart SDK (version 2.17.0 or higher)

### Installation

1. Clone this repository
2. Navigate to the project directory
3. Install dependencies:
   ```bash
   dart pub get
   ```

### Running Tests

```bash
dart test
```

## Development Process

This project was developed following Test-Driven Development (TDD) principles:

1. Write a failing test
2. Write the minimal amount of code to make the test pass
3. Refactor for cleaner code
4. Repeat for each requirement

Each step was committed separately to show the progression through the requirements.

## TDD Benefits Demonstrated

- Incremental development
- Clear requirements and expectations
- Immediate feedback on implementation
- Comprehensive test coverage
- Confidence in refactoring
- Self-documenting code

## Key Features

- Parsing of delimited strings
- Support for custom and multiple delimiters
- Validation of input (negative numbers)
- Filtering of values (numbers > 1000)
- Clean, maintainable code structure

## Lessons Learned

Through this kata, I practiced:
- Writing focused, incremental tests
- Building functionality one requirement at a time
- Refactoring safely with tests as a safety net
- Handling edge cases and error conditions
