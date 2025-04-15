import 'package:flutter_riverpod/flutter_riverpod.dart';

final todoListProvider = StateNotifierProvider<TodoNotifier, List<String>>((ref) {
  return TodoNotifier();
});

class TodoNotifier extends StateNotifier<List<String>> {
  TodoNotifier() : super([]);

  void addTask(String task) {
    state = [...state, task];
  }
}
