import 'dart:math';


int calculate() {
  return 7 * 7;
}

////////////////////////////////////////////////////////////////////////////
//  https://developers.google.com/codelabs/from-java-to-dart#0
////////////////////////////////////////////////////////////////////////////

// 2. Create a simple Dart class

class Bicycle {
  int cadence;
  int _speed = 0;
  int get speed => _speed;
  int gear;

  Bicycle(this.cadence, this.gear);

  void applyBrake(int decrement) {
    _speed -= decrement;
  }

  void speedUp(int increment) {
    _speed += increment;
  }

  @override
  String toString() => 'Bicycle: $_speed mph';
}

// 3. Use optional parameters (instead of overloading)

class Point {
    final int x;
    final int y;
    //constructor
    const Point(this.x, this.y); 
}

class Rectangle {
    
    int width = 0;
    int height = 0;
    Point origin;

    // four constructors

    Rectangle({this.origin = const Point(0, 0), this.width = 0, this.height = 0});

    // a method for moving the rectangle
    void move(int x, int y) {
        //origin.x = x;
        //origin.y = y;
    }

    // a method for computing the area of the rectangle
    int getArea() {
        return width * height;
    }

    @override
    String toString() =>
          'Origin: (${origin.x}, ${origin.y}), width: $width, height: $height';
}

// 4. Create a factory

abstract class Shape {
  num get area;

  factory Shape(String type) {
    if (type == 'circle') return Circle(2);
    if (type == 'square') return Square(2);
    throw 'Can\'t create $type.';
  }

}

class Circle implements Shape {
  final num radius;
  Circle(this.radius);
  num get area => pi * pow(radius, 2);
}

class Square implements Shape {
  final num side;
  Square(this.side);
  num get area => pow(side, 2);
}

// 5. Implement an interface

class CircleMock implements Circle {
  @override
  // TODO: implement area
  //num get area => throw UnimplementedError();

  @override
  // TODO: implement radius
  //num get radius => throw UnimplementedError();

  num area = 0;
  num radius = 0;

}

// 6. Use Dart for functional programming

String scream(int length) => "A${'a' * length}h!";
