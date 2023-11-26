import 'dart:io';
import 'dart:math';

void main(List<String> arguments) async {
  final file = File('data/source.tsv');
  final lines = await file.readAsLines();

  final groupedLines = <String, List<String>>{};
  final random = Random();

  for (final line in lines) {
    final columns = line.split('\t');
    final dateStr = columns[4];

    try {
      final date = parseFromFromat(dateStr);
      String key = '${date.year}-${date.month < 12 ? date.month + 1 : 1}';

      if (date.day < 24) {
        key = '${date.year}-${date.month}';
      }

      if (!groupedLines.containsKey(key)) {
        groupedLines[key] = [];
      }

      groupedLines[key]?.add(line);
    } catch (e) {
      print(dateStr);
    }
  }

  final selectedLines = <List<String>>[];

  for (final group in groupedLines.values) {
    final count = (group.length * 0.15).round();
    group.shuffle(random);
    selectedLines.add(group.take(count).toList());
  }

  final outputFile = File('output.tsv');
  final output = StringBuffer();

  for (final group in selectedLines) {
    for (final line in group) {
      output.writeln(line);
    }

    output.writeln();
  }

  await outputFile.writeAsString(output.toString());
}

DateTime parseFromFromat(String dateStr) {
  final year = int.parse(dateStr.substring(0, 4));
  final month = int.parse(dateStr.substring(5, 7));
  final day = int.parse(dateStr.substring(8, 10));

  return DateTime(year, month, day);
}
