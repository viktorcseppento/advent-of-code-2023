import 'dart:io';

const maxRed = 12;
const maxGreen = 13;
const maxBlue = 14;

int partOne(List<String> lines) {
  var sum = 0;
  for (var (idx, line) in lines.indexed) {
    var valid = true;
    final redNums = RegExp(r'(\d+) red')
        .allMatches(line)
        .map((match) => int.parse(match[1]!));
    if (redNums.any((element) => element > maxRed)) valid = false;
    final greenNums = RegExp(r'(\d+) green')
        .allMatches(line)
        .map((match) => int.parse(match[1]!));
    if (greenNums.any((element) => element > maxGreen)) valid = false;
    final blueNums = RegExp(r'(\d+) blue')
        .allMatches(line)
        .map((match) => int.parse(match[1]!));
    if (blueNums.any((element) => element > maxBlue)) valid = false;

    if (valid) sum += idx + 1;
  }
  return sum;
}

int partTwo(List<String> lines) {
  var sum = 0;
  for (var line in lines) {
    final redMin = RegExp(r'(\d+) red')
        .allMatches(line)
        .map((match) => int.parse(match[1]!))
        .reduce((value, element) => value > element ? value : element);
    final greenMin = RegExp(r'(\d+) green')
        .allMatches(line)
        .map((match) => int.parse(match[1]!))
        .reduce((value, element) => value > element ? value : element);
    final blueMin = RegExp(r'(\d+) blue')
        .allMatches(line)
        .map((match) => int.parse(match[1]!))
        .reduce((value, element) => value > element ? value : element);

    sum += redMin * greenMin * blueMin;
  }
  return sum;
}

void main(List<String> args) {
  final lines = File('./inputs/day02.txt').readAsLinesSync();

  print(partOne(lines));
  print(partTwo(lines));
}
