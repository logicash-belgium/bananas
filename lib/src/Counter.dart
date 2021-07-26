import 'package:rxdart/rxdart.dart';

class Counter {
  // TODO: convert to https://medium.com/flutter-community/why-use-rxdart-and-how-we-can-use-with-bloc-pattern-in-flutter-a64ca2c7c52d

  int _value = 0;
  int get value => _value;
  // Subjects are a type of Streams.
  BehaviorSubject<int> _subjectCounter = BehaviorSubject<int>();

  Stream get counterStream => _subjectCounter.stream;

   void increment() {
    _value++;
    _subjectCounter.sink.add(value);
   }

  void decrement() {
    _value--;
    _subjectCounter.sink.add(value);
  }

  void dispose() {
     _subjectCounter.close();
  }
}