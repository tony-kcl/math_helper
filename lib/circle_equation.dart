/// 圓形方程式 (x-h)^2 + (y-k)^2 = r^2, 圓心(h, k), 半徑r
/// Circle equtaion (x-h)^2 + (y-k)^2 = r^2, circumcenter (h, k), radius r
class CircleEquation {
  final double h;
  final double k;
  final double r;

  CircleEquation({
    required this.h,
    required this.k,
    required this.r,
  }) {
    assert(r >= 0, 'r should not be smaller than 0');
  }

  @override
  String toString() {
    return '(x-$h)^2 + (y-$k)^2 = $r^2';
  }
}