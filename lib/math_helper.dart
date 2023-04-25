library math_helper;

import 'dart:math';
import 'dart:ui';

import 'package:tuple/tuple.dart';

import 'circle_equation.dart';
import 'line_equation.dart';

/// A class to assist users in Flutter to create and calculate various geometric relationships on coordinates.
class MathHelper {
   MathHelper._();

  /// 代入x求與圓的交點, 即求 x = ? 與 圓的交點
  /// Pass x to find the intersection point(s) with circle, means find the point(s) of intersection between the circle and x = ?
  static Tuple2<Offset, Offset> getIntersectionWithCircleByX(CircleEquation circle, double x) {
    const a = 1;
    final b = -2 * circle.k;
    final c = pow(circle.k, 2) - pow(circle.r, 2) + pow(x, 2) - 2 * x * circle.h + pow(circle.h, 2);
    final y1 = (-b + sqrt(pow(b, 2) - 4 * a *c)) / (2 * a);
    final y2 = (-b - sqrt(pow(b, 2) - 4 * a *c)) / (2 * a);
    return Tuple2(Offset(x, y1), Offset(x, y2));
  }

  /// 求圓形和直線的交點, 若傳入未相交的線則會回傳 null
  /// Calculate the intersection point(s) between given line equation and circle equation, 
  /// if there is no intersection point, then return null
  static Tuple2<Offset?, Offset?> getIntersectionBetweenCircleAndLine(LineEquation line, CircleEquation circle) {
    final h = circle.h;
    final k = circle.k;
    final r = circle.r;
    final a = line.a;
    final b = line.b;
    final c = line.c;

    // 下方為將直線方程式 化成 y = (ax + b) / c,
    // 之後 再將 y 代入 圓的方程式中得到一個 1元2次方程式
    // 再使用公式解 x = ((-b (+/-) 根號(b^2 - 4ac)) / 2a
    if (a == 0) {
      // b^2 - 4ac
      final result = pow(-2*h, 2) - 4*1*(h*h + b*b/c*c -2*b*k/c+k*k-r*r);
      if (result < 0) {
        // 代表無實根, 線跟圓沒有交點
        return const Tuple2(null, null);
      }
      // y = (ax + b) / c
      final y = b / c;
      // 此處為公式解 x = ((-b (+/-) 根號(b^2 - 4ac)) / 2a
      final x1 = (2*h + sqrt(pow(-2*h, 2) - 4*1*(h*h + b*b/c*c -2*b*k/c+k*k-r*r))) / 2;
      final x2 = (2*h - sqrt(pow(-2*h, 2) - 4*1*(h*h + b*b/c*c -2*b*k/c+k*k-r*r))) / 2;
      return Tuple2(Offset(x1, y), Offset(x2, y));
    } else if (c == 0) {
      // c = 0 代表求 x = -b/a 與圓的交點
      return getIntersectionWithCircleByX(circle, -b/a);
    } else {
      // b^2 - 4ac
      final result = pow(2*a*b-2*a*c*k-2*h*c*c, 2) - 4 *(a*a+c*c)*(b*b-2*b*c*k-(r*r-k*k-h*h)*(c*c));
      if (result < 0) {
        // 代表無實根, 線跟圓沒有交點
        return const Tuple2(null, null);
      }

      // 此處為公式解 x = ((-b (+/-) 根號(b^2 - 4ac)) / 2a,
      // 得到兩個 x
      final x1 = (-(2*a*b-2*a*c*k-2*h*c*c) + sqrt(pow(2*a*b-2*a*c*k-2*h*c*c, 2) - 4 *(a*a+c*c)*(b*b-2*b*c*k-(r*r-k*k-h*h)*(c*c)))) / (2*(a*a+c*c));
      final x2 = (-(2*a*b-2*a*c*k-2*h*c*c) - sqrt(pow(2*a*b-2*a*c*k-2*h*c*c, 2) - 4 *(a*a+c*c)*(b*b-2*b*c*k-(r*r-k*k-h*h)*(c*c)))) / (2*(a*a+c*c));
      // y = (ax + b) / c
      final y1 = (a * x1 + b) /c;
      final y2 = (a * x2 + b) /c;
      return Tuple2(Offset(x1, y1), Offset(x2, y2));
    }
  }

  /// 計算兩點之間的距離
  /// Calculate the point between two point
  static double getDistanceBetweenTwoPoint(Offset p1, Offset p2) {
    return sqrt(pow(p1.dx - p2.dx, 2) + pow(p1.dy - p2.dy, 2));
  }

  /// p1 為圓心, r為半徑 得到一個圓
  /// Calculate the circle equtation [CircleEquation], by passing the center point and radius
  static CircleEquation getCircleEquation(Offset p1, double r) {
    return CircleEquation(h: p1.dx, k: p1.dy, r: r);
  }

  /// 從兩點算出其直線方程式, cy = ax + b [LineEquation]
  /// According to the given points, calculate the line equation, cy = ax + b [LineEquation]
  static LineEquation getLineEquation(Offset p1, Offset p2) {
    if (p1 == p2) throw 'Should not pass the same point';
    final double a = (p1.dx - p2.dx) == 0 ? 1 : (p1.dy - p2.dy) / (p1.dx - p2.dx);
    final double b = (p1.dx - p2.dx) == 0 ? -p1.dx : p1.dy - a * p1.dx;
    return LineEquation(a: a, b: b, c: (p1.dx - p2.dx) == 0 ? 0 : 1);
  }

  /// 根據 x 及 直線方程式 求出 y, 如果 y 為任意數則回傳 null
  /// According to the given x and line equation to calculate y, if y is any number then return null
  static double? getYFromLineEquation(LineEquation line, double x) {
    if (line.c == 0) {
      return null;
    }
    return (line.a * x + line.b) / line.c;
  }

  /// 求 p1 與所給線的垂直方程式
  /// Get the perpendicular equation from p1 and given line equation
  static LineEquation getIntersection(LineEquation line, Offset p1) {
    if (line.a != 0) {
      double m = -line.c / line.a;
      double a = m;
      double b = -m * p1.dx + p1.dy;
      double c = 1;
      return LineEquation(a: a, b: b, c: c); 
    } else {
      return LineEquation(a: 1, b: -p1.dx, c: 0);
    }
  }

  /// 求兩直線方程式的交點, 如果沒有交點則會回傳 null
  /// Get the intersection point of two line equation, if there is no intersection point, will return null
  static Offset? getTwoLineIntersection(LineEquation line, LineEquation line2) {
    if (line.c != 0 && line2.c != 0) {
      if (line.a / line.c == line2.a / line2.c) {
        // 兩線平行沒有交點
        return null;
      }
    } else if (line.c == 0 && line2.c == 0) {
      // 兩線平行沒有交點
      return null;
    }

    double x = (line2.b * line.c - line2.c * line.b) / (line2.c * line.a - line.c * line2.a);
    late double y;
    if (line.c == 0) {
      y = line2.b / line2.c;
    } else {
      y = (line.a * x + line.b) / line.c;
    }
    return Offset(x, y);
  }

  /// 求點到線垂直相交的點
  /// Find the point of intersection between the given point and the given line perpendicular to it
  static Offset getPointVerticalToLine(LineEquation line, Offset p1) {
    return getTwoLineIntersection(getIntersection(line, p1), line)!;
  }

  /// 算點到直線之最短距離
  /// Calculate the shortest distance from the given point to the given line
  static double getPointToLineDistance(Offset p1, LineEquation line) {
    return (line.a * p1.dx + -line.c * p1.dy + line.b).abs() / sqrt(line.a * line.a + line.c * line.c);
  }

  /// 4個變數中取最小
  /// Take the minimum value among 4 variables
  static double min4(double a, double b, double c, double d) {
    final double e = (a < b) ? a : b;
    final double f = (c < d) ? c : d;
    return (e < f) ? e : f;
  }

  /// 4個變數中取最大
  /// Take the maximum value among 4 variables
  static double max4(double a, double b, double c, double d) {
    final double e = (a > b) ? a : b;
    final double f = (c > d) ? c : d;
    return (e > f) ? e : f;
  }

  /// 3個變數中取最大
  /// Take the maximum value among 3 variables
  static double max3(double a, double b, double c) {
    final d = max(a, b);
    return (d > c) ? d : c;
  }

  /// 3個變數中取最小
  /// Take the minimum value among 3 variables
  static double min3(double a, double b, double c) {
    final d = min(a, b);
    return (d < c) ? d : c;
  }

  /// p1 是否在 p2-p5組成的四邊形內, p2-p5需順時針輸入
  /// Check if p1 is inside the quadrilateral formed by p2-p5, where p2-p5 are entered in a clockwise order.
  static bool isPointInRect(Offset p1, Offset p2, Offset p3, Offset p4, Offset p5,) {
    final double a = (p3.dx - p2.dx) * (p1.dy - p2.dy) - (p3.dy - p2.dy) * (p1.dx - p2.dx);
    final double b = (p4.dx - p3.dx) * (p1.dy - p3.dy) - (p4.dy - p3.dy) * (p1.dx - p3.dx);
    final double c = (p5.dx - p4.dx) * (p1.dy - p4.dy) - (p5.dy - p4.dy) * (p1.dx - p4.dx);
    final double d = (p2.dx - p5.dx) * (p1.dy - p5.dy) - (p2.dy - p5.dy) * (p1.dx - p5.dx);
    if((a > 0 && b > 0 && c > 0 && d > 0) || (a < 0 && b < 0 && c < 0 && d < 0)) {
      return true;
    }

    return false;
  }

  /// 點是否在圓內或圓上
  /// Check if the given point is in the circle or not.
  static bool isPointInCircle(CircleEquation circle, Offset point) {
    final h = circle.h;
    final k = circle.k;
    final r = circle.r;
    if (r <= sqrt(pow(h-point.dx, 2) + pow(k-point.dy, 2))) {
      return false;
    } else {
      return true;
    }
  }
}
