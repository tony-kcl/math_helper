Provides standard geometry mathematical functions including circle and linear equations, still updating.
It is very helpful while drawing lines and shapes on canvas.

## Features

1. Provide linear equation.
2. Provide circle equation.
3. Calculate the relation among linear, circle equation and points.

## Contents
* [Usage](#Usage)
    * [Linear Equation](#Linear-Euation)
    * [Circle Equation](#Circle-Equation)
    * [Distance](#Distance)
    * [Intersections](#Intersections)

## Usage
### Linear Euation
```dart
final line = MathHelper.getLineEquation(offset1, offset2);
```

### Circle Equation  
offset is center point, radius is radius of the circle.
```dart
final circle = MathHelper.getCircleEquation(offset, radius);
```

### Distance
```dart
/// Calculate the distacne between two point
final distance = MathHelper.getDistanceBetweenTwoPoint(offset1, offset2);
/// Find the point of intersection between the given point and the given line perpendicular to it
MathHelper.getPointVerticalToLine(line, offset);
```

### Intersections
```dart
/// Intersection between Line and Circle
MathHelper.getIntersectionBetweenCircleAndLine(line, circle);
/// Get the perpendicular equation from p1 and given linear equation
MathHelper.getIntersection(line, offset);
/// Get the intersection point of two linear equation, if there is no intersection point, will return null
MathHelper.getTwoLineIntersection(line, line2);
/// Find the point of intersection between the given point and the given line perpendicular to it
MathHelper.getPointVerticalToLine(line, offset);
```