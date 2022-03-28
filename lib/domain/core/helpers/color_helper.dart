import 'dart:ui';

import 'package:dartz/dartz.dart';

import 'failure.dart';

class ColorHelper {
  static double getColorGrayscale({required Color color}) {
    int red = color.red;
    int green = color.green;
    int blue = color.blue;
    return (0.299 * red) + (0.587 * green) + (0.114 * blue);
  }
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Either<Failure, Color> fromHex(String hexString) {
    hexString = hexString.trim();
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceAll('#', ''));
    try {
      int integer = int.parse(buffer.toString(), radix: 16);
      if (integer < 0) throw FormatException();
      return Right(Color(integer));
    } on FormatException {
      return Left(HexColorFailure());
    }
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

class HexColorFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
