import 'dart:math';

extension DoubleExtension on double {
  double roundedPrecision(int places) {
    double mod = pow(10.0, places) as double;
    return ((this * mod).round().toDouble() / mod);
  }
}
