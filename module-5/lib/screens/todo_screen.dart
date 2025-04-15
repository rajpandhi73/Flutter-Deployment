import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/todo_provider.dart';

class TodoScreen extends ConsumerWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoListProvider);
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("To-Do List"),
        backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(labelText: 'Enter task'),
            ),
            ElevatedButton(
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  ref.read(todoListProvider.notifier).addTask(controller.text);
                  controller.clear();
                }
              },
              child: const Text("Add Task"),
            ),
            const SizedBox(height: 20),
            const Text("Tasks:", style: TextStyle(fontSize: 18)),
            Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (_, index) => ListTile(
                  title: Text(todos[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
