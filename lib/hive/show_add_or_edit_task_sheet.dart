import 'package:flutter/material.dart';

import '../../model/task_model.dart';
import 'hive_controller.dart';

void showAddOrEditTaskSheet({
  required BuildContext context,
  Map<String, dynamic>? task,
}) {
  final titleController =
  TextEditingController(text: task?['taskTitle']);

  final List<TextEditingController> subTasksController = [];
  final bool isEdit = task != null;

  // Prefill subtasks for edit
  if (isEdit) {
    for (var sub in task['subTasks']) {
      subTasksController.add(
        TextEditingController(text: sub['subtitle']),
      );
    }
  } else {
    subTasksController.add(TextEditingController());
  }

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (_) => Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 12,
        right: 12,
        top: 12,
      ),
      child: StatefulBuilder(
        builder: (context, setState) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🔹 Title
                TextField(
                  controller: titleController,
                  decoration:
                  const InputDecoration(labelText: 'Task Title'),
                ),

                const SizedBox(height: 12),

                // 🔹 SubTasks
                ...List.generate(subTasksController.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: TextField(
                      controller: subTasksController[index],
                      decoration: InputDecoration(
                        labelText: 'Subtitle ${index + 1}',
                        suffixIcon: subTasksController.length > 1
                            ? IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            setState(() {
                              subTasksController.removeAt(index);
                            });
                          },
                        )
                            : null,
                      ),
                    ),
                  );
                }),

                // 🔹 Add Subtitle Button
                TextButton.icon(
                  onPressed: () {
                    setState(() {
                      subTasksController.add(TextEditingController());
                    });
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Add Subtitle'),
                ),

                const SizedBox(height: 16),

                // 🔹 Add / Update Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (titleController.text.trim().isEmpty) return;

                      // Convert to SubTask list
                      final List<SubTask> subTasks =
                      subTasksController
                          .where((e) => e.text.trim().isNotEmpty)
                          .map(
                            (e) => SubTask(
                          subtitle: e.text.trim(),
                          workList: [],
                        ),
                      )
                          .toList();

                      final newTask = TaskModel(
                        taskTitle: titleController.text.trim(),
                        taskDate: DateTime.now(),
                        subTasks: subTasks,
                      );

                      final controller = TaskHiveController(
                        context: context,

                      );


                        controller.createTask(newTask);

                    },
                    child: Text(
                       'Add Task',
                    ),
                  ),
                ),

                const SizedBox(height: 12),
              ],
            ),
          );
        },
      ),
    ),
  );
}
