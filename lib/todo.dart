import 'package:uuid/uuid.dart';

class Todo {
  final String id;
  final String description;

  Todo({required this.description}) : id = const Uuid().v4();
}
