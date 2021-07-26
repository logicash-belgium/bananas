import 'package:flutter_test/flutter_test.dart';
import 'dart:math';

// import SoT
import 'package:bananas/src/Counter.dart';

void main() {

// BASE TESTS
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

  // REACTIVE TESTS

  group('Counter Reactive functionality', () {

    test('Counter exists, is valid, and increments properly once via Rx', () {
      final Counter c = Counter();
      expect(c, isNotNull);
      expect(c.value, 0);
      expectLater(c.counterStream,
        emitsInOrder([emits(1)]),// NOTE: I can catchall with "anything"
          // NOTE: tests could also check for "emitsError" in case of error management, or "emitsDone" in case errors or other events close the stream
      );
      c.increment();
    });

    test('Counter exists, stream is closed properly when dispose is called', () {
      final Counter c = Counter();
      expect(c, isNotNull);
      expect(c.value, 0);
      expectLater(c.counterStream,
          emitsInOrder([emitsDone])
        );
      c.dispose();
    });
  });

}