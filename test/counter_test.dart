import 'package:flutter_test/flutter_test.dart';
import 'dart:math';

// import SoT
import 'package:bananas/src/Counter.dart';

void main() {
  group('Counter base functionality', () {
  test('Counter exists, is valid, and increments properly once', () {
    final Counter c = Counter();
    expect(c, isNotNull);
    expect(c.value, 0);
    c.increment();
    expect(c.value, 1);
  });

  test('Counter exists, is valid, and increments properly a random amount up to 300', () {
    final Counter c = Counter();
    expect(c, isNotNull);
    expect(c.value, 0);
    var rng = Random(DateTime.now().microsecondsSinceEpoch);
    final repetitions = rng.nextInt(300);
    for (var i = 0; i < repetitions; i++) {
      c.increment();
    }
    expect(c.value, repetitions);
  });

  test('Counter exists, is valid, and decrements properly once', () {
    final Counter c = Counter();
    expect(c, isNotNull);
    expect(c.value, 0);
    c.decrement();
    expect(c.value, -1);
  });

  test('Counter exists, is valid, and decrements properly a random amount up to 300', () {
    final Counter c = Counter();
    expect(c, isNotNull);
    expect(c.value, 0);
    var rng = Random(DateTime.now().microsecondsSinceEpoch);
    final repetitions = rng.nextInt(300);
    for (var i = 0; i < repetitions; i++) {
      c.decrement();
    }
    expect(c.value, -repetitions);
  });

  }); // closes Group "Counter base functionality"
}