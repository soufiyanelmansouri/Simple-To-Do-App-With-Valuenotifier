import 'package:flutter_test/flutter_test.dart';
import 'package:simple_to_do_app_with_valuenotifier/todo.dart';
import 'package:simple_to_do_app_with_valuenotifier/todo_contorller.dart';

void main() {
  late TodoController sut;

  setUp(() {
    sut = TodoController();
  });

  test('Test if the initial values are correct:', () {
    expect(sut.value, []);
    expect(sut.length, 0);
  });

  group('Testing the logic', () {
    Todo todo1 = Todo(description: "description");
    test("Test if the todo gets added to the list:", () {
      sut.addATodo(todo1);
      expect(sut.value, [todo1]);
      expect(sut.length, 1);
    });

    test("Test if the todo gets removed from the list!", () {
      sut.removeATodo(todo1);
      expect(sut.value, []);
      expect(sut.length, 0);
    });
  });
}
