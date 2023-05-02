Provides standard geometry mathematical functions including circle and linear equations, still updating.
It is very helpful while drawing lines and shapes on canvas.

## Features

1. Provide linear equation.
2. Provide circle equation.
3. Calculate the relations among linear, circle equation and points.

## Contents
* [Usage](#usage)
    * [Linear Equation](#linear-euation)
    * [Circle Equation](#circle-equation)
    * [Distance](#distance)
    * [Intersections](#intersections)

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
final distance = MathHelper.getPointVerticalToLine(line, offset);
```

### Intersections
```dart
/// Intersection between Line and Circle
final points = MathHelper.getIntersectionBetweenCircleAndLine(line, circle);
/// Get the perpendicular equation from p1 and given linear equation
final line = MathHelper.getIntersection(line, offset);
/// Get the intersection point of two linear equation, if there is no intersection point, will return null
final point = MathHelper.getTwoLineIntersection(line, line2);
/// Find the point of intersection between the given point and the given line perpendicular to it
final point = MathHelper.getPointVerticalToLine(line, offset);
```