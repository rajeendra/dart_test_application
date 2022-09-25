import 'dart:ffi';
import 'package:dart_test_application/test_util.dart' as util;
import 'package:dart_test_application/test_domain.dart' as td;

import 'package:dart_test_application/test_dart.dart' as test_dart;
import 'package:dart_test_application/test_asynchronous.dart' as azink;

void main(List<String> arguments) {
  
  print('Hello world: ${util.calculate()}!');
  print('Hello world: ${test_dart.calculate()}!');
  
  //funcOne();
  //funcTwo();
  azink.asyncMain();

}


funcTwo(){
  // Nullable variables

  //  1.
  //int a = null; // INVALID in null-safe Dart. variable of type int can’t have the value null:
  //int? a = null; // null assignment is not necccerry
  int? a;
  
  print(a);

  // 2.  Null-aware operators - ??=
  int z; // parameter is non-nullable
  //int z = 5; // provide a default value OR in parameter's mark as reuired
  //print(z);
  
  // Note: If the type of a parameter is non-nullable, 
  // then you must either provide a default value (as shown in the following code) 
  // or mark the parameter as required (as shown in the constructor section). 

  int? b; // = null
  b ??= 3;
  print(b); // <-- Prints 3.

  b ??= 5;
  print(b); // <-- Still prints 3.
 
  // 2.  Another null-aware operator is ??

  print(7 ?? 8); // <-- Prints 7.
  print(7 ?? null); // <-- Prints 7.
  print(null ?? 12); // <-- Prints 12.
  print(null ?? null); // <-- Prints null.

  // 3. Conditional property access

  // myObject?.someProperty
  // The preceding code is equivalent to the following:
  // (myObject != null) ? myObject.someProperty : null
  // You can chain multiple uses of ?. together in a single expression:
  // myObject?.someProperty?.someMethod()

  // 4. Collection literals

  final aListOfStrings = ['one', 'two', 'three']; // List of strings
  //final aListOfStrings = ['one', 'two', '', 'three']; // List of strings
  final aSetOfStrings = {'one', 'two', 'three'}; // set of strings
  final aMapOfStringsToInts = { // a Map Of Strings To Ints
    'one': 1,
    'two': 2,
    'three': 3,
  };

  // 5. Dart’s type inference
  // List<String>, Set<String>, Map<String, int>.

  final aListOfInts = <int>[];
  final aSetOfInts = <int>{};
  final aMapOfIntToDouble = <int, double>{};

  // 6. Arrow syntax

  // bool hasEmpty = aListOfStrings.any((s) {
  //   return s.isEmpty;
  // });
  // print(hasEmpty);

  // The preceding code is equivalent to the following: 
  bool hasEmpty = aListOfStrings.any((s) => s.isEmpty);
  print(hasEmpty);

  final cls = MyClass();
  print(cls.product);
  cls.incrementValue1();
  print(cls.value1);
  print(cls.joinWithCommas(aListOfStrings));

  // https://dart.dev/codelabs/dart-cheatsheet

  // 7. Cascades

  // To perform a sequence of operations on the same object, use cascades (..). 
  // We’ve all seen an expression like this:

  // myObject.someMethod()

  // var button = querySelector('#confirm');
  // button?.text = 'Confirm';
  // button?.classes.add('important');
  // button?.onClick.listen((e) => window.alert('Confirmed!'));
  // button?.scrollIntoView();

  // The preceding code is equivalent to the following:

  // querySelector('#confirm')
  //   ?..text = 'Confirm'
  //   ..classes.add('important')
  //   ..onClick.listen((e) => window.alert('Confirmed!'))
  //   ..scrollIntoView();

  final bo = BigObject();
  fillBigObject(bo);
  print(bo.aString);

  // 8. Getters and setters

  final gsc = MyGetSetClass();
  
  gsc.aProperty = -5;
  print(gsc.aProperty);
  gsc.aProperty = 5;
  print(gsc.aProperty);


  // 9. Optional positional parameters
  print(sumUpToFive(4));
  print(sumUpToFive(4,4));
  print(sumUpToFive(4,4,4));

  // 10. Named parameters
  printName('Dash', 'Dartisan');
  printName('John', 'Smith', middleName: 'Who');
  // Named arguments can be placed anywhere in the argument list
  printName('John', middleName: 'Who', 'Smith');

  // 11. Exceptions 

  // throw Exception('Something bad happened.');
  // throw 'Waaaaaaah!';

  // try {
  //   //breedMoreLlamas();

  // } on OutOfLlamasException {
  //   // A specific exception
  //   // buyMoreLlamas();

  // } on Exception catch (e) {
  //   // Anything else that is an exception
  //   print('Unknown exception: $e');

  // } catch (e) {
  //   // No specified type, handles all
  //   print('Something really unknown: $e');
  // }

  // rethrow

  // try {
  //   breedMoreLlamas();
  // } catch (e) {
  //   print('I was just trying to breed llamas!');
  //   rethrow;
  // }

  // finally

  // try {
  //   breedMoreLlamas();
  // } catch (e) {
  //   // ... handle exception ...
  // } finally {
  //   // Always clean up, even if an exception is thrown.
  //   cleanLlamaStalls();
  // }

  // 12. Using this in a constructor
  colorTest();

}

class MyClass {
  // 6. Arrow syntax
  int value1 = 2;
  int value2 = 3;
  int value3 = 5;

  // Returns the product of the above values:
  int get product => value1 * value2 * value3;
  
  // Adds 1 to value1:
  void incrementValue1() => value1++; 
  
  // Returns a string containing each item in the
  // list, separated by commas (e.g. 'a,b,c'): 
  String joinWithCommas(List<String> strings) => strings.join(',');
}

class BigObject {
  // 7. Cascades
  int anInt = 0;
  String aString = '';
  List<double> aList = [];
  bool _done = false;
  
  void allDone() {
    _done = true;
  }
}

BigObject fillBigObject(BigObject obj) {
  return obj
    ..anInt = 1
    ..aString = 'String!'
    ..aList.add(3)
    ..allDone();
}

class MyGetSetClass {
  // 8. Getters and setters
  int _aProperty = 0;

  int get aProperty => _aProperty;

  set aProperty(int value) {
    if (value >= 0) {
      _aProperty = value;
    }
  }

  final List<int> _values = [];

  void addValue(int value) {
    _values.add(value);
  }

  // A computed property.
  int get count {
    return _values.length;
  }

}

// 9. Optional positional parameters
int sumUpToFive(int a, [int? b, int? c, int? d, int? e]) {
  int sum = a;
  if (b != null) sum += b;
  if (c != null) sum += c;
  if (d != null) sum += d;
  if (e != null) sum += e;
  return sum;
}

// 10. Named parameters

void printName(String firstName, String lastName, {String? middleName}) {
  print('$firstName ${middleName ?? ''} $lastName');
}

// If the type of a parameter is non-nullable, 
// then you must either provide a default value (as shown in the following code) 
// or mark the parameter as required (as shown in the constructor section).
void printNameA(String firstName, String lastName, {String middleName = ''}) {
  print('$firstName $middleName $lastName');
}
void printNameB(String firstName, String lastName, {required String middleName}) {
  print('$firstName $middleName $lastName');
}

// 12. Using this in a constructor
void colorTest(){
  //MyColor mc = MyColor(red:0); // OK-4 
  //MyColor mc = MyColor(0); // OK-5 
  //MyColor mc = MyColor(red:0,green:0,blue:0); // OK-6 
  MyColor mc = MyColor(0,0,0); // OK-7 
}

class MyColor {
  int red;
  int green;
  int blue;

  MyColor(this.red, this.green, this.blue); // OK-7
  //MyColor({required this.red, required this.green, required this.blue}); // OK-6
  //MyColor([this.red = 0, this.green = 0, this.blue = 0]); // OK-5
  //MyColor({this.red = 0, this.green = 0, this.blue = 0}); // OK-4
}




funcOne(){
  //2. Create a simple Dart class
  var bike = test_dart.Bicycle(2, 1);
  print(bike);

  // 3. Use optional parameters (instead of overloading)
  print(test_dart.Rectangle(origin: const test_dart.Point(10, 20), width: 100, height: 200));
  print(test_dart.Rectangle(origin: const test_dart.Point(10, 10)));
  print(test_dart.Rectangle(width: 200));
  print(test_dart.Rectangle());

  // 4. Create a factory

  //final circle = test_dart.Circle(2);
  //final square = test_dart.Square(2);
  final circle = test_dart.Shape('circle');
  final square = test_dart.Shape('square');

  print(circle.area);
  print(square.area);

  // 6. Use Dart for functional programming
  final values = [1, 2, 3, 5, 10, 50];
  for (var length in values) {
    print(test_dart.scream(length));
  }

  values.map(test_dart.scream).forEach(print);  // Convert imperative code to functional

  values.skip(1).take(3).map(test_dart.scream).forEach(print);

  // to-do
  // async/await, which allows you to write asynchronous code as if it were synchronous. Check out this DartPad example, which animates the calculation of the first five decimals of π.
  // Method cascades, where everything is a builder!
  // Null aware operators

}