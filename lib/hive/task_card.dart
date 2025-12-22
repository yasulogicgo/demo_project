import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'hive_controller.dart';

class TaskCard extends StatelessWidget {
  final Map<String, dynamic> task;
  final TaskHiveController controller;

  const TaskCard({
    super.key,
    required this.task,
    required this.controller,
  });

  double calculateProgress() {
    final subTasks = task['subTasks'] as List;
    int total = 0;
    int done = 0;

    for (var sub in subTasks) {
      for (var work in sub['workList']) {
        total++;
        if (work['isDone'] == true) done++;
      }
    }
    return total == 0 ? 0 : done / total;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final List subTasks = task['subTasks'];
    final progress = calculateProgress();

    return Card(
      color: colors.surface,
      margin: EdgeInsets.all(12.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔹 Title
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  task['taskTitle'],
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                 Row(
                  crossAxisAlignment: .end,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, size: 18.sp),
                      onPressed: () => _showUpdateTaskDialog(
                        context,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, size: 18.sp, ),
                      onPressed: () => _showDeleteTaskDialog(context),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 6.h),
            Text("${ calculateProgress()}"),

            /// 🔹 Progress
            LinearProgressIndicator(
              value: progress,
              minHeight: 5.h,
              backgroundColor: colors.surfaceVariant,
              valueColor: AlwaysStoppedAnimation(colors.primary),
            ),

            SizedBox(height: 10.h),

            /// 🔹 SubTasks
            ...List.generate(subTasks.length, (subIndex) {
              final subTask = subTasks[subIndex];

              return ExpansionTile(
                tilePadding: EdgeInsets.zero,
                title: Row(
                  children: [
                    Expanded(
                      child: Text(
                        subTask['subtitle'],
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.edit, size: 18.sp),
                      onPressed: () =>
                          _showUpdateSubTaskDialog(context, subIndex),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, size: 18.sp),
                      onPressed: () =>
                          _showDeleteSubTaskDialog(context, subIndex),
                    ),
                  ],
                ),
                children: [
                  /// 🔹 Work Items
                  ...List.generate(subTask['workList'].length, (workIndex) {
                    final work = subTask['workList'][workIndex];

                    return ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 4.w),
                      leading: Checkbox(
                        value: work['isDone'] ?? false,
                        onChanged: (_) {
                          controller.toggleWorkStatus(
                            task['key'],
                            subIndex,
                            workIndex,
                          );
                        },
                      ),
                      title: Text(
                        work['title'],
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontSize: 13.sp,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, size: 18.sp),
                            onPressed: () => _showUpdateWorkDialog(
                              context,
                              subIndex,
                              workIndex,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, size: 18.sp, color: Colors.red),
                            onPressed: () => _showDeleteWorkDialog(
                              context,
                              subIndex,
                              workIndex,
                            ),
                          ),
                        ],
                      ),

                    );
                  }),

                  /// 🔹 Add Work
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton.icon(
                      icon: Icon(Icons.add, size: 18.sp),
                      label: Text(
                        'Add Work',
                        style: TextStyle(fontSize: 13.sp),
                      ),
                      onPressed: () =>
                          _showAddWorkItemDialog(context, subIndex),
                    ),
                  ),
                ],
              );
            }),

            /// 🔹 Add SubTask
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                icon: Icon(Icons.add, size: 18.sp),
                label: Text(
                  'Add SubTask',
                  style: TextStyle(fontSize: 13.sp),
                ),
                onPressed: () => _showAddSubTaskDialog(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ================= DIALOGS =================

  void _showDeleteTaskDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Delete Task'),
        content: const Text(
          'Are you sure you want to delete this task?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            onPressed: () {
              controller.deleteTask(
                task['key'],
              );
            },
            child: const Text('Delete'),
          ),
        ]
      ),
    );
  }
  void _showUpdateTaskDialog(
      BuildContext context,

      ) {
    final textController = TextEditingController(
      text: task['taskTitle'],
    );

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Update Work Item'),
        content: TextField(controller: textController),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              controller.editTask(
                textController.text,
                task['key'],
              );
            },
            child: const Text('Update'),
          ),
        ],
      ),
    );
  }


  void _showAddWorkItemDialog(BuildContext context, int subIndex) {
    final controllerText = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Add Work Item'),
        content: TextField(controller: controllerText),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              controller.addWorkItem(
                task['key'],
                subIndex,
                controllerText.text,
              );
              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  void _showUpdateWorkDialog(
      BuildContext context,
      int subIndex,
      int workIndex,
      ) {
    final textController = TextEditingController(
      text: task['subTasks'][subIndex]['workList'][workIndex]['title'],
    );

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Update Work Item'),
        content: TextField(controller: textController),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              controller.updateWorkItem(
                task['key'],
                subIndex,
                workIndex,
                textController.text,
              );
              Navigator.pop(context);
            },
            child: const Text('Update'),
          ),
        ],
      ),
    );
  }

  void _showDeleteWorkDialog(
      BuildContext context,
      int subIndex,
      int workIndex,
      ) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Delete Work Item'),
        content: const Text(
          'Are you sure you want to delete this work item?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            onPressed: () {
              controller.deleteWorkItem(
                task['key'],
                subIndex,
                workIndex,
              );
              Navigator.pop(context);
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }


  void _showAddSubTaskDialog(BuildContext context) {
    final controllerText = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Add SubTask'),
        content: TextField(controller: controllerText),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              controller.addSubTask(
                task['key'],
                controllerText.text,
              );
              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  void _showUpdateSubTaskDialog(BuildContext context, int subIndex) {
    final textController = TextEditingController(
      text: task['subTasks'][subIndex]['subtitle'],
    );

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Update SubTask'),
        content: TextField(controller: textController),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              controller.updateSubTask(
                task['key'],
                subIndex,
                textController.text,
              );
              Navigator.pop(context);
            },
            child: const Text('Update'),
          ),
        ],
      ),
    );
  }


  void _showDeleteSubTaskDialog(BuildContext context, int subIndex) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Delete SubTask'),
        content: const Text(
          'Are you sure you want to delete this subtask?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            onPressed: () {
              controller.deleteSubTask(
                task['key'],
                subIndex,
              );
              Navigator.pop(context);
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

}
