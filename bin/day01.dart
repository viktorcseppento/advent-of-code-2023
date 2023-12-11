import 'dart:io';

const List<String> nubmerStrings = [
  'one',
  'two',
  'three',
  'four',
  'five',
  'six',
  'seven',
  'eight',
  'nine'
];

int partOne(List<String> lines) {
  return lines.map((line) {
    // Parse all the numbers
    var nums = line.split('').map((char) => int.tryParse(char)).nonNulls;
    // If there is only one number then the first and the last elements are the same
    return 10 * nums.first + nums.last;
  }).reduce((value, element) => value + element);
}

int partTwo(List<String> lines) {
  return lines.map((line) {
    int? firstDigit;
    int? secondDigit;
    // Go through the indices of the line
    for (var idx = 0; idx < line.length; idx++) {
      var digit = int.tryParse(line[idx]);

      // If it is not a number then try parse as a number string
      if (digit == null) {
        for (final (numIdx, numString) in nubmerStrings.indexed) {
          if (idx + numString.length > line.length) continue;
          // If the number string starts at the current index then that is the digit
          if (line.substring(idx, idx + numString.length) == numString) {
            digit = numIdx + 1;
            break;
          }
        }
        if (digit == null) continue;
      }

      // Assign to the first digit if it is null
      firstDigit ??= digit;
      // Always overwrite the second digit
      secondDigit = digit;
    }
    return 10 * firstDigit! + secondDigit!;
  }).reduce((value, element) => value + element);
}

void main(List<String> args) {
  final lines = File('./inputs/day01.txt').readAsLinesSync();

  print(partOne(lines));
  print(partTwo(lines));
}
