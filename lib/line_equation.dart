/// 直線方程式 cy = ax + b
/// Line equation cy = ax + b
class LineEquation {
  final double a;
  final double b;
  final double c;
  LineEquation({
    required this.a,
    required this.b,
    required this.c,
  });

  @override
  String toString() {
    return '${c == 1 ? 'y' : c == 0 ? '0' : '${c}y'} = ${a == 1 ? 'x' : a == 0 ? '' : '${a}x'}${b == 0 ? '' : ' + $b'}';
  }
}